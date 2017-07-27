CONTAINER tVrayFurTag
{
	NAME tVrayFurTag;
	
	GROUP
	{
		STRING VRAYFURTAG_TITLEBAR {ANIM OFF; CUSTOMGUI VRAYBAR_GUI;}
	}
	
	INCLUDE TBase;
	
	GROUP VRAYFURTAG_GROUPFUR
	{
		DEFAULT 1;	
		
		GROUP VRAYFURTAG_GROUPBASIC
		{
			DEFAULT 1;
			GROUP
			{
				COLUMNS 2;
	
				REAL VRAYFURTAG_LENGTH {MIN 0.01; STEP 0.01;}
				SHADERLINK VRAYFURTAG_LENGTH_TEX {}
				
				REAL VRAYFURTAG_THICKNESS {MIN 0.01; STEP 0.01;}
				SHADERLINK VRAYFURTAG_THICKNESS_TEX {}
				
				REAL VRAYFURTAG_GRAVITY {STEP 0.01;}
				SHADERLINK VRAYFURTAG_GRAVITY_TEX {}
				
				REAL VRAYFURTAG_BEND {STEP 0.01;}
				SHADERLINK VRAYFURTAG_BEND_TEX {}
				
				REAL VRAYFURTAG_TAPER {STEP 0.01;}
			}
			
			//SEPARATOR {}
			VECTOR VRAYFURTAG_GRAVITYDIR {STEP 0.01; HIDDEN;}
			
			SEPARATOR {}
			SHADERLINK VRAYFURTAG_BENDDIR_TEX {}
			SHADERLINK VRAYFURTAG_INITDIR_TEX {}
			SEPARATOR {}
			
		}
		
		GROUP VRAYFURTAG_GROUPDETAIL
		{
			DEFAULT 1;
			
			LONG VRAYFURTAG_SIDES {MIN 3;}
			LONG VRAYFURTAG_KNOTS {MIN 3;}
			BOOL VRAYFURTAG_FLATNORMALS {}
		}
		
		GROUP VRAYFURTAG_GROUPVARIATIONS
		{
			DEFAULT 1;
			
			REAL VRAYFURTAG_DIRVAR {MIN 0.0; MAX 1.0; STEP 0.01;}
			REAL VRAYFURTAG_LENGTHVAR {MIN 0.0; MAX 1.0; STEP 0.01;}
			REAL VRAYFURTAG_THICKNESSVAR {MIN 0.0; MAX 1.0; STEP 0.01;}
			REAL VRAYFURTAG_GRAVITYVAR {MIN 0.0; MAX 1.0; STEP 0.01;}
		}
		
		GROUP VRAYFURTAG_GROUPDISTRIBUTION
		{
			DEFAULT 1;
			
			GROUP
			{
				LAYOUTGROUP; COLUMNS 2;
				GROUP
				{
					LONG VRAYFURTAG_DISTRTYPE
					{
						CYCLE
						{
							VRAYFURTAG_DISTRTYPE_0;
							VRAYFURTAG_DISTRTYPE_1;
						}
					}		
				}
				GROUP
				{
					LONG VRAYFURTAG_FACENUM {MIN 1; HIDDEN;}
					REAL VRAYFURTAG_AREANUM {MIN 0.001; STEP 0.01; HIDDEN;}
				}	
			}
			
			SEPARATOR {}
			SHADERLINK VRAYFURTAG_DENSITY_TEX {}
		}
	}
}