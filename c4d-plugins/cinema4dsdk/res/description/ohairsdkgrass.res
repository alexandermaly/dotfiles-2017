CONTAINER Ohairsdkgrass
{
	NAME Ohairsdkgrass;
	INCLUDE Obase;
	
	GROUP ID_OBJECTPROPERTIES
	{
		BOOL HAIR_GRASS_GENERATE { }

		LINK HAIR_GRASS_LINK { ACCEPT { 5100; Tpolygonselection; 5682; } }

		GROUP
		{
			COLUMNS 2;
			
			LONG HAIR_GRASS_COUNT { MIN 1; }
			LONG HAIR_GRASS_SEGMENTS { MIN 1; MAX 4096; }
			
			REAL HAIR_GRASS_LENGTH { UNIT METER; MIN 0.0; }
			REAL HAIR_GRASS_LENGTH_VAR { UNIT METER; MIN 0.0; }

			REAL HAIR_GRASS_NOISE { UNIT PERCENT; MIN 0.0; }
		}
	}
}
