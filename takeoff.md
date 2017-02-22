---
title: Takeoff
layout: seminar
---

# Creating Images
We can create many varieties of images.  Using one of  many algorithms we can create a rich kaleidoscope of images.

## Framework
Much of the code needed to create images is pretty much the same.  We can write a framework that handles this common code.   Leaving us just the algorithm to fill in for each image.

The skeleton sketch is:
<section class="alert processing">
{% include image_skeleton.html %}
</section>
The key part is the function
<section class="alert processing"><pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)</pre></section>

This needs 4-numbers:

_x_
: the _x_ pixel coordinate

_y_
: the _y_ pixel coordinate

_w_
: the width of the image in pixels

_h_
: the height of the image in pixels

It then calculates and returns the colour of the pixel.

<section class="alert warning">
In all the following examples, I'm only going to show you the <code>generatePixel</code> function.  You'll have to add it to the code above.
</section>

# Recipes for images

<section class="alert note">
In the recipes below I'll often need to convert coordinate system from (_x_,_y_) to (_u_,_v_).  The (_u_,_v_) coordinates are often used in image processing and manipulation.
</section>

## Make Some Noise
<section class="alert processing">
{% include sketch.html sketch="noise" %}
{% include noise.html %}
</section>
The `noise` function calculates a thing called "Perlin Noise", named after the Computer Scentist _Ken Perlin_ who first developed it.

<section class="alert note">
Ken Perlin's noise function has become widely used in the process of creating images and graphics for the CGI industry and special effects.  So much so, that he has been awarded an
[Oscar](https://cs.nyu.edu/~perlin/doc/oscar.html)
for his contributions to the field.
> To Ken Perlin for the development of Perlin Noise, a technique used to produce natural appearing textures on computer generated surfaces for motion picture visual effects.

</section>

If we take a simple pattern of stripes
<section class="alert processing">
{% include sketch.html sketch="sinetexture" %}
{% include sinetexture.html %}
</section>
Then add some noise
<section class="alert processing">
{% include sketch.html sketch="sinetexturenoise" %}
{% include sinetexturenoise.html %}
</section>
We get something looking like [wood grain](http://paulbourke.net/texture_colour/displayimage.cgi?woodgrain/japaneseash.jpg)

With a different set of operations
<section class="alert processing">
{% include sketch.html sketch="sinetexturenoise2" %}
{% include sinetexturenoise2.html %}
</section>

If instead we recreate the image for each frame, with a different set of operations we get...
<section class="alert processing">
{% include sketch.html sketch="flame" %}
{% include flame.html %}
</section>


## Gradients

The simplest gradient is
<section class="alert processing">
{% include sketch.html sketch="image_gradients" %}
<pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> u = <span style="color: #006699;">norm</span>(x, 0,w);
&nbsp;&nbsp;<span style="color: #33997E;">return</span> <span style="color: #006699;">lerpColor</span>(<span style="color: #006699;">color</span>(0),<span style="color: #006699;">color</span>(255,0,0), u);
}
</pre>
</section>

A radial gradient
<section class="alert processing">
<img src="assets/radial_gradient/radial_gradient.png" style="float:right" />
{% include sketch.html sketch="radial_gradient" %}
<pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> u = <span style="color: #006699;">map</span>(x, 0,w, -1,1);
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> v = <span style="color: #006699;">map</span>(y, 0,h, -1,1);
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> r = <span style="color: #006699;">sqrt</span>(u*u+v*v);
&nbsp;&nbsp;<span style="color: #33997E;">return</span> <span style="color: #006699;">lerpColor</span>(<span style="color: #006699;">color</span>(255,0,0),<span style="color: #006699;">color</span>(0), r);
}
</pre></section>

A repeating gradient
<section class="alert processing">
{% include sketch.html sketch="saw_gradient" %}
<pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> u = <span style="color: #006699;">norm</span>(x%25,0,25);
&nbsp;&nbsp;<span style="color: #33997E;">return</span> <span style="color: #006699;">lerpColor</span>(<span style="color: #006699;">color</span>(0),<span style="color: #006699;">color</span>(255,0,0), u);
}
</pre>
</section>

## Mandelbrot set
The classic image.
<section class="alert processing">
<pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> u = <span style="color: #006699;">map</span>(x, 0,w, -2.5,1);
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> v = <span style="color: #006699;">map</span>(y, 0,h, -1,1);
&nbsp;&nbsp;<span style="color: #E2661A;">int</span> n=0;
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> cx = 0.0;
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> cy = 0.0;
&nbsp;&nbsp;<span style="color: #669900;">while</span>( cx*cx+cy*cy &lt; 4 &amp;&amp; n&lt;255 ) {
&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #E2661A;">float</span> xt = cx*cx - cy*cy + u;
&nbsp;&nbsp;&nbsp;&nbsp;cy&nbsp;=&nbsp;2*cx*cy&nbsp;+&nbsp;v;
&nbsp;&nbsp;&nbsp;&nbsp;cx&nbsp;=&nbsp;xt;
&nbsp;&nbsp;&nbsp;&nbsp;n++;
&nbsp;&nbsp;}
&nbsp;&nbsp;<span style="color: #33997E;">return</span> <span style="color: #006699;">color</span>(255-n);
}
</pre>
{% include sketch.html sketch="mandelbrot_set" %}
</section>

# A Splash of Colour
The images so far have ended up black and white, or monochrome (just red).
We need a way of adding more colour.

## Lerp
The [`lerpColor`](https://processing.org/reference/lerpColor_.html) function allows us to fade between two colours.  All our examples so far have generated a single number, we can use this to drive the mixing of colours.  We some additional logic we can do something like

<section class="alert processing">
{% include sketch.html sketch="rainbow" %}
<pre>
<span style="color: #E2661A;">color</span> generatePixel(<span style="color: #E2661A;">int</span> x, <span style="color: #E2661A;">int</span> y, <span style="color: #E2661A;">int</span> w, <span style="color: #E2661A;">int</span> h)
{
&nbsp;&nbsp;<span style="color: #E2661A;">float</span> u = <span style="color: #006699;">map</span>(x, 0,w, 0,3);
&nbsp;&nbsp;<span style="color: #E2661A;">color</span> c;
&nbsp;&nbsp;<span style="color: #669900;">if</span>(u&lt;1.0){
&nbsp;&nbsp;&nbsp;&nbsp;c&nbsp;=&nbsp;<span style="color: #006699;">lerpColor</span>( <span style="color: #006699;">color</span>(0,0,0), <span style="color: #006699;">color</span>(128,0,0),u);
&nbsp;&nbsp;}<span style="color: #669900;">else</span>
&nbsp;&nbsp;<span style="color: #669900;">if</span>(u&lt;2.0){
&nbsp;&nbsp;&nbsp;&nbsp;u&nbsp;=&nbsp;<span style="color: #006699;">norm</span>(u,1.0,2.0);
&nbsp;&nbsp;&nbsp;&nbsp;c&nbsp;=&nbsp;<span style="color: #006699;">lerpColor</span>( <span style="color: #006699;">color</span>(128,0,0), <span style="color: #006699;">color</span>(240,128,0),u);
&nbsp;&nbsp;}<span style="color: #669900;">else</span>{
&nbsp;&nbsp;&nbsp;&nbsp;u&nbsp;=&nbsp;<span style="color: #006699;">norm</span>(u,2.0,3.0);
&nbsp;&nbsp;&nbsp;&nbsp;c&nbsp;=&nbsp;<span style="color: #006699;">lerpColor</span>( <span style="color: #006699;">color</span>(0,255,0),<span style="color: #006699;">color</span>(0,0,255),u);
&nbsp;&nbsp;}
&nbsp;&nbsp;<span style="color: #33997E;">return</span> c;
}
</pre>
</section>
<section class="alert note">
This is the technique used behind all the fancy gradients you see on webpages
</section>

## A Palette
Artists use a palette of colours.  We could have an internal idea of a palette and then "look-up" the colour in the palette.

_But_ if you want a palette of say 512 colours, it would get _very_ tedious to have to type in the RGB values for each one (thats 1536 numbers, something like 4500 keypresses).  I don't know about you, but I for one am not doing that much typing if I can avoid it.  Besides it is not good programming (see )

## Use an image
Why not use another image as a palette?

Glowing as if Heated
: ![hot](assets/Hot.png)

Black Body Radiation (colours of stars)
: ![bbrad](assets/bbrad.png)

The Visible Spectrum
: ![visspec](assets/visspec.png)

<section class="alert processing">
{% include sketch.html sketch="mandelbrot_set_colour" %}
{% include mandelbrot_set_colour.html %}
</section>
