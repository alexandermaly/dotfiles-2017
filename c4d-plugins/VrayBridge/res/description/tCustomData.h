#ifndef _tCustomData_H_
#define _tCustomData_H_

enum
{
	CDT_TYPE		= 1000,
	CDT_ATTRIBUTE	= 1001,
		CDTA_0 = 0,
		CDTA_1 = 1,
		CDTA_2 = 2,
		CDTA_3 = 3,
		CDTA_4 = 4,


	CDT_CONVERT_TO_VMAP		= 1005,
	CDT_CONVERT_FROM_VMAP	= 1006,

	CDT_CONVERT_TO_NTAG		= 1007,
	CDT_CONVERT_FROM_NTAG	= 1008,

	CDT_INDEX		= 1010,

	CDT_VALUE_COLOR	= 1020,
	CDT_VALUE_LONG,	
	CDT_VALUE_REAL,	
	CDT_VALUE_VECTOR, 
	CDT_VALUE_MATRIX, 
	CDT_VALUE_STRING, 
	CDT_VALUE_BOOL,	
	CDT_VALUE_NORMAL, 

	CDT_DRAW_ALWAYS	= 1030,

	CDT_COUNT		= 1040,
	CDT_DATA_START  = 1050,


	CDT_GROUP_OPTIONS = 10000,
	CDT_GROUP_VERTEX_MAP,

	//attrib_tag->SetParameter(DescID(ATTRIBUTE_DATA_OFFSET + i), GeData(Vector(cd[0],cd[1],cd[2])), DESCFLAGS_SET_0);
	ATTRIBUTE_DATA_OFFSET = 70000, //for AttributeTag SetDParameter() and GetDParameter()

};

#endif



