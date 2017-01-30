---
title: Moving On
layout: seminar
---
# Code Wrangling for Beginners

## Moving On --- Animation

### Remember
How we made changes in reaction to user input?
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
What is happening here is the image drawn changes over time -- an animation.


<section class="alert note">
We can think of [animation](https://en.wikipedia.org/wiki/Animation)
as a [flip book](https://en.wikipedia.org/wiki/Flip_book), a series of pictures.

The `draw()` function is called (used) by processing each time the display
 updates.  We can think of this as drawing each frame in an animation.
 </section>

To make an animation we need to provide a draw function that draws a different picture each time it is used by Processing.
The trick is to work out how the picture changes over time.

<section class="alert note">
We can't use a `for` loop like we have with the plotting examples and the spiral examples.

We need to use an algorithm that allows us to update the picture,
while remembering the important information from frame to frame.
</section>

Try the following example:
<section markdown="0" class="alert processing">
<img src="assets/animation01.gif" style="float:right">
<pre>
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>setup</b></span>()
{
&nbsp;&nbsp;<span style="color: #006699;">size</span>(200,400);
}

<span style="color: #E2661A;">float</span> x = 0;
<span style="color: #E2661A;">float</span> y = 0;
<span style="color: #33997E;">void</span> <span style="color: #006699;"><b>draw</b></span>()
{
&nbsp;&nbsp;<span style="color: #006699;">background</span>(204);
&nbsp;&nbsp;<span style="color: #006699;">rect</span>(x,y,5,5);
&nbsp;&nbsp;x&nbsp;=&nbsp;x&nbsp;+&nbsp;1;
&nbsp;&nbsp;y&nbsp;=&nbsp;x*x/100;
}
</pre>
</section>

<section class="alert question">
</section>
<img src="assets/anim02.gif" style="float:right">
and
<canvas data-processing-sources="assets/animex01.pde"></canvas>
the end
{% include sketch.html sketch="imageEx" %}
