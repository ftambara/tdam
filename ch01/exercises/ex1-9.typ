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
