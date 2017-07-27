#ifndef _oVRayParticleSystem_H_
#define _oVRayParticleSystem_H_

enum
{
	ID_VRAY_PARTICLE_SYSTEM			= 1030472,

	VRPARTSYS_VERSION				= 1000, //Long
	VRPARTSYS_PARTICLE_SYSTEM_LINK	= 1001, //Link
	VRPARTSYS_SUBGROUPS				= 1002, //Bool 


	VRPARTSYS_MESH					= 1100,		//: plugin, The triangle mesh that will be instanced.This is used only for some of the particle render types.
	VRPARTSYS_RENDER_TYPE			= 1101,		//: integer = 7, 3 - multipoints; 4 - multistreak; 6 - points; 7 - Spheres; 8 - Sprites; 9 - Streak.Everything else gives a warning and renders as spheres.
		VRPARTSYS_RENDER_TYPE_0		= 0,
		VRPARTSYS_RENDER_TYPE_1		= 1,
		VRPARTSYS_RENDER_TYPE_2		= 2,
		VRPARTSYS_RENDER_TYPE_3		= 3,
		VRPARTSYS_RENDER_TYPE_4		= 4,
		VRPARTSYS_RENDER_TYPE_5		= 5,
		VRPARTSYS_RENDER_TYPE_6		= 6,
		VRPARTSYS_RENDER_TYPE_7		= 7,
		VRPARTSYS_RENDER_TYPE_8		= 8,
		VRPARTSYS_RENDER_TYPE_9		= 9,


	VRPARTSYS_SPRITE_SIZE_X			= 1102,		//: float = 1, The width of sprite particles in world units.
	VRPARTSYS_SPRITE_SIZE_Y			= 1103,		//: float = 1, The height of sprite particles in world units.
	VRPARTSYS_SPRITE_TWIST			= 1104,		//: float = 0, The twist of sprite particles in degrees.
	VRPARTSYS_SPRITE_ORIENTATION	= 1105,		//: integer = 0, 0 - orient sprites towards the camera center, 1 - orient sprites parallel to the camera plane
		VRPARTSYS_SPRITE_ORIENTATION_0 = 0,
		VRPARTSYS_SPRITE_ORIENTATION_1 = 1,

	VRPARTSYS_POINT_SIZE			= 1106,		//: float = 1, The size of point and multipoint particles, in pixels.
	VRPARTSYS_POINT_RADII			= 1107,		//: bool = false, If true, the point size will be taken form radii parameter
	VRPARTSYS_POINT_WORLD_SIZE		= 1108,		//: bool = false, If true, the point size is in world space, not screen space
	VRPARTSYS_MULTI_COUNT			= 1109,		//: integer = 1, The number of particles generated for each input particle, when the render type is multipoints or multistreaks.
	VRPARTSYS_MULTI_RADIUS			= 1110,		//: float = 0, The maximum distance between the original and a generated particle when the render type is multipoints or multistreaks.
	VRPARTSYS_LINE_WIDTH			= 1111,		//: float = 1, The width of streak particles, in pixels
	VRPARTSYS_TAIL_LENGTH			= 1112,		//: float = 1, The length of streak particles, in world units, the actual length depends on the particle velocity as well.
	VRPARTSYS_PRIMARY_VISIBILITY	= 1113,		//: bool = true, If off, shading an intersection with this mesh will not generate a gbuffer.
			
};

#endif

