CONTAINER PolyCircle
{
	NAME PolyCircle;
//	INCLUDE ToolBase;

	GROUP ID_MAIN
	{
		DEFAULT 1;
	//	COLUMNS 2;
		LONG ID_MODE
		{
			CYCLE
			{
				CH_NORMAL;
				CH_WOLD;
				CH_WINDOWS;
			}
		}
		GROUP
		{
			COLUMNS 3;
			BOOL ID_BOOLX {}
			BOOL ID_BOOLY {}
			BOOL ID_BOOLZ {}
		}

		BOOL ID_CHECK_FACE{}
		GROUP ID_GROUP_BOOL
		{
			DEFAULT 1;
			GROUP
			{
				COLUMNS 2;
				BUTTON ID_BTNNSET {}
				BUTTON ID_BTNRESET {}
			}
			LINK	ID_LINK 
			{
				ANIM OFF;
				ACCEPT
				{
					Obase;
				}
				REFUSE
				{
					Osky;
					Oforeground;
				}
			}


			LONG ID_GROUPXYZ
			{
				CYCLE
				{
					ID_CHECK_X;
					ID_CHECK_Y;
					ID_CHECK_Z;
				}

			}

		}
	//	REAL CIRCLE_ROT { UNIT DEGREE; MIN 0; MAX 360.0; }
		BOOL ID_CHECK {}
		REAL ID_DIREC {UNIT DEGREE; MIN 0; MAX 360.0; }
		REAL CIRCLE_VALUE { UNIT METER; MINEX;}
		BUTTON ID_BTN {}
	}
}
