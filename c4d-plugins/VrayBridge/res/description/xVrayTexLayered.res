CONTAINER Xvraybitmap
{
	NAME Xvraybitmap;

	INCLUDE Mpreview;
	INCLUDE Xbase;

	GROUP ID_SHADERPROPERTIES
	{
		FILENAME VRAY_BITMAP { }
		
		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			GROUP
			{
				LONG VRAY_BITMAP_FILTERTYPE
				{
					CYCLE
					{
						VRAY_BITMAP_FILTERTYPE_0;
						VRAY_BITMAP_FILTERTYPE_1;
						VRAY_BITMAP_FILTERTYPE_2;
					}
				}
			}
			GROUP
			{
				REAL VRAY_BITMAP_FILTERBLUR {MIN 1;}
			}
		}
		
		GROUP
		{
			LAYOUTGROUP; COLUMNS 3;
			GROUP
			{
				BOOL VRAY_BITMAP_TILE {}
			}
			GROUP
			{
				BOOL VRAY_BITMAP_WRAPU {}
			}
			GROUP
			{
				BOOL VRAY_BITMAP_WRAPV {}
			}
		}
	}
}
