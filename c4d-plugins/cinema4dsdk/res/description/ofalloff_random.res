CONTAINER Ofalloff_random
{
	NAME	Ofalloff_random;
	INCLUDE Ofalloff_standard;

	HIDE FALLOFF_SIZE;
	
	GROUP FALLOFF_GROUPFALLOFF
	{
		GROUP FALLOFF_SETTINGS
		{
			LONG	RANDOMFALLOFF_SEED { MIN 0; }
		}
	}
}
