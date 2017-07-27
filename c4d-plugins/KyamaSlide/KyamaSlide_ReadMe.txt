
KyamaSlide v1.3 By Keith Young - http://skinprops.com
=========================================================================

Background:
=====================
"KyamaSlide" is a MultiSlide Tool originally written by Anton Marchenko (his info, below). It is a
tool for sliding a selection of one or more edges at once. The new name is a compounding of "Ky"
(my initials) and "AMa" (Anton's initials) :).

The original version was for 32bit PC only, but since it came with source code, I compiled it for
64bit PC, as well as a 32bit Mac Universal Binary. The plugin uses a new ID, so it can be installed
at the same time as the original, if you choose to do so. Also note that I have chosen NOT to
include the new source code with my modifications - sorry.


Release Notes:
=====================

v1.3
--------------------
* General behavior changes...
The "Apply", "New Transform" and "Reset Values" buttons have been hidden/removed. This effectively
turns the "Distance" field into a 'display-only' field... the "On Prolonged Edges" checkbox is also
now for display/indication purposes only (setting or clearing it manually does nothing... but it
will be checked if you hold the CTRL key as you slide the edge(s).)

* A new "Distance Scale" control/feature has been added...
In previous versions, the effective minimum distance you could slde was hard-coded to 0.2 units (in
3D space) per mouse-x movement. For the sake of consistancy, that hard-coded value is still there,
but there is a new "Distance Scale" control that will let you scale that movement to give you much
finer precision...

The default '1.0' scale value will still give you the 0.2 minimum movement, but you can set this
scaling value as low as '0.01' and as high as '2.0'.  This gives you 100x finer precision (or 0.002)
for tiny movements and up to 2x coarser (or 0.4) for larger movements. 

* 4 new 'Action' buttons added...
These new buttons perform a one-shot action when clicked..

  - To Center (Smooth)
  - To Center (Sharp)
  - To Center (Mixed)
  - To Center (Flatten)

...what they do is move the selected edge(s) (or vertices that make up those edges) 'towards' the
center of the neighboring edges - or more precisely, to a point that is equidistant between the
neighboring edges. Note that the 'Flatten' one wil move the vertices to the exact center, but the
others may need to be clicked multiple times to reach the center.

The (other) difference between the various buttons is in 'how' or 'along which edge' they move the
vertices, to reach a point that's equidistant between the neighboring edges.  It's a bit difficult
to describe without sample images, but...

1. Add a Cube primitive to the scene and make it editable.
2. switch to 'edge' mode and select the top-right edge of the cube.
3. activate KyamaSlide and slide that edge to the left somewhat (let's say half-way towards the
top-left edgeof the cube).
4. At this point, you should try out all 4 buttons and note how (along which edge) the movement
takes place (just hit CTRL-Z after each one to undo/get back to the starting point).

...if we focus on the vertex closest to the viewer (top-right-front vertex of the cube), it's
neighbors are the top-left-front and bottom-right-front vertices.  [I'll refer to these as TRF, TLF
and BRF, respectively]

So, we know that the "shortest distance between 2 points is a straight line" - this would refer to
a line between the two neighboring vertices TLF -> BRF.  If you use the 'Flatten' button, the TRF
vertex will be poisitioned on this imaginary line, exactly half-way between those 2 points.  Notice
that this 'flattens' out any vertical/offset difference that vertex may have had - from that imaginary
line.

With the above in mind, the other methods can be described as follows...

  | Smooth - movement is along the LONGEST edge / shallower angle (in this case, from TRF -> BRF)...
  this loses some height/vertical difference, thus 'smoothing' out the overall shape.

  | Sharp - movement is along the SHORTEST edge / steeper angle (in this case, from TRF -> TLF)...
  this gains some height/vertical difference, thus 'sharpening' the (detail of the) overall shape.

  | Mixed - movement is split between the two edges - it moves half he distance it needs to along the
  LONGEST edge and half the distance it needs to along the SHORTEST edge/angle.  This method will also
  lose some height (smooth), but not as much as the Smooth operation.
  
...as mentioned, only the 'Flatten' method will move to the exact center in one click... the other 3
only move the vertices 'towards' the center position and might take up to 3-10 clicks to make it to a
point where further clicks no longer have any effect.  This will allow you to switch methods part-way
through, in case you feel like it's getting too smooth or sharp.


v1.2
--------------------
* R12 build
* 2 new color selector gadgets that allow you to change the slide-rail colors


v1.1
--------------------
* 'Clamp Tolerance' option added.
When using the Clamp option, this value determines 'how close' the edge can be slid up to the next
edge. Effectively, this is the size of the 'gap' left between the edges.

The minimum value has been set to 0.1 and the maximum value is 100.0 but if desired, you can change
these more to your liking by editing the 'tool_KyamaSlide.res' text file, found in the following folder:

.\plugins\KyamaSlide\res\description

...one thing to keep in mind is how this value is used... under normal circumstances, as you're sliding
the edges (or vertices that make up the edge(s)), the plugin keeps checking the distance to the next
edge, but also leaves this control's value as a gap, so once the edges (or individual vertices) get
within that distance, they get clamped to that value and stop moving.

However, if the tolerance value starts out larger than the distance to the next edge, it will actually
move the edge (or individual vertices, as needed) backwards, to clamp it at that distance. This can
produce undesired/unexpected results, so if you see something goofy happening, you may need to reduce
the value.


First release (v1.0)
=====================


What's New:
--------------------
In addition to the new builds, I also added two new features (modifying the code fairly extensively
as I did so).  The new features are...


'Relative' sliding:
--------------------
With the original plug-in (or with this option disabled), all vertices move at the same speed as
you move the mouse.

This new option (enabled by default) causes the vertices to move a relative distance as you drag
the mouse (the distance is computed to the next edge in the direction of travel).  Meaning that
some vertices will move faster than others, if they have further to travel to the next edge than
other vertices being moved.

This keeps the relative proportions of the resulting polygons the same and creates smoother edges.


'Clamp'
--------------------
This new option (enabled by default) will limit the sliding to stop at the next encountered edge.
Note that there's not much/any gap left if you move it fully to the edge, so take note that you
might end up with some vertices on top of others.




From Anton's original "About.txt" file:
=========================================================================

version 0.8
current homepage http://cinema4d.yourweb.de/thread.php?threadid=3984

created by Anton Marchenko 
21.12.2006