CONTAINER oVRayParticleSystem
{
	NAME oVRayParticleSystem;
	INCLUDE Obase;
	//INCLUDE Osplineprimitive;

	GROUP ID_OBJECTPROPERTIES
	{
		LINK		VRPARTSYS_PARTICLE_SYSTEM_LINK		{ ACCEPT{ 1001381; 1001414; 1027133; } } //TP_Group; TP_ParticleGeometry; XPartcieles;
		//LINK		VRPARTSYS_TP_GROUP_LINK		{ ACCEPT{ 1001381; } }
		//BOOL		VRPARTSYS_SUBGROUPS			{}
		
		LINK VRPARTSYS_MESH					{}	//: plugin, The triangle mesh that will be instanced.This is used only for some of the particle render types.
		SEPARATOR { LINE; }
		
		LONG VRPARTSYS_RENDER_TYPE			{
			CYCLE{
				//VRPARTSYS_RENDER_TYPE_0;	
				//VRPARTSYS_RENDER_TYPE_1;	
				//VRPARTSYS_RENDER_TYPE_2;	
				VRPARTSYS_RENDER_TYPE_3;	
				VRPARTSYS_RENDER_TYPE_4;	
				//VRPARTSYS_RENDER_TYPE_5;	
				VRPARTSYS_RENDER_TYPE_6;	
				VRPARTSYS_RENDER_TYPE_7;	
				VRPARTSYS_RENDER_TYPE_8;	
				VRPARTSYS_RENDER_TYPE_9;	
			}
		}	//: integer = 7, 3 - multipoints; 4 - multistreak; 6 - points; 7 - Spheres; 8 - Sprites; 9 - Streak.Everything else gives a warning and renders as spheres.
		SEPARATOR { LINE; }
		
		REAL VRPARTSYS_SPRITE_SIZE_X		{ MIN 0.0; }	//: float = 1, The width of sprite particles in world units.
		REAL VRPARTSYS_SPRITE_SIZE_Y		{ MIN 0.0; }	//: float = 1, The height of sprite particles in world units.
		REAL VRPARTSYS_SPRITE_TWIST			{ MIN 0.0; }	//: float = 0, The twist of sprite particles in degrees.
		LONG VRPARTSYS_SPRITE_ORIENTATION	{
			CYCLE{
				VRPARTSYS_SPRITE_ORIENTATION_0;
				VRPARTSYS_SPRITE_ORIENTATION_1;
			}
		}	//: integer = 0, 0 - orient sprites towards the camera center, 1 - orient sprites parallel to the camera plane
		SEPARATOR { LINE; }
		
		REAL VRPARTSYS_POINT_SIZE			{ MIN 0.0; }	//: float = 1, The size of point and multipoint particles, in pixels.
		BOOL VRPARTSYS_POINT_RADII			{}	//: bool = false, If true, the point size will be taken form radii parameter
		BOOL VRPARTSYS_POINT_WORLD_SIZE		{}	//: bool = false, If true, the point size is in world space, not screen space
		SEPARATOR { LINE; }
		
		LONG VRPARTSYS_MULTI_COUNT			{ MIN 1; MAX 1000; }	//: integer = 1, The number of particles generated for each input particle, when the render type is multipoints or multistreaks.
		REAL VRPARTSYS_MULTI_RADIUS			{ MIN 0.0; MAX 1000; }	//: float = 0, The maximum distance between the original and a generated particle when the render type is multipoints or multistreaks.
		SEPARATOR { LINE; }
		
		REAL VRPARTSYS_LINE_WIDTH			{ MIN 0.0; }	//: float = 1, The width of streak particles, in pixels
		REAL VRPARTSYS_TAIL_LENGTH			{ MIN 0.0; }	//: float = 1, The length of streak particles, in world units, the actual length depends on the particle velocity as well.
		SEPARATOR { LINE; }

		BOOL VRPARTSYS_PRIMARY_VISIBILITY	{}	//: bool = true, If off, shading an intersection with this mesh will not generate a gbuffer.
	}
}
					