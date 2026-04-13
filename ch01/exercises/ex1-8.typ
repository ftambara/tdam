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
