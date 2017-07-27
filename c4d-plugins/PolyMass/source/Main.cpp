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
#include "c4d.h"

#ifndef _POLYMASS_H
#include "polymass.h"
#endif

//======================================================================================================
//======================================================================================================
// changes v1.2 - k_young
//
// - Added code to swap out the tag's icon, based on which map mode is active... this was both a means
//   of providing additional visual indication as well as a programing excersize/example :).
// - Moved the plugin ID and custom icon IDs over to a polymass.h header file.
// - Cleaned up some code and comments.
//======================================================================================================
//======================================================================================================
// changes v1.1 - k_young
//
// - The plugin can now map in the reverse direction (from Polygon Selection to
//   Vertex Map)
//======================================================================================================
//======================================================================================================

// forward declarations
Bool RegisterPolyMass(void);

Bool PluginStart(void)
{
	//---------------------------------------------------------------------------------
	// register 2 custom icons for later use... we do it here (and unregister them in
	// PluginEnd(), below) so that they exist for the life of the plugin (and not the
	// life of individual tags that get created/deleted)
	//---------------------------------------------------------------------------------
	Filename fn;
	fn = GeGetPluginPath()+"res"+"p2v.tif";	RegisterIcon(P2V_ICONID, fn);
	fn = GeGetPluginPath()+"res"+"v2p.tif";	RegisterIcon(V2P_ICONID, fn);

	if (!RegisterPolyMass()) return false;	// register the (expression) tag plugin

	GePrint(String("PolyMass: Vertex Map <-> Polygon Selection plugin v1.2 \u00a9 2012 by Keith Young."));

	return true;
}

void PluginEnd(void)
{
	UnregisterIcon(P2V_ICONID);
	UnregisterIcon(V2P_ICONID);
}

Bool PluginMessage(LONG id, void *data)
{
	switch (id)
	{
		case C4DPL_INIT_SYS:
			// initialize global resource object
			if (!resource.Init()) return false;
			return true;

		case C4DPL_ENDACTIVITY:
			return true;

		case C4DMSG_PRIORITY: 
//			SetPluginPriority(data, C4DPL_INIT_PRIORITY_PLUGINS-3);
			return true;
	}
	return false;
}
