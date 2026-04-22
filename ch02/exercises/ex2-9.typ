== Exercise 2-9

#problem[
  For each of the following pairs of functions, $f(n)$ is in $O(g(n))$, $Omega(g(n))$, or $Theta(g(n))$.
  Determine which relationships are correct and briefly explain why.

  (a) $f(n) = log n^2$; $g(n) = log n + 5$ \
  (b) $f(n) = sqrt(n)$; $g(n) = log n^2$ \
  (c) $f(n) = log^2 n$; $g(n) = log n$ \
  (d) $f(n) = n$; $g(n) = log^2 n$ \
  (e) $f(n) = n log n + n$; $g(n) = log n$ \
  (f) $f(n) = 10$; $g(n) = log 10$ \
  (g) $f(n) = 2^n$; $g(n) = 10n^2$ \
  (h) $f(n) = 2^n$; $g(n) = 3^n$
]

Assuming $log n$ is the natural logarithm of $n$.

=== (a)

$
  lim_(n->infinity) f(n) / g(n) &= lim_(n->infinity) (log n^2) / (log n + 5) \
                                &= lim_(n->infinity) 2 / (1 + 5/log n) = 2 / (1 + 0) = 2
$

Verdict: $f(n) in Theta(g(n))$.

=== (b)

$
  lim_(n->infinity) f(n) / g(n) &= lim_(n->infinity) sqrt(n) / (log n^2) \
                                &= lim_(n->infinity) 2^(lg n^(1/2)) / (2 log n) \
                                &= lim_(n->infinity) ((2^(1/2))^(lg n)) / (2/(lg e) lg n) -> infinity
$

Given that $f(n)$ dominates $g(n)$, $f(n) in Omega(g(n))$. This agrees with the fact that, as $x -> infinity$,
$x^a > lg x$ for any $a > 0$.

=== (c)

$
  lim_(n->infinity) f(n) / g(n) &= lim_(n->infinity) (log^2 n) / (log n) = log n -> infinity
$

Verdict: $f(n) in Omega(g(n))$.

=== (d)

$
  lim_(n->infinity) f(n) / g(n) = lim_(n->infinity) n / (log^2 n)
$

Given that we have $infinity/infinity$, we apply L'Hôpital's rule.

We obtain $d/(d n) (log^2 n)$ using the chain rule:

$ d/(d n)(log^2 n) = d/(d n)(log n) dot d/(d u)(u^2) = 1/n dot 2 u = 2/n log n $

$
  lim_(n->infinity) n / (log^2 n) &= lim_(n->infinity) 1 / (2/n log n)
                                  &= lim_(n->infinity) 1/2 n/(log n) -> infinity
$

We could apply l'Hôpital's rule again, but we already know that $n$ dominates $log n$,
so $f(n) in Omega(g(n))$.

=== (e)

$
  lim_(n->infinity) f(n) / g(n) &= lim_(n->infinity) (n log n + n) / (log n)
                                &= lim_(n->infinity) n + n / (log n) -> infinity
$

Verdict: $f(n) in Omega(g(n))$.

=== (f)

Both $f(n)$ and $g(n)$ are constant with respect to $n$, so neither dominates as $n$ grows large.

Verdict: $f(n) in Theta(g(n))$; that is, $f(n) in Theta(1)$.

=== (g)

$
  lim_(n->infinity) f(n) / g(n) = lim_(n->infinity) 2^n / (10n^2) = 1/10 lim_(n->infinity) 2^n / (2^(2 lg n)) -> infinity
$

Given that $f(n)$ dominates $g(n)$, $f(n) in Omega(g(n))$. This agrees with the fact that, as $x -> infinity$,
$a^x > x^b$ for any $a > 1$ and $b > 1$.

=== (h)
  (h) $f(n) = 2^n$; $g(n) = 3^n$

$
  lim_(n->infinity) f(n) / g(n) = lim_(n->infinity) 2^n / 3^n = lim_(n->infinity) (2/3)^n = 0
$

Given that $g(n)$ dominates $f(n)$, $f(n) in O(g(n))$.
