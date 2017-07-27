#ifndef _XVrayShaderWrapper_H_
#define _XVrayShaderWrapper_H_

enum
{
	
	VRAY_SHADERS_LIST					= 1000, //Int
    VRAY_SHADERS_LIST_VRAY_ADV_BITMAP   = 10,   //Make sure to update this if list is changed 
    VRAY_SHADERS_LIST_VRAY_BITMAP       = 51,   //Make sure to update this if list is changed 
	VRAY_SHADERS_LIST_FILTER			= 1001, //String

	VRAY_SHADERS_EDITIMAGE				= 1003, //Button
	VRAY_SHADERS_RELOADIMAGE			= 1004, //Button

    VRAY_SHADERS_PREVIEW_RES            = 1005,
    VRAY_SHADERS_PREVIEW_RES_0 = 0,
    VRAY_SHADERS_PREVIEW_RES_1 = 1,
    VRAY_SHADERS_PREVIEW_RES_2 = 2,
    VRAY_SHADERS_PREVIEW_RES_3 = 3,
    VRAY_SHADERS_PREVIEW_RES_4 = 4,

	VRAY_LAYERED_TEXCOUNT				= 1010,
	VRAY_LAYERED_BLENDMODES_ID			= 1011,

	VRAYFURTAG_SHADERWRAPPER			= 1500,	//???

	VRAY_SHADERS_XBITMAP				= 3999, //Link to Xbitmap shader or nullptr.
	VRAY_SHADERS_BITMAP_FILENAME		= 4999, //Filename
};

#endif