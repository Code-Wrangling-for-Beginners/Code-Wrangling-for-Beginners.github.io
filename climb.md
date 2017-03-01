---
title: Climb
layout: seminar
---

# Data
I've downloaded and cleaned some data into a _simpler_ set, formatted as a JSON file [solar-system.json](assets/solar-system.json)

<section class="alert danger">
For the examples this week, the javascript module that allows me to put Processing scripts into the web-page does not support the `JSON` related
functions :-( you'll have to try them out for yourself to see the results.
</section>

## Solar System --- Plotting and visualising
<section class="alert note">I've a bit on an astronomy background, so I always like space related data.
</section>
The fields for each object in the data file are:

Name
: the name of the body

Symbol
: the unicode character for the astronomical symbol (if any)

Aphelion
: the furthest distance from the Sun (in km)

Perihelion
: the closest distance from the Sun (in km)

Semi-major axis
: size of the eliptical orbit (longest 'radius') (in km)

Eccentricity
: how circular (eccentricity 0) or not the orbit is

Orbital period
: how long it takes to go round the Sun (in days)

Mean radius
: size of the body (in km)

Mass
: mass of the body (in kg)

The Wikipedia page for the [Solar System](https://en.wikipedia.org/wiki/Solar_System)
has several graphics visualising this kind of data in several ways.

### Orbital distances
The sketch below will draw a series of horizontal bars that show the range of distances a body orbits from the Sun.
<section class="alert processing">
{% include solar_system_1.html %}
</section>

### Orbital plan
From the data given in the file, we can calculate the centre and size of an ellipse to draw for the orbit.  Processing's [`ellipse`](https://processing.org/reference/ellipse_.html) function needs two lengths for the width and height of the ellipse (see also [`ellipseMode`](https://processing.org/reference/ellipseMode_.html)).  If we put Processing into the `RADIUS` mode, the width and height are the semi-major and semi-minor axis.

Semi minor axis
: we can get the _semi-minor-axis_($$b$$) from the given _semi-major-axis_($$a$$) and the _eccentricity_($$e$$)

$$
b = a\sqrt{1-e^2}
$$

The Aphelion($$r_a$$) and Perihelion($$r_p$$) distances add up to the length of the ellipse, or twice the semi-major-axis.  We can calculate the position of the center of the ellipse for Processing to use.

$$
x = a - r_p
$$

<section class="alert processing">
{% include solar_system_2.html %}
</section>

# Making a hash of it
Try the following example.  You will need to add your own `sample.txt` file.   My example used the description of [Hex](https://en.wikipedia.org/wiki/Hex_(Discworld)).
It shows how a hash can be used to do useful things like count word frequencies.  (useful is encryption and decription, monitoring files or network traffic for a high use of particular words)

<section class="alert processing">
{% include word_frequency.html %}
</section>
