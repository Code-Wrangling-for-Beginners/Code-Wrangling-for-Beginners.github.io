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
{% include processing.html sketch="anim_eg_01" %}

<section class="alert question">
### Questions?
 1. Can you see what the equivalent `for()` loop would be?
 2. What happens if you remove the `ìf` statement?
 3. Why is the `ìf` statement written on one line?
</section>

Look over the notes on how [map](https://processing.org/reference/map_.html) works.  

<section class="alert question">
What would values would you use for using map to convert between:
 1. Celsius to Fahrenheit?
 2. Kelvin to Celsius?
 3. Light-years to Astronomical-Units?
 4. Astronomical-Units to <span title="For the purpose of drawing the solar system on the screen">screen coordinates</span>?
 5. Turns to radians?
</section>

# Animation skeleton
For animations we want to use a skeleton
[<code style="color: #006699;"><b>setup</b></code>()](https://processing.org/reference/setup_.html)
can be used to
select a size for the window the program creates. The [**`draw`**`()`](https://processing.org/reference/draw_.html){: style="color:#069"} function
is called each time the screen refreshes. The
 [**`background`**()](https://processing.org/reference/background_.html){: style="color:#069"}
 function
clears the window so the last frame is not visible.

<section class="alert processing">
<a href="assets/skeleton/skeleton.pde">skeleton.pde</a>
{% include skeleton.html %}
</section>


# A Pendulum
A simple [pendulum](http://en.wikipedia.org/wiki/Pendulum)
swinging freely from a pivot point can be
approximated by [simple harmonic motion](http://en.wikipedia.org/wiki/Simple_harmonic_motion)

## Appearance
We can set up our solution by using the pattern where we have a
function that draws the pendulum, and use the [**`translate`**()](https://processing.org/reference/translate_.html){: style="color:#069"}/[**`rotate`**()](https://processing.org/reference/rotate_.html){: style="color:#069"}
mechanism to move the pendulum.

<section class="alert note">
This pattern of separating out the
appearance and motion, is a very
common and useful technique to use.
</section>

<section class="alert processing">
{% include pendulum01.html %}
</section>

<section class="alert question">
## Exercise: 1
Add the drawing code to draw the pendulum
Remember that the pivot point is at (0, 0).
</section>

<section class="alert example">
{% include sketch.html sketch="bob" %}{: style="float:right"}
{% include bob.html %}
</section>

## Motion

We can now turn our attention to the motion. So in
[**`draw`**`()`](https://processing.org/reference/draw_.html){: style="color:#069"}
 we now
need to have

<section class="alert processing">
<pre>
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> angle = motion();
</pre>
</section>

If we were to look up the equation for the movement, we’d get
something like:

$$
\Theta(t) = \Theta_0\sin\left(\frac{2\pi t}{T}\right)
$$

_**We can avoid much of the maths**_ &nbsp; by carefully using the functions
in Processing.
The first step is to get the information we know, into the program
in a convenient form for us. We know the period – the time to make
one complete swing, in seconds; and the amplitude – the maximum
angle the pendulum swings away from the vertical in degrees. We
can add these to the top of the program (before [<code style="color: #006699;"><b>setup</b></code>()](https://processing.org/reference/setup_.html))

<section class="alert processing">
<pre>
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> angle = motion();
</pre>
</section>
