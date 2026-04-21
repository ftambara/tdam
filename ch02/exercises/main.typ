#import "../../template.typ": assignment, problem
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#show: body => assignment("Chapter Exercises", "Federico", body)

#[
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
]


#[
== Exercise 2-29

#problem[
  For each of the following pairs of functions $f(n)$ and $g(n)$,
  state whether $f(n) = O(g(n))$, $f(n) = Omega(g(n))$, $f(n) = Theta(g(n))$,
  or none of the above.

  (a) $f(n) = n^2 + 3n + 4, g(n) = 6n + 7$ \
  (b) $f(n) = n sqrt(n), g(n) = n^2 - n$ \
  (c) $f(n) = 2^n - n^2, g(n) = n^4 + n^2$
]

=== Problem (a)

Let $f(n) = n^2 + 3n + 4$ and $g(n) = 6n + 7$.

==== Big O
Per the definition of $f(n) = O(g(n))$,

$
  n^2 +3n + 4 &<= c (6n + 7) \
  (n^2 + 3n + 4)/(6n + 7) &<= c
$

But the left hand side tends to +$infinity$, given that the degree of the dividend is
greater than that of the divisor. Expressed formally:

$ lim_(n -> +infinity) (n^2 + 3n + 4)/(6n + 7) = lim_(n -> +infinity) n = +infinity $

Therefore, no constant $c$ exists that satisfies the condition.

==== Big $Omega$
Per the definition of $f(n) = Omega(g(n))$,

$
  n^2 +3n + 4 &>= c (6n + 7) \
  (n^2 + 3n + 4)/(6n + 7) &>= c
$

As seen above, in the limit the LHS of the inequality tends to +$infinity$.
Thus, as $n$ grows large, any positive $c$ will meet the criteria.

==== Result

$ f(n) = Omega(g(n)) $


=== Problem (b)

Let $f(n) = n sqrt(n)$ and $g(n) = n^2 - n$.

==== Big O
Per the definition of $f(n) = O(g(n))$,

$
  n sqrt(n) &<= c (n^2 - n) \
  (n^(3/2))/(n^2 - n) &<= c
$

In the limit:

$ lim_(n -> +infinity) (n^(3/2))/(n^2 - n) = lim_(n -> +infinity) n^(-1/2) = 0 $

Therefore, any positive value of $c$ will satisfy the condition in the limit.

==== Big $Omega$
Per the definition of $f(n) = Omega(g(n))$,

$
  n sqrt(n) &>= c (n^2 - n) \
  (n^(3/2))/(n^2 - n) &>= c
$

As seen above, in the limit the LHS of the inequality tends to zero.
Thus, no positive value of $c$ satisfies the condition in the limit.

==== Result

$ f(n) = O(g(n)) $


=== Problem (c)

Let $f(n) = 2^n - n^2$ and $g(n) = n^4 + n^2$.

==== Big O
Per the definition of $f(n) = O(g(n))$,

$
  2^n - n^2 &<= c (n^4 + n^2) \
  (2^n - n^2) / (n^4 + n^2) &<= c \
$

To calculate the limit, we use L'Hôpital's rule, which states that the limit of a quotient of
functions is equivalent to the limit of their derivatives.

$ lim_(n -> +infinity) (2^n - n^2) / (n^4 + n^2) &= lim_(n -> +infinity) (ln(2) 2^n) / (4n^3) $

If we continue applying L'Hôpital's rule, The divisor will eventually be constant. That is, in the limit
the quotient will tend to $infinity$.
Therefore, no constant $c$ exists that satisfies the condition.

==== Big $Omega$
Per the definition of $f(n) = Omega(g(n))$,

$
  2^n - n^2 &>= c (n^4 + n^2) \
  (2^n - n^2) / (n^4 + n^2) &>= c \
$

As seen above, in the limit the LHS of the inequality tends to +$infinity$.
Thus, as $n$ grows large, any positive $c$ will meet the criteria.

==== Result

$ f(n) = Omega(g(n)) $
]


