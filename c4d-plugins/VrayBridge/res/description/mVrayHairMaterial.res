 CONTAINER mVrayHairMaterial
{
	NAME mVrayHairMaterial;

	GROUP
	{
		MATPREVIEW VRAYHAIRMATERIAL_MAT_PREVIEW { OPEN; }
	}

	INCLUDE Mbase;

	GROUP Obaselist
	{
		SEPARATOR {LINE;}
		LONG VRAYHAIRMATERIAL_QUALITY
 		{
 			CYCLE
 			{
 				VRAYHAIRMATERIAL_QUALITY_0;
 				VRAYHAIRMATERIAL_QUALITY_1;
 				VRAYHAIRMATERIAL_QUALITY_2;
 			}
 		}

 		SEPARATOR { }

		REAL VRAYHAIRMATERIAL_GAMMA { HIDDEN; MIN 0; STEP 0.1; MAXSLIDER 2.2; CUSTOMGUI REALSLIDER; }

		SEPARATOR {LINE;}

		BOOL VRAYHAIRMATERIAL_OVERRIDABLE {}

 		SEPARATOR { LINE; }
 		
		LONG VRAYHAIRMATERIAL_ID {MIN 0;}
 		COLOR VRAYHAIRMATERIAL_IDCOLOR { }


 		
 		GROUP
 		{
 			COLUMNS 2;
 			
 			BOOL VRAYHAIRMATERIAL_ISROUNDED {}
 			REAL VRAYHAIRMATERIAL_ROUNDRADIUS {MIN 0;}
 		}

 		SEPARATOR { LINE; }
 		
 		BOOL VRAYHAIRMATERIAL_PAGE_PARAMS	{ PAGE; HIDDEN; PARENTMSG ID_VRAYHAIRMATERIALGROUP_PARAMS; }
	}

 	GROUP ID_VRAYHAIRMATERIALGROUP_PARAMS
	{
	 	GROUP VRAYHAIRMATERIAL_BASEPANEL
		{
			DEFAULT 1;

			COLOR	VRAYHAIRMATERIAL_OVERALLCOLOR {}
			SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_OVERALLCOLORSHADER { }
			
			SEPARATOR {LINE;}
			
			COLOR	VRAYHAIRMATERIAL_TRANSPARENCY{}
			SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_TRANSPARENCYSHADER { }
			
			SEPARATOR {LINE;}
			
			BOOL VRAYHAIRMATERIAL_USEHAIRCOLORDATA { }
			COLOR	VRAYHAIRMATERIAL_DIFFUSECOLOR{}
			//SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_DIFFUSECOLORSHADER { }
			
			//SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_DIFFUSEAMOUNT { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_DIFFUSEAMOUNTSHADER { }
		}

		SEPARATOR { LINE; }
	 	
	 	GROUP VRAYHAIRMATERIAL_SPECULARPANEL
		{
			DEFAULT 1;
			
			COLOR VRAYHAIRMATERIAL_SPECULAR1COLOR {}
			SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR1COLORSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_SPECULAR1AMOUNT { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR1AMOUNTSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_SPECULAR1GLOSSINESS { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR1GLOSSINESSSHADER { }
			
			SEPARATOR {LINE;}
			
			COLOR VRAYHAIRMATERIAL_SPECULAR2COLOR {}
			SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR2COLORSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_SPECULAR2AMOUNT { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR2AMOUNTSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_SPECULAR2GLOSSINESS { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_SPECULAR2GLOSSINESSSHADER { }
			
			SEPARATOR {LINE;}
			
			BOOL VRAYHAIRMATERIAL_SPECULAR2LOCK {}
		}
	
		SEPARATOR {LINE; }
		
		GROUP VRAYHAIRMATERIAL_TRANSMISSIONPANEL
		{
			DEFAULT 1;
			
			COLOR VRAYHAIRMATERIAL_TRANSMISSIONCOLOR {}
			SEPARATOR { }
			SHADERLINK VRAYHAIRMATERIAL_TRANSMISSIONCOLORSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_TRANSMISSIONAMOUNT { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_TRANSMISSIONAMOUNTSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_TRANSMISSIOGLOSSINESSLENGHT { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_TRANSMISSIOGLOSSINESSLENGHTSHADER { }
			
			SEPARATOR {LINE;}
			
			REAL VRAYHAIRMATERIAL_TRANSMISSIOGLOSSINESSWIDTH { MIN 0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
			SHADERLINK VRAYHAIRMATERIAL_TRANSMISSIOGLOSSINESSWIDTHSHADER { }
		}
		
		SEPARATOR { LINE; }
	
		GROUP VRAYHAIRMATERIAL_OPTIONSPANEL
		{
			DEFAULT 1;
			
			BOOL VRAYHAIRMATERIAL_OPAQUEFORSHADOW { }
			BOOL VRAYHAIRMATERIAL_OPAQUEFORGI { }
			BOOL VRAYHAIRMATERIAL_SIMPLIFYFORGI {}
			BOOL VRAYHAIRMATERIAL_USECACHEDGI {}
		}
	}

	INCLUDE Massign;
}
