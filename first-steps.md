---
title: First Steps
layout: seminar
---

# Code Wrangling for Beginners

## First Steps

Welcome to the first seminar's material.  Here you'll be taking your first steps in the journey of programming.


![Processing](assets/Processing_Logo.png){: style="float:left"}
We will be using Processing as the programming language in these seminars. &nbsp;\\
The Processing website ([https://processing.org](https://processing.org))
has plenty of good [reference](https://processing.org/reference/) material, [turorials](https://processing.org/tutorials/) and [examples](https://processing.org/examples/), as well as a [Download](https://processing.org/download/) page where you can get your own copy of Processing.

{: style="clear:left"}
#  Draw something...

You should have seen and done something like these:

<section markdown="0" class="alert processing">
<img src="assets/Example01.png" style="float:right">
<pre>
<span style="color: #006699;">fill</span>( 255,127,0 );
<span style="color: #006699;">rect</span>( 30,30, 50,40 );
<span style="color: #006699;">fill</span>( 0,127,127 );
<span style="color: #006699;">rect</span>( 20,20, 50,40 );
</pre>
</section>

<section class="alert question">
**Exercise:**  Draw a picture of a house. \\
Make use of [rectangles](https://processing.org/reference/rect_.html) for the house, doors, and windows.  You may also want to look at [triangles](https://processing.org/reference/triangle_.html) and [quadrilaterals](https://processing.org/reference/quad_.html) for additional features.
</section>

<section class="alert note">
I find the following pages on Wikipedia useful for finding values to use for the RGB tripple in [`fill()`](https://processing.org/reference/fill_.html) and [`stroke()`](https://processing.org/reference/stroke_.html)
  * [List of colors (compact)](https://en.wikipedia.org/wiki/List_of_colors_(compact))
  * [List of colors by shade](https://en.wikipedia.org/wiki/List_of_colors_by_shade)
  * [List of Crayola crayon colors](https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors)
</section>
# Interaction
### Changing the way things happen
You may want to review the role of the [`setup()`](https://processing.org/reference/setup_.html) and [`draw()`](https://processing.org/reference/draw_.html) functions before continuing.

We can make the behaviour change in response to input from the user:

<section markdown="0" class="alert processing">
<img src="assets/Example02.png" style="float:right">
<pre>
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{
&nbsp;&nbsp;<span style="color: #669900;">if</span> (<span style="color: #D94A7A;">mouseX</span>&gt;20)
&nbsp;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #006699;">fill</span>( 255,127,0 );
&nbsp;&nbsp;}&nbsp;<span style="color: #669900;">else</span>
&nbsp;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #006699;">fill</span>( 150,201,34 );
&nbsp;&nbsp;}&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">rect</span>( 20,20, 50,40 );
}
</pre>
</section>

<section class="alert question">
**Exercise:** Read up on the logical [AND](https://processing.org/reference/logicalAND.html) operator.

**Exercise:** can you modify the code above so that the rectangle is Orange when the mouse is inside the rectangle and green otherwise?

_Hint:_  This seems hard at first.  Break the problem down into smaller steps.  
 1. Change colour if the mouse is inside the limits of the rectangle in the horizontal (_x_) direction alone.
 2. Change colour if the mouse is inside the limits of the rectangle in the vertical (_y_) direction alone
 3. Change colour if both horizontal and vertical directions apply

Draw a diagram, think about the values of (say *x*) that are inside the rectangle.  What is the meaning of the parameters (values used by) `rect()`

You may need to ask your tutor to work through this with you.
</section>

## Programming as a labour saving exercise
Remember that we can create several shapes using the computational power of programming languages.  You may find it useful to look up the [add assign](https://processing.org/reference/addassign.html) operator in the Processing reference.

<section markdown="0" class="alert processing">
<img src="assets/Example03.png" style="float:right">
<pre>
<span style="color: #669900;">for</span>(<span style="color: #E2661A;">int</span> n=0 ; n&lt;<span style="color: #D94A7A;">width</span> ; n+=20)
{
&nbsp;&nbsp;<span style="color: #006699;">rect</span>(n, n/2, 50,50 );
}
</pre>
</section>


Recall from the lecture slides:
<section markdown="0" class="alert processing">
<img src="assets/Example04.png" style="float:right">
<pre>
<span style="color: #E2661A;">int</span> horizontal = 0;
<span style="color: #E2661A;">int</span> vertical = 0;

<span style="color: #006699;">fill</span>( 255,127,0 );
<span style="color: #669900;">while</span>( horizontal &lt; <span style="color: #D94A7A;">width</span> )
{
&nbsp;&nbsp;vertical&nbsp;=&nbsp;(horizontal*horizontal)/100;
&nbsp;&nbsp;<span style="color: #006699;">rect</span>(horizontal,vertical, 5,5 );
&nbsp;&nbsp;horizontal&nbsp;=&nbsp;horizontal&nbsp;+&nbsp;5;
}
</pre></section>

<section class="alert question">
**Question:** How could the above example be rewritten using a [`for`](https://processing.org/reference/for.html) statement rather than a [`while`](https://processing.org/reference/while.html) statement?
</section>

<section class="alert question">
Take a look at the gallery of patterns in "Week 2"'s folder on blackboard.

Try experimenting with these patterns, changing some of the values, and calculations.

Can you use the `for` loop parameter (usually `i`) to change the colour of the lines as each is drawn (look up [`stroke()`](https://processing.org/reference/stroke_.html))
</section>

## Charts, graphs, and other pretty pictures.
Remember from the lecture how we can modify how the screen is used to draw pictures in a more conventional mathematical format.
<section markdown="0" class="alert processing">
<img src="assets/Example05.png" style="float:right">
<pre>
<span style="color: #E2661A;">int</span> hoz = 0;
<span style="color: #E2661A;">int</span> vert = 0;

<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>setup</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">size</span>(320, 480);
}&nbsp;

<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">scale</span>(1, -1);
&nbsp;&nbsp;<span style="color: #006699;">translate</span>(0, -<span style="color: #D94A7A;">height</span>);
&nbsp;&nbsp;<span style="color: #006699;">fill</span>( 255, 127, 0 );
&nbsp;&nbsp;<span style="color: #669900;">while</span>( hoz &lt; <span style="color: #D94A7A;">width</span> )
&nbsp;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;vert&nbsp;=&nbsp;(&nbsp;hoz*hoz&nbsp;)/200;
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #006699;">rect</span>( hoz, vert, 5, 5 );
&nbsp;&nbsp;&nbsp;&nbsp;hoz&nbsp;=&nbsp;hoz&nbsp;+&nbsp;5;
&nbsp;&nbsp;}
}&nbsp;
</pre></section>

We can draw a line for the curve by modifying the program as follows:
<section markdown="0" class="alert processing">
<img src="assets/Example06.png" style="float:right">
<pre>
<span style="color: #E2661A;">int</span> hoz = 0;
<span style="color: #E2661A;">int</span> vert = 0;

<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>setup</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">size</span>(320, 480);
}&nbsp;

<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">scale</span>(1, -1);
&nbsp;&nbsp;<span style="color: #006699;">translate</span>(0, -<span style="color: #D94A7A;">height</span>);
&nbsp;&nbsp;<span style="color: #006699;">noFill</span>();
&nbsp;&nbsp;<span style="color: #006699;">stroke</span>( 255, 127, 0 );
&nbsp;&nbsp;<span style="color: #006699;">beginShape</span>();
&nbsp;&nbsp;<span style="color: #669900;">while</span>( hoz &lt; <span style="color: #D94A7A;">width</span> )
&nbsp;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;vert&nbsp;=&nbsp;(&nbsp;hoz*hoz&nbsp;)/200;
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #006699;">vertex</span>( hoz, vert );
&nbsp;&nbsp;&nbsp;&nbsp;hoz&nbsp;=&nbsp;hoz&nbsp;+&nbsp;5;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span style="color: #006699;">endShape</span>();
}&nbsp;
</pre></section>

We can define our own functions to simplify the drawing process.
<section markdown="0" class="alert processing">
<img src="assets/Example07.png" style="float:right">
<pre>
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>setup</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">size</span>(320, 480);
}&nbsp;

<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{&nbsp;
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> x,y;
&nbsp;&nbsp;<span style="color: #006699;">scale</span>(1, -1);
&nbsp;&nbsp;<span style="color: #006699;">translate</span>(<span style="color: #D94A7A;">width</span>/2, -<span style="color: #D94A7A;">height</span>/2);
&nbsp;&nbsp;<span style="color: #006699;">stroke</span>(0);
&nbsp;&nbsp;<span style="color: #006699;">line</span>(0,<span style="color: #D94A7A;">height</span>,0,-<span style="color: #D94A7A;">height</span>);
&nbsp;&nbsp;<span style="color: #006699;">line</span>(<span style="color: #D94A7A;">width</span>,0,-<span style="color: #D94A7A;">width</span>,0);
&nbsp;&nbsp;<span style="color: #006699;">noFill</span>();
&nbsp;&nbsp;<span style="color: #006699;">stroke</span>( 255, 127, 0 );
&nbsp;&nbsp;<span style="color: #006699;">beginShape</span>();
&nbsp;&nbsp;<span style="color: #669900;">for</span>( x= -<span style="color: #D94A7A;">width</span>/2 ; x&lt;<span style="color: #D94A7A;">width</span>/2 ; x+= 10)
&nbsp;&nbsp;{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;y&nbsp;=&nbsp;f(x);
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #006699;">vertex</span>( x, y );
&nbsp;&nbsp;}
&nbsp;&nbsp;<span style="color: #006699;">endShape</span>();
}&nbsp;

<span style="color: #E2661A;">float</span> f(<span style="color: #E2661A;">float</span> x)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> f;
&nbsp;&nbsp;f&nbsp;=&nbsp;x*x*x/10000;
&nbsp;&nbsp;<span style="color: #33997E;">return</span> f;
}
</pre></section>

Make sure you have read through the tutorials on [Coordinate Systems](http://processing.org/tutorials/drawing/), [Drawing Curves](https://processing.org/tutorials/curves/), (you may find the introduction to [trigonometry](http://processing.org/tutorials/trig/) useful)

for examples of shapes to draw I find [spirals](http://en.wikipedia.org/wiki/Spiral) useful

For more information on coordinate systems the following Wikipedia pages are useful: [Coordinate system](http://en.wikipedia.org/wiki/Coordinate_system), [Cartesian coordinate system](http://en.wikipedia.org/wiki/Cartesian_coordinate_system) and [Polar coordinate system](http://en.wikipedia.org/wiki/Polar_coordinate_system)


<section class="alert question">
Try some functions for yourself?  The **Math** section of the [Processing Reference](https://processing.org/reference/) lists the built-in functions.
Experiment with other functions.
</section>

<section class="alert note">
I come from an engineering and science background, which are a rich source of interesting functions, and ways of visualising them.
</section>
## Parametric curves
Another family of curves can be drawn using [Parametric equations](https://en.wikipedia.org/wiki/Parametric_equation).

Consider the [Archimedean spiral](https://en.wikipedia.org/wiki/Archimedean_spiral).

A simple Processing program is:
<section markdown="0" class="alert processing">
<img src="assets/Example08.png" style="float:right">
<pre>
<span style="color: #E2661A;">int</span> turns=10;
<span style="color: #E2661A;">float</span> a=1.5;

<span style="color: #006699;">scale</span>(1,-1);
<span style="color: #006699;">translate</span>( <span style="color: #D94A7A;">width</span>/2, -<span style="color: #D94A7A;">height</span>/2 );

<span style="color: #006699;">noFill</span>();
<span style="color: #006699;">beginShape</span>();
<span style="color: #669900;">for</span>(<span style="color: #E2661A;">int</span> d=0 ; d&lt;360*turns ; d+=10)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> angle = <span style="color: #006699;">radians</span>(d);
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> radius = angle*a;
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> x = radius*<span style="color: #006699;">cos</span>(angle);
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> y = radius*<span style="color: #006699;">sin</span>(angle);
&nbsp;&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">vertex</span>(x,y);
}
<span style="color: #006699;">endShape</span>();
</pre>
</section>
<section class="alert question">
Some things to think about:
   * Is it better to think in degrees or radians?
   * what is the meaning of the variables used?
</section>

<section class="alert question">
Modify the code to draw other spirals.  See https://en.wikipedia.org/wiki/Spiral

If you want more of a challenge try some of the other curves  found on http://paulbourke.net/geometry/

(the 2D ones are near the bottom).
</section>
