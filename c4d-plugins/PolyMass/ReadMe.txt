//------------------------------------------------------------------------------------------------------
// *****************************************************************************************************
//                                         - PolyMass -
//                            Convert Vertex Map to Polygon Selection
//                            Convert Polygon Selection to Vertex Map
//                      Copyright (c) 2012 Keith Young, all rights reserved
//                                     http://skinprops.com
// *****************************************************************************************************
//------------------------------------------------------------------------------------------------------

Installation:
------------------
Unzip files. Put folder in your Cinem 4D plugins folder.


License:
------------------
PolyMass by Keith Young is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 3.0
Unported License ( http://creativecommons.org/licenses/by-nc-sa/3.0/ ).


Description:
------------------
This plugin is originally based on some COFFEE code from Darter (David Wickenden), found in this thread:

        http://forums.cgsociety.org/showthread.php?f=182&t=998296

...I added the "Weight Treshold" idea from Yader and then also added a Polygon Vertex (count) Threshold,
so you can specify how many of the vertices (0-4) of the polygon must meet the Weight Threshold. Note
that setting the Poly Vert Threshold to 0 causes all polys to be selected, regardless of the weighting.

Only R12+ PC (32 & 64bit) versions of the plugin are included.
EDIT: David Wickenden has provided a R12+ Mac build which is now included in the archive - thanks David!

Once installed, you can right-click on a polygonal mesh object to add the tag from the pop-up menu. You'll
then need to drag links from your Vertex Map tag and Polygon Selection tag into the appropriate link slots.

The included sample file "VertexMapsToPolySelection_young.c4d" is a version of the sample file from Yader,
but with this new tag in place of the coffee tag.

The included sample file "PolyToVMap.c4d" is a more simplified test file to play with (initially set to map
the Polygon Selection tag to the Vertex Map tag).

Have fun.


Build Info:
------------------
The included Visual Studio 2005 project and source files are set up to be built with the Cinema 4D R12 SDK,
however, they should also work unchanged with the Cinema 4D R13 SDK (the included plugins are built for R12).

The 32bit & 64bit "Release" configurations are set up, as well as the 64bit "Debug" configuration, but the
32bit "Debug" configuration has not been fully set up.

Note that there is no "Solution" (.sln) file included... you would typically use the "cinema4Dsdk" solution
and "Add" the included project file to that - and then be sure to set the project to be dependent on the
"_api" project.

Porting to the Mac is left as an excersize for the user :) (although it's basically the same process you'd
use for any other Cinema 4D plugin).

EDIT: David Wickenden has provided a R12+ Mac .xcodeproj which is now included in the archive - thanks David!


Change Log:
------------------
v1.2
- Added code to swap out the tag's icon, depending on which map mode is active.
- Moved the plugin ID and custom icon IDs over to a polymass.h header file.
- Cleaned up some code and comments.

v1.1
- Added option to convert from Polygon Selection to Vertex Map

v1.0
- Initial version.