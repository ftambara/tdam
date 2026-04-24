== Exercise 2-31

#problem[
  For each of the following, answer yes, no, or can't tell.

  (a) Is $3^n = O(2^n)$? \
  (b) Is $log 3^n = O(log 2^n)$? \
  (c) Is $3^n = Omega(2^n)$? \
  (d) Is $log 3^n = Omega(log 2^n)$?
]

=== (a)

Assume the condition is true. Then the following must hold:
$
  c 2^n &>= 3^n \
  c &>= 3^n / 2^n \
  c &>= (3/2)^n \
$

No constant $c$ exists that satisfies the condition as $n -> infinity$.

=== (b)

Assume the condition is true. Assume $n > 0$. Then the following must hold:
$
  c log 2^n &>= log 3^n \
  c n log 2 &>= n log 3 \
  c &>= (log 3) / (log 2)
$

The condition holds for any constant $c >= (log 3) / (log 2)$ and $n_0 > 0$.

=== (c)

Assume the condition is true. Assume $n > 0$. Then the following must hold:
$
  c 2^n &<= 3^n \
  c &<= 3^n / 2^n \
  c &<= (3/2)^n
$

The condition holds for any constant $c$ and $n_0 = log_(3/2) c$.

=== (d)

Assume the condition is true. Assume $n > 0$. Then the following must hold:
$
  c log 2^n &<= log 3^n \
  c n log 2 &<= n log 3 \
  c &<= (log 3) / (log 2)
$

The condition holds for any constant $0 < c <= (log 3) / (log 2)$ and $n_0 > 0$.
