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
