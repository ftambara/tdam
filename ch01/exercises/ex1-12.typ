== Exercise 1-12

#problem[
  Prove that $sum_(i=1)^n i = (n(n + 1))/2$ for $n >= 0$, by induction.
]

Let us define $f(n)$ as $f(n) =: (n(n + 1))/2$.

=== Base case

Let $n = 0$. The summation yields $sum_(i=1)^0 i = 0$

$ f(0) = (0 (0 + 1)) / 2 = 0$.

The basis case is correct.

=== Inductive step

Assume the proposition holds for an arbitrary integer $k >= 0$, such that $sum_(i=1)^k i = f(k)$.
We must show it holds for $k+1$:

$ sum_(i=1)^(k+1) i &= sum_(i=1)^k i + (k+1) \
                &= f(k) + (k+1) \
                &= (k(k+1))/2 + (k+1) \
                &= (k(k+1) + 2(k+1))/2 \
                &= ((k+1)(k+2))/2 \
                &= ( (k+1)( (k+1)+1 ) )/2 = f(k+1)
$

The general case holds.

$qed$
