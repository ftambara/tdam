== Exercise 2-1

#problem[
  What value is returned by the following function?

  $
    &"Mystery"(n) \
    &quad r = 0 \
    &quad "for " i = 1 " to " n - 1 " do" \
    &quad quad "for " j = i + 1 " to " n " do" \
    &quad quad quad "for " k = 1 " to " j " do" \
    &quad quad quad quad r = r + 1 \
    &quad "return"(r)
  $
]

The number of operations `C(n)` is proportional to the sum:

$
  C(n) &= sum_(i=1)^(n-1) sum_(j=i+1)^(n) sum_(k=1)^(j) 1 \
       &= sum_(i=1)^(n-1) sum_(j=i+1)^(n) j \
       &= sum_(i=1)^(n-1) sum_(j=i+1)^(n) j
$

To expand the inner summation we use the following identity (assuming $i >= 1$):

$ sum_(j=i+1)^(n) j = sum_(j=1)^(n) j - sum_(j=1)^(i) j = 1/2 n (n+1) - 1/2 i (i+1) $

Replacing it in our equation

$
  C(n) &= sum_(i=1)^(n-1) 1/2 (n-i)(n+i+1) \
       &= sum_(i=1)^(n-1) 1/2 n (n+1) - 1/2 i (i+1) \
       &= 1/2 sum_(i=1)^(n-1) n (n+1) - 1/2 sum_(i=1)^(n-1) i (i+1) \
       &= 1/2 n (n+1)(n-1) - 1/2 sum_(i=1)^(n-1) (i^2 + i) \
       &= 1/2 n (n^2 - 1) - 1/2 (1/6 (n-1) n (2n - 1)) - 1/2 (1/2 (n-1) n) \
       &= 1/2 (n^3 - n) - 1/12 (2n^3 - 3n^2 + n) - 1/4 (n^2-n) \
       &= 1/12 (6n^3 - 6n - 2n^3 + 3n^2 - n - 3n^2 + 3n) \
       &= 1/12 (4n^3 - 4n)
       &= (n^3 - n)/3
$

Therefore, $C(n) = theta(1/3 n^3) = theta(n^3)$.
