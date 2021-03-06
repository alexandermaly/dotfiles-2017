CONTAINER Tpolymassexp
{
	NAME Tpolymassexp;
	INCLUDE Texpression;

	GROUP ID_TAGPROPERTIES
	{
		LINK	POLYMASS_VMAPTAGLINK	{ ACCEPT { 5682; } }
		LINK	POLYMASS_POLYTAGLINK	{ ACCEPT { Tpolygonselection; } }
		LONG	POLYMASS_VERTTHRESH		{ MIN 0; MAX 4; CUSTOMGUI LONGSLIDER; }
		REAL	POLYMASS_THRESHOLD		{ UNIT PERCENT; MIN 0.0; MAX 100.0; CUSTOMGUI REALSLIDER; }
		LONG	POLYMASS_MAPMODE		{ CYCLE { MAPMODE_VMAPTOPOLY; MAPMODE_POLYTOVMAP; } }
	}
}
