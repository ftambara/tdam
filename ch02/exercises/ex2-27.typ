== Exercise 2-27

#problem[
  Find two functions $f(n)$ and $g(n)$ that satisfy the following relationship.
  If no such $f$ and $g$ exist, write “None.”

  (a) $f(n) = o(g(n))$ and $f(n) != Theta(g(n))$ \
  (b) $f(n) = Theta(g(n))$ and $f(n) = o(g(n))$ \
  (c) $f(n) = Theta(g(n))$ and $f(n) != O(g(n))$ \
  (d) $f(n) = Omega(g(n))$ and $f(n) != O(g(n))$
]

=== (a)

By definition, if $f(n) in o(g(n))$, then $f(n) in Theta(g(n))$ cannot be true, since the
former requires dominance, while the latter requires $f$ and $g$ to grow at the same rate.

For completeness, I pick $f(n) = 1$ and $g(n) = n$.

=== (b)

See (a).

None.

=== (c)

Not possible, since $f(n) in Theta(n)$ implies $f(n) in O(n)$.

None.

=== (d)

Let $f(n) = n$ and $g(n) = 1$. Then $n in Omega(1)$ and $n in.not O(1)$.
