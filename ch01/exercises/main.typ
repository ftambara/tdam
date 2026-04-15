#import "../../template.typ": assignment, problem
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

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


#[
== Exercise 1-7

#problem[
  The _maximum clique_ problem in a graph $G = (V, E)$ asks for the largest 
  subset $C$ of vertices $V$ such that there is an edge in $E$ between every 
  pair of vertices in $C$. 

  Find a counterexample for the following algorithm: 
  1. Sort the vertices of $G$ from highest to lowest degree. 
  2. Considering the vertices in order of degree, for each vertex, add it to 
     the clique if it is a neighbor of all vertices currently in the clique. 
  3. Repeat until all vertices have been considered.
]

If we consider the fact that this algorithm will always pick the highest-degree vertex,
we can construct a graph in which such a vertex is not part of the maximum clique.

#import fletcher.shapes: circle

#diagram(
  node-shape: circle,
  node-stroke: black,
  // edge-stroke: black + 1pt,

  node((0, 0), $a$, name: <left>),          // Far left node
  node((1, 0), $b$, name: <hub>),           // Center of the cross
  node((1, 1), $c$, name: <top>),           // Top of the cross
  node((1, -1), $d$, name: <bottom>),       // Bottom of the cross
  node((2, 0), $e$, name: <mid>),           // Node between cross and triangle
  node((3, 1), $f$, name: <tri_top>),     // Top node of the triangle
  node((3, -1), $g$, name: <tri_bottom>), // Bottom node of the triangle

  // --- Edges ---
  // Cross structure
  edge(<left>, <hub>),
  edge(<hub>, <top>),
  edge(<hub>, <bottom>),
  edge(<hub>, <mid>),
  
  // Triangle structure
  edge(<mid>, <tri_top>, stroke: red),
  edge(<mid>, <tri_bottom>, stroke: red),
  edge(<tri_top>, <tri_bottom>, stroke: red),
)

The algorithm will pick $b$ first, which is not part of the solution,
making it impossible to arrive to $C = {e, g, f}$.
]


#[
== Exercise 1-8

#problem[
  Prove the correctness of the following recursive algorithm to multiply two 
  natural numbers, for all integer constants $c >= 2$.

  $
    &"Multiply"(y, z) \
    &quad "if " z = 0 " then return"(0) " else" \
    &quad "return"("Multiply"(c y, floor(z/c)) + y dot (z mod c))
  $
]

=== Proof

If the algorithm were correct, we must prove that $"Multiply"(y, z) = y z$.

*Base case*:\
Let $z = 0$. By definition, $"Multiply"(y, 0) = 0$. Since $y dot 0 = 0$, the identity holds.

*Induction*:\

Assume that for some $n > 0$, $"Multiply"(y,k) = y k$ holds for all $0 <= k < n$. By definition:

$ "Multiply"(y,n) = "Multiply"(c y, floor(n/c)) + y (n mod c) $

Applying the inductive hypothesis:

$ "Multiply"(y,n) = (c y) floor(n/c) + y (n mod c) $

By the equivalence $floor(z/c) = (z - z mod c) / c$,

$
"Multiply"(y,n) &= (c y) (n - n mod c) / c + y (n mod c) \
                &= y (n - n mod c) + y (n mod c) \
                &= y (n - n mod c + n mod c) \
                &= y n
$

*Termination*:\

Given that $c >= 2$, the sequence $z_(i+1) = floor(z_i/c)$ is strictly decreasing for all $z > 0$.

$qed$
]


#[
== Exercise 1-9

#problem[
  Prove the correctness of the following algorithm for evaluating a polynomial
  $a_n x^n + a_(n-1) x^(n-1) + dots + a_1 x + a_0$.

  $
    &"Horner"(a, x) \
    &quad p = a_n \
    &quad "for " i " from " n - 1 " to " 0 \
    &quad quad p = p x + a_i \
    &quad "return " p
  $
]

=== My original attempt

By working through a few iterations, it is clear that the algorithm does the right thing. However, I'm
having a hard time with the proof. This much I know:

$ "Horner"(a, x) = p(0) $

Here, $p(i)$ is the value of variable $p$ at iteration $i$. Perhaps confusingly, the value of $i$
dercreases after each iteration. Once it reaches $0$, we have our solution.

Transcribing from the pseudocode,

$ p(i) = p(i+1) x + a_i $

Therefore, $p(0) = p(1) x + a_0$.

We would like to assume that $p(1) = (a_1 x + a_2 x^2 + ... + a_n x^n) / x$. In other words:

$ p(i) = (sum_(k=i)^(n) a_k x^k) / (x^i) $

If we take this closed-form solution to be correct, then we can prove that:
$ p(i) &= sum_(k=i)^(n) a_k x^(k-i) $

Extracting the first term from the sum and rearranging the second to have the shape we want:
$
  p(i) &= a_i + (sum_(k=i+1)^(n) a_k x^(k-i)) x/x \
       &= a_i + (sum_(k=i+1)^(n) a_k x^(k-i-1)) x \
       &= a_i + (sum_(k=i+1)^(n) a_k x^(k-(i+1))) x \
       &= a_i + p(i+1) x
$

Which has the exact property we were looking for. I guess this, combined with the fact that the series
terminates at $p(n) = a_n$ by definition, is enough. $qed$?

=== After taking a peek at a few ways of solving this problem

It turns out I wasn't that far off. I only needed a structured approach that seems to be useful for
this kinds of situations: Loop invariants. It seems that loop invariants are proven in three steps:
- Proving the invariant holds at the beginning (Initialization)
- Proving it holds between iterations (Maintenance)
- Proving it holds after the last iteration (Termination)

Now, my version:

==== Loop invariant

By looking at the algorithm, it can be seen that

$ "Horner"(a, x) = p(0) x + a_0 $

Where $p(0)$ is the value of the program variable $p$ at the start of the last iteration.
Generalizing, we say that $p(i)$ is the value of the program variable $p$ at the start of
iteration $i$.

$ p(i) = p(i+1) x + a_(i+1) $

Note: iterations are enumerated by the value that the program variable $i$ takes on each
iteration. Therefore, as the loop progresses, $i$ decreases. If we want to talk about
the previous iteration, we must refer to $i+1$.

Note 2: We are focusing on the value of $p$ at the _start_ of each iteration and not at
the end, because it makes slightly easier to check the invariant holds in the initialization case.

By manually working out a few more terms of $p(i)$, (we arrive at something like
$"Horner"(a, x) = $), we can make an educated guess at the shape of the loop invariant:

$
  p(i) &= (p(i+2) x + a_(i+2)) x + a_(i+1) \
       &= p(i+2) x^(i+2) + a_(i+2) x + a_(i+1) \
       &= sum_(k=i+1)^(n) a_k x^(k-(i+1))
$

Now we need to prove that this invariant holds throught the entire loop.

==== Initialization

At the start of the loop, we know that $p = a_n$.

$
  p(n-1) &= sum_(k=(n-1)+1)^(n) a_k x^(k-((n-1)+1)) \
         &= sum_(k=n)^(n) a_k x^(k-n)
         &= a_n
$

The invariant holds in this case.

==== Maintenance

We must show that the invariant holds from iteration to iteration. That is, calculating the next
iteration must be consistent with the invariant equation.

$
  p_(i+1) &= sum_(k=(i+1)+1)^(n) a_k x^(k-((i+1)+1)) \
          &= sum_(k=i+2)^(n) a_k x^(k-(i+2))
$

$
  p_i &= p_(i+1) x + a_(i+1) \
      &= (sum_(k=i+2)^(n) a_k x^(k-(i+2))) x + a_(i+1) \
      &= sum_(k=i+2)^(n) a_k x^(k-(i+1)) + a_(i+1)
$

But the right term is exactly what we would get if we evaluated the left-term
summation at $k=i+1$.

$ a_(i+1) x^((i+1)-(i+1)) = a_(i+1) $

Therefore, we can include it in the summation and simplify:

$ p_i = sum_(k=i+1)^(n) a_k x^(k-(i+1)) $

Which which shows that the invariant holds between iterations.

==== Termination

We must show that $p$ after the loop yields the polynomial summation:

$
  p_"end" &= p_0 x + a_0 \
          &= (sum_(k=1)^(n) a_k x^(k-1)) x + a_0 \
          &= sum_(k=1)^(n) a_k x^k + a_0
$

Similarly to how it was shown in the maintenance case, the last term can be
expressed as the first term of the summation:

$ p_"end" &= sum_(k=0)^(n) a_k x^k $

Which is the polynomial equation.

$qed$
]


#[
== Exercise 1-10

#problem[
  Prove the correctness of the following sorting algorithm.

  $
    &"Bubblesort"(A) \
    &quad "for " i " from " n " to " 1 \
    &quad quad "for " j " from " 1 " to " i - 1 \
    &quad quad quad "if " (A[j] > A[j + 1]) \
    &quad quad quad quad "swap the values of " A[j] " and " A[j + 1]
  $
]

The inner loop does the following operation for iteration $j$.
$A_j, A_(j+1) = min(A_j, A_(j+1)), max(A_j, A_(j+1))$

Therefore $A_j >= A_(j+1)$.

=== Invariant

I claim that this maintains the invariant $A_j = max(A_(1:j))$.
In consequence, the outer loop invariant is $A_i = max(A_(1:i))$. This outer loop
invariant has the desirable property that, after all iterations,
$A'_1 <= A'_2 <= ... <= A'_(n-1) <= A'_n$.

Note: I'm using the notation $max(A_(1:i))$ to mean “the maximum value of all
elements from $A_1$ up to and including $A_i$”.

=== Initialization

When $j = 1$, according to the invariant, $A_1 = max(A_(1:1)) = A_1$, so the invariant
holds in this case (a single item array is sorted by definition).

=== Maintenance

When $j = k$, according to the invariant, $A_k = max(A_(1:k))$. To calculate $A_(k+1)$,
we use the formula:
$
  A_(k+1) &= max(A_k, A_(k+1)) \
          &= max(max(A_(1:k)), A_(k+1)) \
          &= max(A_(1:(k+1)))
$

The invariant holds in this case.

=== Termination

When $j = i-1$:

$
  A_i &= max(A_(i-1), A_i) \
      &= max(max(A_(1:(i-1))), A_i) \
      &= max(A_(1:i))
$

The outer loop invariant holds in this case.

$qed$
]


