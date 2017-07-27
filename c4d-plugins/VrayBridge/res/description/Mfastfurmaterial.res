CONTAINER Mfastfurmaterial
{
	NAME Mfastfurmaterial;

	GROUP
	{
		MATPREVIEW SIMPLEMATERIAL_MAT_PREVIEW { OPEN; MIN_WIDTH 100; MIN_HEIGHT 100; NO_SIZE_POPUP; }
	}

	INCLUDE Mbase;

	GROUP Obaselist
	{
		BOOL MATERIAL_PAGE_PROPERTIES { HIDDEN; PAGE; PARENTMSG ID_MATERIALPROPERTIES; }
	}
	
	GROUP ID_MATERIALPROPERTIES
	{
		DEFAULT 1;
		//SHADERLINK FASTFUR_SHADER		{}
		COLOR 	FASTFUR_TIPCOLOR		{}
		COLOR	FASTFUR_ROOTCOLOR		{}
		SEPARATOR { LINE; }
		BOOL	FASTFUR_DERIVECOLOR		{}
		//LINK	FASTFUR_FFLINK			{}
		REAL	FASTFUR_MIXCOLOR		{MIN 0.0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		SEPARATOR { LINE; }

		REAL	KA						{MIN 0.0; MAX 2.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		REAL	KD						{MIN 0.0; MAX 2.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		
		SEPARATOR { LINE; }
		COLOR   FASTFUR_SPECULARCOLOR	{}
		REAL	KS						{MIN 0.0; MAX 4.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		REAL	ROUGHNESS				{MIN 0.0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		SEPARATOR { LINE; }
	}

	INCLUDE Millum;
	INCLUDE Massign;
}

