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
