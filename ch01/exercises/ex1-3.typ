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
