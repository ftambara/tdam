#import "../../template.typ": assignment, problem
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#show: body => assignment("Chapter Exercises", "Federico", body)

#[
== Exercise 1-1

#problem[
  Show that $a + b$ can be less than $min(a, b)$.
]

Let $a = -1$ and $b = -1$.

Then $a + b = -2$ and $min(a, b) = -1$.

Since $-2 < -1$, the claim that $a + b$ can be less than $min(a, b)$ holds.
]


#[
== Exercise 1-2

#problem[
  Show that $a × b$ can be less than $min(a, b)$.
]

Let $a = -1$ and $b = 2$.

Then $a × b = -2$ and $min(a, b) = -1$.

Since $-2 < -1$, the claim that $a × b$ can be less than $min(a, b)$ holds.
]


#[
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
]


#[
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
]


#[
== Exercise 1-5

#set enum(numbering: "(a)")

#problem[
  The _knapsack problem_ is defined as follows: given a set of integers $S = {s_1, s_2, dots, s_n}$
  and a target number $T$, find a subset of $S$ that adds up exactly to $T$.
  For example, there exists a subset within $S = {1, 2, 5, 9, 10}$, that adds up to
  $T = 22$ but not $T = 23$.

  Provide counterexamples for the following algorithms for the knapsack problem.
  That is, give an $S$ and $T$ where the algorithm does not find a solution that leves the
  knapsack completely full, even though a full-knapsack solution exists.

  + Put the elements of S in the knapsack in left to right order if they fit,
    that is, the first-fit algorithm.
  + Put the elements of S in the knapsack from smallest to largest,
    that is, the best-fit algorithm.
  + Put the elements of S in the knapsack from largest to smallest.
]

=== Solutions

These are all greedy heuristics, which can be tricked by constructing sets in ways
that they make them choose elements which are not part of any solution for the problem.

+ Left-to-right

  Let $S = {1, 2}$ and $T = 2$. Picking the first element, $1$, will leave no room
  for the second element, which would be the solution for this problem.

+ Smallest to largest

  Let $S = {1, 2}$ and $T = 2$. Picking the smallest element, $1$, will leave no room
  for element $2$, which would be the solution for this problem.

+ Largest to smallest

  A counter example for this case requires three elements. For example, let $S = {2, 3, 4}$
  and $T = 5$. Picking the largest element, $4$, will be outright wrong, as it is not part of the
  solution, ${2, 3}$.

$qed$
]


#[
== Exercise 1-6

#problem[
  The _set cover problem_ is as follows: given a set $S$ of subsets $S_1, dots, S_m$ 
  of the universal set $U = {1, dots, n}$, find the smallest subset of subsets 
  $T subset.eq S$ such that $union.big_(t_i in T) t_i = U$. 
  
  For example, consider the subsets $S_1 = {1, 3, 5}$, $S_2 = {2, 4}$, 
  $S_3 = {1, 4}$, and $S_4 = {2, 5}$. The set cover of ${1, dots, 5}$ would 
  then be $S_1$ and $S_2$.

  Find a counterexample for the following algorithm: Select the largest subset 
  for the cover, and then delete all its elements from the universal set. 
  Repeat by adding the subset containing the largest number of uncovered 
  elements until all are covered.
]

=== First counterexample: tie on largest set

We can tie two subsets in number of elements, with only one of them being correct.

$ S = {1, 2, 3}, S_1 = {1, 2}, S_2 = {2, 3}, S_3 = {3} $

There's nothing about that algorithm that will make us choose ${2,3}$,
which is part of the solution to this problem, $T = S_2 union S_3$.

=== Second counterexample: bad instance

We can trick the algorithm into picking a large subset that is not part of the solution.

$ S = {1, 2, 3, 4, 5, 6}, S_1 = {2, 3, 4, 5}, S_2 = {1, 2, 3}, S_3 = {4, 5, 6} $

The algorithm will always pick $S_1$, leaving it no choice but to pick up all subsets to
cover $S$. The solution, instead is $T = S_2 union S_3$.
]


