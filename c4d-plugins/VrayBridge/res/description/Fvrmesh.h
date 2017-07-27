/// Copyright (C) 2014  Niklas Rosenstein
/// All rights reserved.
/// Developed for LAUBLab KG

#ifndef Fvrmesh_H__
#define Fvrmesh_H__

enum
{
	VRMESH_EXPORT_ID = 1033551,
	
	VRMESH_EXPORT_EXPORTSELECTED = 2001,       // BOOL
	VRMESH_EXPORT_EXPORTUVW = 2002,            // BOOL
	VRMESH_EXPORT_EXPORTNORMALS = 2003,        // BOOL
	VRMESH_EXPORT_EXPORTMATERIALS = 2005,      // BOOL
	VRMESH_EXPORT_FACESPERVOXEL = 2004,        // LONG

	VRMESH_EXPORT_GENERATEPREVIEW = 3001,      // BOOL
	VRMESH_EXPORT_PREVIEWLOD = 3002,           // BOOL

	VRMESH_EXPORT_CREATEPROXY = 4000,          // BOOL
};

#endif // Fvrmesh_H__