== Exercise 1-13

#problem[
  Prove that $sum_(i=1)^n i^2 = (n(n + 1)(2n + 1))/6$ for $n >= 0$, by induction.
]


Let $f(n) := sum_(i=1)^n i^2$ and $g(n) := (n(n + 1)(2n + 1))/6$.

*Proposition*: $f(n) = g(n)$ for $n >= 0$.

=== Proof

==== Base case

Assume $n = 0$. Then $f(0) = g(0) = 0$.

==== Induction case

Assume the proposition holds for $n = k$, where $k >= 0$.
Then we must prove it also holds for $n = k+1$.

$ f(k+1) = sum_(i=1)^(k+1) i^2 = sum_(i=1)^k i^2 + (k+1)^2 $

By our inductive hypothesis, we can substitute $sum_(i=1)^k i^2$ by $g(k)$.
Therefore, $f(k+1) &= g(k) + (k+1)^2$. To complete the proof, we must show that
$f(k+1) = g(k+1)$.

$ g(k+1) = ((k+1)((k+1) + 1)(2(k+1) + 1))/6 = ((k+1) (k+2) (2k+3))/6 $

$ 
  g(k) + (k+1)^2 &= (k (k+1) (2k+1))/6 + (k+1)^2 \
                 &= (k (k+1) (2k+1) + 6 (k+1)^2)/6 \
                 &= ((k+1)/6) (k (2k+1) + 6 (k+1)) \
                 &= ((k+1)/6) (2k^2 + 7k + 6)) \
                 &= ((k+1)/6) (k+2) (2k+3) \
                 &= ((k+1) (k+2) (2k+3))/6 = g(k+1)
$

$qed$
