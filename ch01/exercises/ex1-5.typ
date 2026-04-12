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
