---
title: Taxiing
layout: seminar
---

# Procedures and Functions
In programming terms _procedures_ and _functions_ are often handled in a very similar fashion.

You have already seen two procedures `setup` and `draw`

{% include processing.html name="builtinproc" %}

We can use procedures to simplify the code and to make our life easier

## Drawing Houses
You will have written a simple procedure already, something like this

{% include processing.html name="house" %}

## Building a street
With a little work we can build a street of houses.  First some setting up.

 1. Rewrite the `house` procedure to draw the house at (0,0)
 2. Use the [`translate()`](https://processing.org/reference/translate_.html) function to position the house on the screen
 3. Repeat (Iterate)

 {% include processing.html name="street" %}

<section class="alert question">
 1. Why does the <code><span style="color: #006699;">translate</span>(70,0);</code>
only use 70 and 0?
 2. What do these two numbers mean?
 3. What can you deduce about the effect of repeated translations?
 </section>

### Parameters and generic houses
So far all the  houses are generic, they all look the same.
How can we tell them appart?  How can letters be delivered?

<section class="alert example">
We can rewrite the house procedure to display the house number.  By using a _generic_ house that displays a number.  We can then _parameterise_ this by using the house number as a parameter:
<section class="alert processing">
<pre>
<span style="color: #33997E;">void</span> house(<span style="color: #E2661A;">int</span> n)
{&nbsp;
&nbsp;&nbsp;<span style="color: #006699;">fill</span>(255);
&nbsp;&nbsp;<span style="color: #006699;">triangle</span>( 0,0, 60, 0 , 30, -15);
&nbsp;&nbsp;<span style="color: #006699;">rect</span>( 0,0, 60 , 50 ) ;
&nbsp;&nbsp;<span style="color: #006699;">fill</span>(0);
&nbsp;&nbsp;<span style="color: #006699;">textSize</span>(20);
&nbsp;&nbsp;<span style="color: #006699;">text</span>(<span style="color: #006699;">str</span>(n), 20, 25);
}&nbsp;
</pre>
</section>
It is now a simple matter of repeatedly using our new `house` with different numbers passed as parameters.
</section>

{% include processing.html name="street_numbers" %}

<section class="alert note">
There is a convention used in many streets.  The **odd** numbers are all on one side of the street and the **even** numbers on the other.
</section>

<section class="alert question">
How can you modify the way `draw()` uses `house()` to draw two rows of houses.  With the _odd_ and _even_ numbers on each row?
</section>

## Position
It would be convenient if we could place a house at a specific location, and not have to keep track of where you were from the last house.   Transformations are *additive* so what we need is a way of remembering and restoring the state of things before your used the [`translate()`](https://processing.org/reference/translate_.html) function.

### Modular code
I don't even need to rewrite my `house` function.  I just write another function that wraps this up, in a way to place it anywhere on the screen.
This is a good example of writing modular code, that builds up from smaller, *reusable* pieces.

{% include processing.html name="street_square" %}

### The Matrix (no not that one)
The magic bit is the use of [pushMatrix()](https://processing.org/reference/pushMatrix_.html) and [popMatrix()](https://processing.org/reference/popMatrix_.html).

Bracketing the [`translate()`](https://processing.org/reference/translate_.html) with these preserves the state of the accumulated transformations _before_ I apply the [`translate()`](https://processing.org/reference/translate_.html), and then restores this afterwards.

## Getting some perspective
If ever you have done some drawing, you will have had to cope with perspective.  Things look smaller the further they are away.  We can extend our example to include this. (Look up [scale()](https://processing.org/reference/scale_.html))

### Sequence --- Order matters
Remember _Sequence_, _Selection_, and _Iteration_ (_Repetition_).  The order we do things in matters!
If I modify my `houseat()` function to scale the size of the house, I **_must_** do the _scale_ after the _translate_.  If I don't, I'll end up moving the house in the scaled down units :-(.

### Vanishing point
The simplest way to work out the size of the house is to use a _vanishing point_.   If the house was drawn at the top-left hand corner of the screen, it would be 0 size.  Houses further away are larger.  If I want houses at the bottom of the screen to be normal size, I can use their distance from the origin (_ie._ their position) to work out the scale.

{% include processing.html name="street_perspective" %}

<section class="alert note">
Look up the [dist()](https://processing.org/reference/dist_.html) and [norm()](https://processing.org/reference/norm_.html) functions.  Can you see how Processing provides us with some nice functions to do some of the hard work for us.
</section>

<section class="alert question">
It still isn't great, the houses further away should be closer together.   The streets further away should be closer together too.

1.   Write a function that draws a street, a horizontal row of houses with the right spacing.  It should only need a single parameter, the position on the screen.

2.  Use a loop to draw rows of houses down the screen.
</section>
