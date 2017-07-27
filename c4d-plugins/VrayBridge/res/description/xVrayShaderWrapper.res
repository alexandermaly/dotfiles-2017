CONTAINER XVrayShaderWrapper
{
	NAME XVrayShaderWrapper;
	//GROUP
	//{
	//	STRING VRAYFURTAG_SHADERWRAPPER {ANIM OFF; CUSTOMGUI VRAYBAR_GUI;}
	//}
	
	INCLUDE Mpreview;
	INCLUDE Xbase;


	GROUP ID_MATERIAL_PREVIEW
	{
		LAYOUTGROUP; COLUMNS 2;
		GROUP
		{
			COLUMNS 1;
			BUTTON VRAY_SHADERS_RELOADIMAGE { FIT_H; }
			BUTTON VRAY_SHADERS_EDITIMAGE { FIT_H; }
		}

		GROUP
		{
            LONG VRAY_SHADERS_PREVIEW_RES {
                CYCLE {
                    VRAY_SHADERS_PREVIEW_RES_0;
                    -1;
                    VRAY_SHADERS_PREVIEW_RES_1;
                    VRAY_SHADERS_PREVIEW_RES_2;
                    VRAY_SHADERS_PREVIEW_RES_3;
                    VRAY_SHADERS_PREVIEW_RES_4;
                }
            }
        }
	}

	GROUP ID_SHADERPROPERTIES
	{
		//FILENEME VRAY_SHADERS_FILENAME {}
		//STRING VRAY_SHADERS_LIST_FILTER {}
		//LONG   VRAY_SHADERS_LIST {
		//	CYCLE {
		//	}
		//}
	}
}
