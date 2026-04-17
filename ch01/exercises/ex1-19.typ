== Exercise 1-19

#problem[
  Prove by induction that a tree with $n$ vertices has exactly $n - 1$ edges.
]

=== Proposition

Let $s(n)$ represent the number of edges in a tree with $n$ vertices, where $n$ is a positive,
natural number. We must prove $s(n) = n - 1$ for all $n > 0$.

=== Proof

For the *base case* is trivial to observe that a tree of one vertex has zero edges,
so the proposition $s(1) = 1 - 1 = 0$ holds.

For the *inductive case*, assume the proposition holds for all trees of $n = k$, with $k > 0$.
We must prove it also holds for a tree of $k + 1$ vertices.

Take an arbitrary tree of $k+1$ vertices ($k+1 >= 2$).
Any tree with more than one vertex has at least one leaf.
Remove a leaf of this tree along its single incident edge. Because we only removed a leaf and its
edge, we are left with an acyclic, connected graph – a tree – of $k$ vertices.

Applying our hypothesis, we know that this tree must have $s(k) = k - 1$ edges.
Restoring the removed leaf and edge, we must have a tree with one more edge, $k - 1 + 1 = k$.
But this is the same as $s(k+1)$.
This proves our proposition holds for an arbitrary tree of $k+1$ vertices.

$qed$
