//------------------------------------------------------------------------------------------------------
// *****************************************************************************************************
//                                         - PolyMass -
//                            Convert Vertex Map to Polygon Selection 
//                            Convert Polygon Selection to Vertex Map
//                      Copyright (c) 2012 Keith Young, all rights reserved
//
// Author: Keith Young
// e-mail: typhoon@jetbroadband.com
//    web: http://skinprops.com
//
// License:
// PolyMass by Keith Young is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 3.0
// Unported License ( http://creativecommons.org/licenses/by-nc-sa/3.0/ ).
//
// *****************************************************************************************************
//------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------
// This plugin is originally based on some COFFEE code from Darter (David Wickenden), found in this thread:
//
//        http://forums.cgsociety.org/showthread.php?f=182&t=998296
//
// ...I added the "Weight Treshold" idea from Yader and then also added a Polygon Vertex (count)
// Threshold (so you can specify how many of the vertices of the polygon must meet the Weight Threshold).
//
// Note that setting the Poly Vert Threshold to 0 causes all polys to be selected, regardless of the
// weighting (although setting the Weight threshold to 0 doesn't causes all polys to be selected).
//
// The tag now also has an option to convert from a Polygon Selection to a Vertex Map.
//------------------------------------------------------------------------------------------------------
#include "c4d.h"
#include "c4d_symbols.h"
#include "tpolymassexp.h"

#ifndef _POLYMASS_H
#include "polymass.h"
#endif

class PolyMass : public TagData
{
	INSTANCEOF(PolyMass, TagData)
private:
	EXECUTIONRESULT VertMapToPolySel(BaseContainer *pTagData, BaseDocument *doc, PolygonObject *pPolyObj);
	EXECUTIONRESULT PolySelToVertMap(BaseContainer *pTagData, BaseDocument *doc, PolygonObject *pPolyObj);
public:
	virtual Bool Init(GeListNode *node);
	virtual Bool Message(GeListNode* node, LONG type, void* data);
	virtual EXECUTIONRESULT Execute(BaseTag *tag, BaseDocument *doc, BaseObject *op, BaseThread *bt, LONG priority, EXECUTIONFLAGS flags);
	virtual Bool GetDEnabling(GeListNode* node, const DescID& id, const GeData& t_data, DESCFLAGS_ENABLE flags, const BaseContainer* itemdesc);

	static NodeData *Alloc(void)	{ return gNew PolyMass; }
};


//---------------------------------------------------------------------------------
// Init is called when a fresh tag gets allocated
//---------------------------------------------------------------------------------
Bool PolyMass::Init(GeListNode *node)
{
	BaseTag			*tag  = (BaseTag*)node;
	BaseContainer	*data = tag->GetDataInstance();

	data->SetReal(POLYMASS_THRESHOLD, 0.5);
	data->SetLong(POLYMASS_VERTTHRESH, 2);

	return true;
}


//---------------------------------------------------------------------------------
// Message() - Handle various system Messages()
//---------------------------------------------------------------------------------
Bool PolyMass::Message(GeListNode* node, LONG type, void* data)
{
	BaseTag *tag			= (BaseTag*)node;
	BaseContainer *pTagData	= tag->GetDataInstance();

	//---------------------------------------------------------------------------------
	// if the user is dropping links, check that the Polygon Selection tag and/or the
	// Vertex Map tag are linked to the same mesh that this tag is linked to (if not,
	// the drag-n-drop action will be denied)
	// [this is primarly done so we can make some assumptions about the sizes of various
	// point/poly/weight lists]
	//---------------------------------------------------------------------------------
	if(type == MSG_DESCRIPTION_CHECKDRAGANDDROP)
	{
		DescriptionCheckDragAndDrop *dcu = static_cast<DescriptionCheckDragAndDrop*>(data);
		switch (dcu->id[0].id) 
		{
			//======== Polygon Selection =========
			case POLYMASS_POLYTAGLINK:
				dcu->result = (dcu->element->GetType() == Tpolygonselection) && (static_cast<BaseTag*>(dcu->element)->GetObject() == tag->GetObject());
				return true;

			//=========== Vertex Map =============
			case POLYMASS_VMAPTAGLINK:
				dcu->result = (dcu->element->GetType() == Tvertexmap) && (static_cast<BaseTag*>(dcu->element)->GetObject() == tag->GetObject());
				return true;
		}
	}
	//---------------------------------------------------------------------------------
	// we can use this to swap out the icon being used, depending on which map mode is
	// enabled...
	//---------------------------------------------------------------------------------
	else if(type == MSG_GETCUSTOMICON)
	{
		GetCustomIconData *icon = (GetCustomIconData*)data;
		if( pTagData->GetLong(POLYMASS_MAPMODE) == MAPMODE_VMAPTOPOLY )
		{
			// Vertex Map to Polygon Selection
			if( GetIcon(V2P_ICONID,icon->dat))
			{
				icon->filled=TRUE;
				return true;
			}
		}
		else
		{
			// Polygon Selection to Vertex Map
			if( GetIcon(P2V_ICONID,icon->dat))
			{
				icon->filled=TRUE;
				return true;
			}
		}
	}
	
	return SUPER::Message(node, type, data);
}

//---------------------------------------------------------------------------------
// GetDEnabling()
//
// Determine which parameters/GUI items should be enabled.
//---------------------------------------------------------------------------------
Bool PolyMass::GetDEnabling(GeListNode* node, const DescID& id,const GeData& t_data, DESCFLAGS_ENABLE flags, const BaseContainer* itemdesc)
{
	BaseTag *tag			= (BaseTag*)node;
	BaseContainer *pTagData	= tag->GetDataInstance();

	switch (id[0].id)
	{
		// the threshold values are only needed for Vertex Map -> Poly Selection mode
		case POLYMASS_THRESHOLD:
		case POLYMASS_VERTTHRESH:
			return pTagData->GetLong(POLYMASS_MAPMODE) == MAPMODE_VMAPTOPOLY;
	}

	return SUPER::GetDEnabling(node, id, t_data, flags, itemdesc);
}

//---------------------------------------------------------------------------------
// Execute()
//
// This is the meat of the expression tag functionality...
//---------------------------------------------------------------------------------
EXECUTIONRESULT PolyMass::Execute(BaseTag *tag, BaseDocument *doc, BaseObject *op, BaseThread *bt, LONG priority, EXECUTIONFLAGS flags)
{
	//---------------------------------------------------------------------------------
	// Error-checking strategy...
	// If the tag is just not set up (or correctly) yet, just pretend everything went
	// fine. If there was some problem allocating memory or retrieving some pointer,
	// then use the out-of-memory return.
	//---------------------------------------------------------------------------------
	if( !op || !tag || !doc )		return EXECUTIONRESULT_OK;
	if( op->GetType() != Opolygon )	return EXECUTIONRESULT_OK;

	// retrieve the needed info from the tag...
	BaseContainer *pTagData = tag->GetDataInstance();
	if( !pTagData )					return EXECUTIONRESULT_OUTOFMEMORY;		// this one probably can't fail, but it never hurts to do error-checking

	if( pTagData->GetLong(POLYMASS_MAPMODE) == MAPMODE_VMAPTOPOLY )
		return this->VertMapToPolySel(pTagData, doc, ToPoly(op));
	else
		return this->PolySelToVertMap(pTagData, doc, ToPoly(op));
}

//---------------------------------------------------------------------------------
// VertMapToPoly()
//
// This routine sets up a Poly Selection tag based on a Vertex Map tag...
//---------------------------------------------------------------------------------
EXECUTIONRESULT PolyMass::VertMapToPolySel(BaseContainer *pTagData, BaseDocument *doc, PolygonObject *pPolyObj)
{
	SelectionTag *pSelTag = (SelectionTag *)pTagData->GetLink(POLYMASS_POLYTAGLINK, doc);
	if( !pSelTag )					return EXECUTIONRESULT_OK;

	BaseSelect *pPolyBS = pSelTag->GetBaseSelect();
	if( !pPolyBS )					return EXECUTIONRESULT_OUTOFMEMORY;

	VertexMapTag *pVMapTag = (VertexMapTag *)pTagData->GetLink(POLYMASS_VMAPTAGLINK, doc);
	if( !pVMapTag )					return EXECUTIONRESULT_OK;

	const SReal *pWeights = pVMapTag->GetDataAddressR();
	if( !pWeights )					return EXECUTIONRESULT_OUTOFMEMORY;

	// go ahead and clear the selection at this point
	pPolyBS->DeselectAll();

	LONG wCnt = pVMapTag->GetDataCount();
	if( wCnt == 0 )					return EXECUTIONRESULT_OK;

	BaseSelect *pBS = BaseSelect::Alloc();
	if( !pBS )						return EXECUTIONRESULT_OUTOFMEMORY;

	//---------------------------------------------------------------------------------
	// get the threshold values from the tag, then fill in the BaseSelect based on the
	// weight values...
	//---------------------------------------------------------------------------------
	SReal threshold = (SReal)pTagData->GetReal(POLYMASS_THRESHOLD, 0.5);
	LONG i;
	for(i = 0; i < wCnt; i++)
		if(pWeights[i] > threshold)
			pBS->Select(i);

	//---------------------------------------------------------------------------------
	// finally, fill in the Polygon Selection tag, based on the BaseSelect filed in
	// above and the Poly Vert threshold
	//---------------------------------------------------------------------------------
	LONG vertThresh = pTagData->GetLong(POLYMASS_VERTTHRESH, 2);
	LONG polyCnt = pPolyObj->GetPolygonCount();
	const CPolygon *pPolys = pPolyObj->GetPolygonR();
	for(i=0; i<polyCnt; i++)
	{
		LONG found;

		found = 0;

		//---------------------------------------------------------------------------------
		// don't bother checking for triangles vs. quads - it'll work with either
		// (since pPolys->c == pPolys->d for triangles)
		//---------------------------------------------------------------------------------
		if(pBS->IsSelected(pPolys->a)) found++;
		if(pBS->IsSelected(pPolys->b)) found++;
		if(pBS->IsSelected(pPolys->c)) found++;
		if(pBS->IsSelected(pPolys->d)) found++;
		pPolys++;

		if(found >= vertThresh) pPolyBS->Select(i);
	}
	BaseSelect::Free(pBS);			// done - don't forget to free this

	pSelTag->Message(MSG_UPDATE);

	return EXECUTIONRESULT_OK;
}

//---------------------------------------------------------------------------------
// PolyToVertMap()
//
// This routine sets up a Vertex Map tag based on a Poly Selection tag...
//
// Weights are determined by how many of the polys that use each point are selected
// in the Polygon Selection tag.
//---------------------------------------------------------------------------------
EXECUTIONRESULT PolyMass::PolySelToVertMap(BaseContainer *pTagData, BaseDocument *doc, PolygonObject *pPolyObj)
{
	SelectionTag *pSelTag = (SelectionTag *)pTagData->GetLink(POLYMASS_POLYTAGLINK, doc);
	if( !pSelTag )					return EXECUTIONRESULT_OK;

	BaseSelect *pPolyBS = pSelTag->GetBaseSelect();
	if( !pPolyBS )					return EXECUTIONRESULT_OUTOFMEMORY;

	VertexMapTag *pVMapTag = (VertexMapTag *)pTagData->GetLink(POLYMASS_VMAPTAGLINK, doc);
	if( !pVMapTag )					return EXECUTIONRESULT_OK;

	SReal *pWeights = pVMapTag->GetDataAddressW();
	if( !pWeights )					return EXECUTIONRESULT_OUTOFMEMORY;

	LONG pointCnt = pPolyObj->GetPointCount();
	LONG polyCnt = pPolyObj->GetPolygonCount();
	const CPolygon *pPolys = pPolyObj->GetPolygonR();

	Neighbor polyNbrs;
//	if( !polyNbrs.Init(pointCnt, pPolys, polyCnt, pPolyBS) )	return EXECUTIONRESULT_OUTOFMEMORY;	// <-- using the Poly selection doesn't get enough neighbor info for what we need
	if( !polyNbrs.Init(pointCnt, pPolys, polyCnt, NULL) )	return EXECUTIONRESULT_OUTOFMEMORY;		// <-- using NULL gets neighbor info for entire mesh

	BaseSelect *pPointBS = BaseSelect::Alloc();
	if( !pPointBS )					return EXECUTIONRESULT_OUTOFMEMORY;

	//---------------------------------------------------------------------------------
	// build a point selection, based on the currently selected polygons...
	//---------------------------------------------------------------------------------
	ClearMem(pWeights, (VLONG)(pointCnt * sizeof(SReal)));		// clear out the Vertex Map weights
	LONG seg, smin, smax, ndx;
	seg = 0;
	while( pPolyBS->GetRange(seg++,&smin,&smax) )
	{
		for( ndx=smin; ndx<=smax; ndx++ )
		{
			const CPolygon *pPoly = &pPolys[ndx];

			pPointBS->Select(pPoly->a);
			pPointBS->Select(pPoly->b);
			pPointBS->Select(pPoly->c);
			pPointBS->Select(pPoly->d);
			//---------------------------------------------------------------------------------
			// for now, the weight of each point gets bumped by 1.0 for each 'selected' poly
			// that uses that point...
			//---------------------------------------------------------------------------------
			pWeights[pPoly->a] += 1.0f; 
			pWeights[pPoly->b] += 1.0f;
			pWeights[pPoly->c] += 1.0f;
			if( pPoly->c != pPoly->d )	// don't double-bump triangles
				pWeights[pPoly->d] += 1.0f;
		}
	}

	//---------------------------------------------------------------------------------
	// next loop through the selected points list...
	//---------------------------------------------------------------------------------
	seg = 0;
	while( pPointBS->GetRange(seg++,&smin,&smax) )
	{
		for( ndx=smin; ndx<=smax; ndx++ )
		{
			//---------------------------------------------------------------------------------
			// ...to determine how many total polys use each point...
			// Note that GetPointPolys() generates a 'new' (sparse) array of polygons, but
			// doesn't tell us the original index of those polygons, so we're really only using
			// this to get a 'count' of polys that use each point, so we can adjust the weighting
			// based on that.
			//---------------------------------------------------------------------------------
			LONG numPolys, *pPolyNdx;
			pPolyNdx = NULL;
			polyNbrs.GetPointPolys(ndx, &pPolyNdx, &numPolys);
			if( numPolys )	// avoid divide by zero (due to the code above here, it should never be zero, but...)
				pWeights[ndx] = pWeights[ndx] / numPolys;	// this sets the weight back down into the 0.0 -> 1.0 range
		}
	}

	BaseSelect::Free(pPointBS);								// done - don't forget to free this

	pVMapTag->Message(MSG_UPDATE);

	return EXECUTIONRESULT_OK;
}


//---------------------------------------------------------------------------------
// RegisterPolyMass()
//
// This is called from PluginStart() (over in main.cpp) to register the tag...
//---------------------------------------------------------------------------------
Bool RegisterPolyMass(void)
{
	return RegisterTagPlugin(ID_POLYMASSTAG,GeLoadString(IDS_POLYMASS),TAG_EXPRESSION|TAG_VISIBLE,PolyMass::Alloc,"Tpolymassexp",AutoBitmap("v2p.tif"),0);
}
