#ifndef _OMpNode_H_
#define _OMpNode_H_

enum
{
	MPNODE_BASELIST_NAME = 900,

    MPNODE_TYPE     = 1000,
    
    MPNODE_ISENABLED = 1050,

    ///COMMON
    VRAYRE_FILTERING    = 1100,
    
    ///COLOR CHANNELS
    VRAYRE_ALIAS        = 1200,
    VRAYRE_COLORMAPPING ,
    VRAYRE_AA           ,
    
    VRAYRE_OBJID        = 1300,
    VRAYRE_REDID        ,
    VRAYRE_GREENID      ,
    VRAYRE_BLUEID       ,
    VRAYRE_USEMATID     ,
    
    VRAYRE_TEXALIGN     = 1350,
    
    VRAYRE_AFFECTMATTE  = 1400,
    VRAYRE_TEXMAP       ,
    
    VRAYRE_CLAMPVEL     = 1500,
    VRAYRE_MAXVEL       ,
    VRAYRE_MAXVELLAST   ,
    VRAYRE_IGNOREZ      ,
    
    VRAYRE_DEPTHBLK     = 1600,
    VRAYRE_DEPTHWHT     ,
    VRAYRE_DEPTHFROMCAM ,
    VRAYRE_DEPTHCLAMP,
    VRAYRE_DEPTHINV     ,
    
    VRAYRE_POSPASSSPACE 	= 1700,
    VRAYRE_POSPASSSPACE_0	= 0,
    VRAYRE_POSPASSSPACE_1	= 1,
    VRAYRE_POSPASSSPACE_2	= 2,
};

#endif
