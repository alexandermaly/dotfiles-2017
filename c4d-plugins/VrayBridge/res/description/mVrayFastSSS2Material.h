#ifndef _MVrayFastSSS2Material_H_
#define _MVrayFastSSS2Material_H_

enum
{
	//ID_VRAYFASTSSS2MATERIAL = 1024192,

	VRAYFASTSSS2MATERIAL_SKIPPAGL = 6969,

	VRAYFASTSSS2MATERIAL_PREVIEWSIZE = 500,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_DEF = 0,
	// Preview
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_64 = 6,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_128 = 7,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_256 = 8,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_512 = 9,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_1024 = 10,
	VRAYFASTSSS2MATERIAL_PREVIEWSIZE_2048 = 11,

	VRAYFASTSSS2MATERIAL_ANIMATEPREVIEW = 501,

	ID_VRAYFASTSSS2MATERIALGROUP_ILLUMINATION = 820,
	VRAYFASTSSS2MATERIAL_PAGE_ILLUMINATION = 821,

	VRAYFASTSSS2MATERIAL_MAT_PREVIEW = 1001,

	// Groups
	ID_VRAYFASTSSS2MATERIALGROUP_PARAMS = 850,

	// Use Bool Parameters
	VRAYFASTSSS2MATERIAL_PAGE_PARAMS = 2010,

	// PANELS IDs
	VRAYFASTSSS2MATERIAL_SSS_GENPANEL,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERPANEL,
	VRAYFASTSSS2MATERIAL_SSS_OPTIONSPANEL,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARPANEL,

	// Presets
	VRAYFASTSSS2MATERIAL_PRESETS = 800,
	VRAYFASTSSS2MATERIAL_PRESETS00 = 0,
	VRAYFASTSSS2MATERIAL_PRESETS01 = 1,
	VRAYFASTSSS2MATERIAL_PRESETS02 = 2,
	VRAYFASTSSS2MATERIAL_PRESETS03 = 3,
	VRAYFASTSSS2MATERIAL_PRESETS04 = 4,
	VRAYFASTSSS2MATERIAL_PRESETS05 = 5,
	VRAYFASTSSS2MATERIAL_SAVEPRESET = 801,

	VRAYFASTSSS2MATERIAL_QUALITY = 806,
	VRAYFASTSSS2MATERIAL_QUALITY_0 = 0,
	VRAYFASTSSS2MATERIAL_QUALITY_1 = 1,
	VRAYFASTSSS2MATERIAL_QUALITY_2 = 2,
	VRAYFASTSSS2MATERIAL_GAMMA = 810,
	VRAYFASTSSS2MATERIAL_OVERRIDABLE = 	811,
	VRAYFASTSSS2MATERIAL_IDCOLOR  		,
	VRAYFASTSSS2MATERIAL_ISROUNDED		,
	VRAYFASTSSS2MATERIAL_ROUNDRADIUS	,
    VRAYFASTSSS2MATERIAL_ID             ,

	// SSS2
	VRAYFASTSSS2MATERIAL_SSS_SINGLESCATTER = 4050,
	VRAYFASTSSS2MATERIAL_SSS_SINGLESCATTER_0 = 0,
	VRAYFASTSSS2MATERIAL_SSS_SINGLESCATTER_1 = 1,
	VRAYFASTSSS2MATERIAL_SSS_SINGLESCATTER_2 = 2,
	VRAYFASTSSS2MATERIAL_SSS_SINGLESCATTER_3 = 3,
	VRAYFASTSSS2MATERIAL_SSS_OVERALLCOLOR = 4051,
	VRAYFASTSSS2MATERIAL_SSS_DIFFUSECOLOR,
	VRAYFASTSSS2MATERIAL_SSS_DIFFUSEAMOUNT,
	VRAYFASTSSS2MATERIAL_SSS_SSSCOLOR,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERCOLOR,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERMULT,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARCOLOR,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARAMOUNT,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARGLOSSINESS,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARSUBDIVS,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARTRACE,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARDEPTH,
	VRAYFASTSSS2MATERIAL_SSS_REFRACTIONDEPTH,
	VRAYFASTSSS2MATERIAL_SSS_FRONTSCATTER,
	VRAYFASTSSS2MATERIAL_SSS_BACKSCATTER,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERGI,
	VRAYFASTSSS2MATERIAL_SSS_IOR,
	VRAYFASTSSS2MATERIAL_SSS_SCALE,
	VRAYFASTSSS2MATERIAL_SSS_PREPASS,
	VRAYFASTSSS2MATERIAL_SSS_SUBDIVS,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSLOD,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSBLUR,
	VRAYFASTSSS2MATERIAL_SSS_PHASE,
	VRAYFASTSSS2MATERIAL_SSS_GEOMSAMPLING,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSID,
	VRAYFASTSSS2MATERIAL_SSS_AUTODENSITY,
	VRAYFASTSSS2MATERIAL_SSS_SAMPLESPERUNITAREA,
	VRAYFASTSSS2MATERIAL_SSS_SURFACEOFFSET,
	VRAYFASTSSS2MATERIAL_SSS_PREVIEWSAMPLES,
	VRAYFASTSSS2MATERIAL_SSS_MAXDISTANCE,
	VRAYFASTSSS2MATERIAL_SSS_BGCOLOR,
	VRAYFASTSSS2MATERIAL_SSS_SAMPLESCOLOR,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE = 4090,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE_0 = 0,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE_1 = 1,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE_2 = 2,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE_3 = 3,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSMODE_4 = 4,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSFILENAMESAVE = 4096,
	VRAYFASTSSS2MATERIAL_SSS_PREPASSFILENAMEOPEN,

	// Shaders
	VRAYFASTSSS2MATERIAL_SSS_OVERALLCOLORSHADER = 4100,
	VRAYFASTSSS2MATERIAL_SSS_DIFFUSECOLORSHADER,
	VRAYFASTSSS2MATERIAL_SSS_DIFFUSEAMOUNTSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SSSCOLORSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SCATTERMULTSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARCOLORSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARAMOUNTSHADER,
	VRAYFASTSSS2MATERIAL_SSS_SPECULARGLOSSINESSSHADER,

	VRAYFASTSSS2MATERIAL_USED = 5000,
	VRAYFASTSSS2MATERIAL_XREF_FILENAME = 5001,
	VRAYFASTSSS2MATERIAL_NODE = 5200,

	// virtual ID
	VRAYFASTSSS2MATERIAL_SPECULARPREVIEW = 8050
};

#endif
