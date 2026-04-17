== Exercise 1-23

#problem[
  How many hours are one million seconds? How many days? Answer these 
  questions by doing all arithmetic in your head.
]

=== Hours in a million seconds

==== Original solution

An hour has 3600 seconds. Simplifying some zeroes out:

$ 10^4/36 $

I used two approximations:
+ $100/3 approx 33.3$, or $100/33.3 approx 3$.
+ $36 approx 33 * 1.1$.

Therefore $10^4 / 36 approx (100 * 3) / 1.1 approx 270$.

==== Neat approximation

Looking around I've seen the approximation of $a(x,y) approx h(x,y)$ when $x approx y$.
That is, the arithmetic mean is approximately equal to the harmonic mean when $x$ and $y$ are close.

In this case, if we recognize that 3.6 is close to the mean between 3 and 4, we can use:

$ 1000/3.6 approx 1000/((3+4)/2) approx 1000/(2/(1/3 + 1/4)) = (1000/3 + 1000/4)/2 approx (330 + 250)/2 = 290 "hours" $

The actual answer was $277.overline(7) "hours"$.

=== Days in a million seconds

A day has 24 hours.

$ 10^6 / (24 * 3600) = 10^2 / (2.4 * 3.6) = 10^2 / (3 - .6)(3 + .6) = 10^2 / (3^2 - .6^2) = 10^2 / (9 - .36) approx 10^2 / (10 / 1.1) = 11 "days" $

But that was very complicated, so probably I should have just done 240 + 30 which is about 11 days.
