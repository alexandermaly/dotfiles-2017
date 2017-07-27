CONTAINER OFast_Fur
{
	NAME OFast_Fur;
	
	GROUP
	{
		STRING FAST_FUR_TITLEBAR {ANIM OFF; CUSTOMGUI VRAYBAR_GUI;}
	}
	
	INCLUDE Obase;

	GROUP ID_OBJECTPROPERTIES
	{
		
		GROUP
		{
		COLUMNS 2;
			BOOL FAST_FUR_RETCACHE			{}
			BOOL FAST_FUR_EXPORTVRAY		{}
		}
		STATICTEXT	FAST_FUR_TOTPOLY	{}

		SEPARATOR { LINE; }
		
		//LINK	FAST_FUR_FURGUIDE			{ }	
		LINK	FAST_FUR_GEOMETRY			{ }
		LINK	FAST_FUR_FACETO				{ }
		//BOOL	FAST_FUR_SWAP_FUR_DIR		{ }
		REAL	FAST_FUR_DISPLAY			{ UNIT PERCENT; MIN 0.0; STEP 0.1; }
		
		SEPARATOR { LINE; }
		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			GROUP
			{
				LONG	FAST_FUR_TOTALFUR			{ MIN 1; STEP 1; }
			}
			GROUP
			{
				LINK	FAST_FUR_TAG_MATERIAL03		{  }
			}
		}		
		
		
	
		SEPARATOR { LINE; }
		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			
			GROUP
			{
				REAL	FAST_FUR_LEN				{ STEP 0.1;}
			}
			GROUP
			{
				LINK	FAST_FUR_TAG_MATERIAL01		{ }
				
			}
		}
		REAL	FAST_FUR_LEN_VAR			{ UNIT PERCENT; STEP 1; MIN 0; MAX 100; CUSTOMGUI REALSLIDER;}
		
		SEPARATOR { LINE; }
		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			
			GROUP
			{
				REAL	FAST_FUR_RADIUS			{ STEP 0.01;}
			}
			GROUP
			{
				REAL	FAST_FUR_RADIUS_VAR		{ UNIT PERCENT; MIN 0.0; STEP 0.1;}	
			}
		}			
		
		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			
			GROUP
			{	
				BOOL	FAST_FUR_OPTIMIZE_LEN		{ }
			}
			GROUP
			{		
				BOOL	FAST_FUR_2FACE				{ }
			}
		}
		
		SEPARATOR { LINE; }
		
		LONG FAST_FUR_OLDSECTIONS					{HIDDEN;}

		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			
			GROUP
			{
				LONG	FAST_FUR_SUBDIVISION		{ STEP 1; MIN 1; MAX 100;}
			}
			GROUP
			{	
				BOOL	FAST_FUR_SUBDDENSITY	{}
			}
		}
		
		SPLINE	FAST_FUR_SIZE_SP
											{ 
												SHOWGRID_H; 
												SHOWGRID_V; 
											  
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
											  
												HAS_PRESET_BTN; 
											  
												MINSIZE_H 100;
												MINSIZE_V 90; 
											  
												EDIT_H; 
												EDIT_V; 
											  
												LABELS_H; 
												LABELS_V; 
											  
												HAS_ROUND_SLIDER;
											  
												X_MIN 0.0; 
												X_MAX 1.0; 
											  
												Y_MIN 0.0; 
												Y_MAX 1.0; 
											  
												X_STEPS 1; 
												Y_STEPS 1; 
											}
						
			REAL FAST_FUR_EDITOR_PELI				{ HIDDEN; }
	}
	
	

		// SEPARATOR { LINE; }
		GROUP FAST_FUR_COLORMATERIALTAB
		{
			LINK	FAST_FUR_COLORMATERIAL						{ }
			SEPARATOR { LINE; }

			SHADERLINK FAST_FUR_COLOR_SHADER					{ }
			SEPARATOR { LINE; }
			
			COLOR FAST_FUR_BRDF3_OVERALL_COLOR					{ }
			SEPARATOR { LINE; }
			
			COLOR FAST_FUR_BRDF3_TRANSPARENCY					{ }
			SEPARATOR { LINE; }
			
			COLOR FAST_FUR_BRDF3_DIFFUSE_COLOR					{ }
			REAL  FAST_FUR_BRDF3_DIFFUSE_AMOUNT					{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			SEPARATOR { LINE; }
			
			COLOR FAST_FUR_BRDF3_PRIMARY_SPECULAR				{ }
			REAL  FAST_FUR_BRDF3_PRIMARY_SPECULAR_AMOUNT		{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			REAL  FAST_FUR_BRDF3_PRIMARY_GLOSSINESS				{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			SEPARATOR { LINE; }
			
			COLOR FAST_FUR_BRDF3_SECONDARY_SPECULAR	{}
			REAL  FAST_FUR_BRDF3_SECONDARY_SPECULAR_AMOUNT		{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			REAL  FAST_FUR_BRDF3_SECONDARY_GLOSSINESS			{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			SEPARATOR { LINE; }
			
			BOOL  FAST_FUR_BRDF3_SECONDARY_LOCK_TO_TRASMISSION	{ }
			COLOR FAST_FUR_BRDF3_TRASMISSION					{ }
			REAL  FAST_FUR_BRDF3_TRASMISSION_AMOUNT				{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			REAL  FAST_FUR_BRDF3_TRASMISSION_GLOSSINESS_LENGTH	{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			REAL  FAST_FUR_BRDF3_TRASMISSION_GLOSSINESS_WIDTH	{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			SEPARATOR { LINE; }
			
			BOOL  FAST_FUR_BRDF3_OPAQUE_FOR_SHADOWS				{ }
			BOOL  FAST_FUR_BRDF3_OPAQUE_FOR_GI					{ }
			BOOL  FAST_FUR_BRDF3_SIMPLIFY_FOR_GI				{ }
			BOOL  FAST_FUR_BRDF3_USE_CACHED_GI					{ }			
			
		}
	
	
	
	// SETTINGS ********************************************************************
	GROUP FAST_FUR_SETTINGS
	{
		STATICTEXT	FAST_FUR_TOTPOLY1		{}
		REAL	FAST_FUR_NOR_VAR			{ UNIT PERCENT; STEP 1;}
		REAL	FAST_FUR_RND_DIRECTION		{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
		REAL	FAST_FUR_GRAVITY			{ STEP 0.01; }
		
		SEPARATOR { LINE; }
		GROUP FAST_FUR_KINKPANEL
		{
			BOOL	FAST_FUR_ENABLE_KINK	{}
			REAL	FAST_FUR_KINK			{ UNIT PERCENT; STEP 1;}
			SPLINE	FAST_FUR_KINK_SP		{
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}
		}
		
		SEPARATOR { LINE; }
		
		GROUP FAST_FUR_FRIZZPANEL
		{
			BOOL	FAST_FUR_ENABLE_FRIZZ		{}		
			REAL	FAST_FUR_FRIZZ_VALUE		{ UNIT PERCENT; STEP 1;}
			REAL	FAST_FUR_FRIZZ_NOISE_ANGLE	{ MIN 0.0; STEP 0.01;}
			REAL	FAST_FUR_FRIZZ_RND_STR		{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			SPLINE	FAST_FUR_FRIZZ_SP			{
														SHOWGRID_H; 
														SHOWGRID_V; 
														
														GRIDSIZE_H 8; 
														GRIDSIZE_V 8; 
														
														HAS_PRESET_BTN; 
														
														MINSIZE_H 100;
														MINSIZE_V 90; 
														
														EDIT_H; 
														EDIT_V; 
														
														LABELS_H; 
														LABELS_V; 
														
														HAS_ROUND_SLIDER;
														
														X_MIN 0.0; 
														X_MAX 1.0; 
														
														Y_MIN 0.0; 
														Y_MAX 1.0; 
														
														X_STEPS 1; 
														Y_STEPS 1; 
												}
		}		
		SEPARATOR { LINE; }
		
		
		
	
		
		GROUP FAST_FUR_CURLPANEL
		{
			BOOL	FAST_FUR_ENABLE_CURL		{}
			REAL	FAST_FUR_CURL_VALUE			{ UNIT PERCENT; STEP 1;}
			REAL	FAST_FUR_CURL_RADIUS		{ MIN 0.0; STEP 0.01;}
			REAL	FAST_FUR_CURL_NOISE_ANGLE	{ MIN 0.0; STEP 0.01;}
			REAL	FAST_FUR_CURL_RND_STR		{ UNIT PERCENT; STEP 1.0; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
			REAL	FAST_FUR_CURL_SHIFT			{ STEP 0.01;}
			SPLINE	FAST_FUR_CURL_SP			{
														SHOWGRID_H; 
														SHOWGRID_V; 
														
														GRIDSIZE_H 8; 
														GRIDSIZE_V 8; 
														
														HAS_PRESET_BTN; 
														
														MINSIZE_H 100;
														MINSIZE_V 90; 
														
														EDIT_H; 
														EDIT_V; 
														
														LABELS_H; 
														LABELS_V; 
														
														HAS_ROUND_SLIDER;
														
														X_MIN 0.0; 
														X_MAX 1.0; 
														
														Y_MIN 0.0; 
														Y_MAX 1.0; 
														
														X_STEPS 1; 
														Y_STEPS 1; 
												}
		}
		SEPARATOR { LINE; }
		
		GROUP FAST_FUR_WAVEPANEL
		{


			BOOL	FAST_FUR_ENABLE_WAVE		{}
			REAL	FAST_FUR_WAVE				{ STEP 0.01; }
			REAL	FAST_FUR_WAVE_NOISE_SIZE	{ MIN 0.0; STEP 0.01;}
			REAL	FAST_FUR_WAVE_FREQ			{ STEP 0.01; }
			SPLINE	FAST_FUR_WAVE_SPLINE		{
														SHOWGRID_H; 
														SHOWGRID_V; 
														
														GRIDSIZE_H 8; 
														GRIDSIZE_V 8; 
														
														HAS_PRESET_BTN; 
														
														MINSIZE_H 100;
														MINSIZE_V 90; 
														
														EDIT_H; 
														EDIT_V; 
														
														LABELS_H; 
														LABELS_V; 
														
														HAS_ROUND_SLIDER;
														
														X_MIN 0.0; 
														X_MAX 1.0; 
														
														Y_MIN 0.0; 
														Y_MAX 1.0; 
														
														X_STEPS 1; 
														Y_STEPS 1; 
												}
		}

		
		SEPARATOR { LINE; }
		
		GROUP FAST_FUR_FUROFFSET_DIRECT
		{
			LINK	FAST_FUR_TARGET				{ }
			REAL	FAST_FUR_TARGET_MIX			{ MIN 0.0; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}		
			VECTOR	FAST_FUR_OFFRND				{ }
			REAL	FAST_FUR_NORMAL_OFFSET		{ STEP 0.01;}
			LONG	FAST_FUR_SEED				{ }	
		}
	
	}
	
	
	
	GROUP FAST_FUR_CLUMP
	{	
		STATICTEXT	FAST_FUR_TOTPOLY2		{}
		GROUP
		{		
			BOOL	FAST_FUR_CLUMP_ENABLE				{ }
			SPLINE	FAST_FUR_CLUMP_SPLINE				{ 
															SHOWGRID_H; 
															SHOWGRID_V; 
														  
															GRIDSIZE_H 8; 
															GRIDSIZE_V 8; 
														  
															HAS_PRESET_BTN; 
														  
															MINSIZE_H 100;
															MINSIZE_V 90; 
														  
															EDIT_H; 
															EDIT_V; 
														  
															LABELS_H; 
															LABELS_V; 
														  
															HAS_ROUND_SLIDER;
														  
															X_MIN 0.0; 
															X_MAX 1.0; 
														  
															Y_MIN 0.0; 
															Y_MAX 1.0; 
														  
															X_STEPS 1; 
															Y_STEPS 1; 
														}			
			REAL	FAST_FUR_CLUMP_MULT					{ MIN 0.001;  STEP 0.001; }
			REAL	FAST_FUR_CLUMP_MIX					{ MIN 0.0; MAX 100.0; UNIT PERCENT; CUSTOMGUI REALSLIDER; }
			LINK	FAST_FUR_TAG_VMAPCLUMP		{ }
		}
	}
	
	GROUP FAST_FUR_COMBING
	{	
		STATICTEXT	FAST_FUR_TOTPOLY3		{}
		GROUP
		{
		
			BOOL FAST_FUR_COMBING_ENABLE	{}
			
			LONG FAST_FUR_COMBING_PREC	{ MIN 10; MAX 1000; CUSTOMGUI LONGSLIDER; }
			
			REAL FAST_FUR_COMBING_MIX	{ MIN 0.0;MAX 100.0; UNIT PERCENT; CUSTOMGUI REALSLIDER; }
			
			LONG FAST_FUR_COMBING_PLANE  {
											CYCLE
											{
													FAST_FUR_COMBING_PLANE_3D;
													FAST_FUR_COMBING_PLANE_XY;
													FAST_FUR_COMBING_PLANE_XZ;
													FAST_FUR_COMBING_PLANE_YZ;
											}
			}
			

			
			SEPARATOR { LINE; }
			
			REAL	FAST_FUR_COMBING_FALLOFF1	{ MIN 0.0; }			
			SPLINE	FAST_FUR_COMBING_SPLINE1 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}
			//BOOL	FAST_FUR_STYLING_SP1_ON	{ }
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF2	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE2 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}		
											
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF3	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE3 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}
											
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF4	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE4 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}		
											
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF5	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE5 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}	
											
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF6	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE6 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}	
	
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF7	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE7 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}	
											
			SEPARATOR { LINE; }	
			REAL	FAST_FUR_COMBING_FALLOFF8	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE8 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}	
											
			SEPARATOR { LINE; }								
			REAL	FAST_FUR_COMBING_FALLOFF9	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE9 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}
											
			REAL	FAST_FUR_COMBING_FALLOFF10	{ MIN 0.0; }								
			SPLINE	FAST_FUR_COMBING_SPLINE10 { 
												SHOWGRID_H; 
												SHOWGRID_V; 
												
												GRIDSIZE_H 8; 
												GRIDSIZE_V 8; 
												
												HAS_PRESET_BTN; 
												
												MINSIZE_H 100;
												MINSIZE_V 90; 
												
												EDIT_H; 
												EDIT_V; 
												
												LABELS_H; 
												LABELS_V; 
												
												HAS_ROUND_SLIDER;
												
												X_MIN 0.0; 
												X_MAX 1.0; 
												
												Y_MIN 0.0; 
												Y_MAX 1.0; 
												
												X_STEPS 1; 
												Y_STEPS 1; 
											}																																
																																																																											
		}
	}	
	
	
	GROUP FAST_FUR_VERTEXMAP
	{
		STATICTEXT	FAST_FUR_TOTPOLY4		{}
		LINK	FAST_FUR_TAG_DENSITY		{ }
		//LINK	FAST_FUR_TAG_DIRECTIONY		{ }
		//LINK	FAST_FUR_TAG_DIRECTIONZ		{ }
		LINK	FAST_FUR_TAG_LEN			{ }

	}	
	
	GROUP FAST_FUR_WIND
	{	
		STATICTEXT	FAST_FUR_TOTPOLY5		{}
		GROUP
		{	
			BOOL	FAST_FUR_ENABLE_WIND			{}	
			LINK	FAST_FUR_WIND_REFERENCE			{}
			REAL	FAST_FUR_WIND_STRENGHT			{ STEP 0.01;}
			REAL	FAST_FUR_WIND_STRENGHT_VAR		{  STEP 0.01;}
			REAL	FAST_FUR_WIND_DIR				{ UNIT DEGREE; MAX 360; MIN 0; STEP 0.1;}
			REAL	FAST_FUR_WIND_DIR_VAR			{ UNIT DEGREE; STEP 0.1;}
			REAL	FAST_FUR_WIND_FREQ_STR			{ STEP 0.01;}
			REAL	FAST_FUR_WIND_FREQ_DIR			{ STEP 0.01;}
		}
	}		
	
	GROUP FAST_FUR_TAB_OPTIMIZATION
	{
		STATICTEXT	FAST_FUR_TOTPOLY6		{}
		GROUP
		{
			LAYOUTGROUP; COLUMNS 3;
			GROUP 
			{
					BOOL	FAST_FUR_ENABLE_PERPDENS	{ }
			}
			GROUP 
			{
					REAL	FAST_FUR_PERPDENS_MIN	{  UNIT DEGREE; MIN -180.0; MAX 180.0; STEP 0.1; }
			}
			GROUP 
			{
					REAL	FAST_FUR_PERPDENS_MAX	{  UNIT DEGREE; MIN -180.0; MAX 180.0; STEP 0.1; }
			}
		}

		GROUP
		{
			LAYOUTGROUP; COLUMNS 3;
			GROUP 
			{
					BOOL	FAST_FUR_ENABLE_DENSITYDIST	{ }
			}
			GROUP 
			{
					REAL	FAST_FUR_DISTANCE_MIN	{  STEP 1.0; }
			}
			GROUP 
			{
					REAL	FAST_FUR_DISTANCE_MAX 	{  STEP 1.0; }
			}
		}

		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			GROUP 
			{
					BOOL	FAST_FUR_ENABLE_CONECAMERA	{ }
			}
			GROUP 
			{
					REAL	FAST_FUR_CONOCAMERA	{ UNIT DEGREE; STEP 0.1; }
			}
		}			

		GROUP
		{
			LAYOUTGROUP; COLUMNS 2;
			GROUP 
			{
					BOOL	FAST_FUR_ENABLE_BACKFACE	{ }
			}
			GROUP 
			{
					REAL	FAST_FUR_INCLINAZIONE	{ UNIT DEGREE; STEP 0.1; }
			}
		}	

	}	
	
	GROUP FAST_FUR_CACHE
	{			
		STATICTEXT	FAST_FUR_TOTPOLY7		{}
		BUTTON	FAST_FUR_CACHE_ENABLE		{}
		BUTTON	FAST_FUR_CACHE_RESET		{}
		LONG	FAST_FUR_CACHE_FR_START		{MIN 0;}
		LONG	FAST_FUR_CACHE_FR_END		{MIN 0;}
		REAL	FAST_FUR_DYN_COEFF			{ UNIT PERCENT; MIN 0.0; MAX 100.0; }	
		REAL	FAST_FUR_DELAY				{MIN 0.05; MAX 1.0; STEP 0.01; CUSTOMGUI REALSLIDER;}
		BOOL	FAST_FUR_DYPREVIEW			{}
		//REAL	FAST_FUR_MASSA				{STEP 0.01;}
		BOOL	FAST_FUR_CACHED				{HIDDEN;}
		LONG	FAST_FUR_OLDPOINTCOUNT		{HIDDEN;}
		LONG	FAST_FUR_POINTERTOCOL		{HIDDEN;}
		LONG	FAST_FUR_NUMEROPELO			{HIDDEN;}
		LONG	FAST_FUR_POINTCOUNT			{HIDDEN;}
		LONG	FAST_FUR_OLDTOTALFUR		{HIDDEN;}
	}
	
	GROUP FAST_FUR_PRESET	
	{	
		BUTTON	FAST_FUR_PRESET_SAVE		{}
		BUTTON	FAST_FUR_PRESET_LOAD		{}
	}
				
}
