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
]


#[
== Exercise 2-26

#problem[
  List the functions below from the lowest to the highest order. If any two or more are of the same order, indicate which.

  #columns(3, gutter: 8pt)[
  - $sqrt(n)$
  - $n log n$
  - $n^2$
  - $n^(1/3) + log n$
  - $ln n$
  - $(1/3)^n$
  #colbreak()
  - $n$
  - $n - n^3 + 7n^5$
  - $n^3$
  - $(log n)^2$
  - $n/(log n)$
  - $(3/2)^n$
  #colbreak()
  - $2^n$
  - $n^2 + log n$
  - $log n$
  - $n!$
  - $log log n$
  - $6$
  ]
]

1. $(1/3)^n$
2. $6$
3. $log log n$
4. $ln n$; $log n$
5. $(log n)^2$
6. $n^(1/3) + log n$
7. $n/(log n)$
8. $sqrt(n)$
9. $n$
10. $n log n$
11. $n^2$; $n^2 + log n$
12. $n^3$
13. $n - n^3 + 7n^5$
14. $(3/2)^n$
15. $2^n$
16. $n!$

*Some cases that I was in doubt about (or that I want to show why they work)*:

$ lim_(n->infinity) n^(1/3) / (log n)^2 = lim_(n->infinity) (1/3 n^(-2/3) / (2 1/n log n) = lim_(n->infinity) 1/6 (n^(1/3) / (log n) -> infinity $

$ lim_(n->infinity) n^(1/3) / (n/(log n)) = lim_(n->infinity) (log n) / (n^2/3) = 0 $

$ (ln n)/(log n) = (ln n)/((ln n)/(ln 10)) = ln 10 $
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


