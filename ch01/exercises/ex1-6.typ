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
