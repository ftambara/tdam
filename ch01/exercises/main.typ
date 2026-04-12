#import "../../template.typ": assignment, problem
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#show: body => assignment("Chapter Exercises", "Federico", body)

== Exercise 1-1

#problem[
  Show that $a + b$ can be less than $min(a, b)$.
]

Let $a = -1$ and $b = -1$.

Then $a + b = -2$ and $min(a, b) = -1$.

Since $-2 < -1$, the claim that $a + b$ can be less than $min(a, b)$ holds.


== Exercise 1-2

#problem[
  Show that $a × b$ can be less than $min(a, b)$.
]

Let $a = -1$ and $b = 2$.

Then $a × b = -2$ and $min(a, b) = -1$.

Since $-2 < -1$, the claim that $a × b$ can be less than $min(a, b)$ holds.


== Exercise 1-3

#problem[
  Design/draw a road network with two points a and b such that the
  fastest route between a and b is not the shortest route.
]

We can realize such a network by using speed ‘limits’– which should instead
be treated as fixed speed specifications.

#diagram(
  node((0,0), $a$),
  node((2,2), $b$),
  node((0,2), $c$),

  edge((0,0), (2,2), "->", label: [Route 1, at speed $s_1$]),
  edge((0,0), (0,2), "-", label: [Route 2, at speed $s_2$]),
  edge((0,2), (2,2), "->"),
)

+ *Route 1 (direct):*
  - By the Pythagorean thourem, its length is $d_1 = sqrt(2)l$.
  - Let its speed limit (and minimum speed) be $s_1 = v$.
  - The time to traverse it is $t_1 = d_1 / s_1 = sqrt(2)/v l$

+ *Route 2 (through $c$):*
  - Its lenght is the sums of the lengths of paths $a$ to $c$ and $c$ to $b$, whicth totals $d_2 = 2l$.
  - Let its speed limit (and minimum speed) be $s_2 = 2v$.
  - The time to traverse it is $t_2 = d_2 / s_2 = 2l / 2v = l / v$

*Conclusion:* \
While $d_1 < d_2$, it was shown that $t_1 > t_2$.

$qed$


== Exercise 1-4

#problem[
  Design/draw a road network with two points a and b such that the shortest
  route between a and b is not the route with the fewest turns.
]

We can go from a to b by taking small deviations, which add turns but
amount to little additional distance. This will yield a short path with
a high number of turns. It is easy to create a second path with a small
number of turns that deviates more from the straight-line path, yielding
the desired network.

#diagram(
  node((0,0), $a$),
  node((2,0), $c_1$),
  node((2,1), $c_2$),
  node((4,1), $c_3$),
  node((4,0), $c_4$),
  node((6,0), $b$),
  node((3,3), $d$),

  edge((0,0), "rr",  "->", [Route 1]),  // a  → c1
  edge((2,0), "d",   "->"),             // c1 → c2
  edge((2,1), "rr",  "->"),             // c2 → c3
  edge((4,1), "u",   "->"),             // c3 → c4
  edge((4,0), "rr",  "->"),             // c4 → b
  edge((0,0), (3,3), "->", [Route 2], label-side: right),  // a  → d
  edge((3,3), (6,0), "->"),             // d  → b
)

+ *Route 1:*
  - It's easy to see that the total route length is $d_1 = 2l + l + 2l + l + 2l = 8l$.
  - Number of turns $b_1 = 4$.

+ *Route 2:*
  - By the Pythagorean thourem, its length is $d_2 = 2 dot sqrt(2) dot 3l approx 8.485 l$.
  - Number of turns $b_2 = 1$.

*Conclusion:* \
While $d_1 < d_2$, it was shown that $b_1 > b_2$.

$qed$


