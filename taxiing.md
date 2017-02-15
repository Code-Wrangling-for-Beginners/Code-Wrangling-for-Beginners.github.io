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
So far all the  houses are generic 
