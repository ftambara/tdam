== Exercise 2-30

#problem[
  For each of these questions, answer yes or no and briefly explain your answer.

  (a) If an algorithm takes $O(n^2)$ worst-case time, is it possible that it takes $O(n)$ on some inputs? \
  (b) If an algorithm takes $O(n^2)$ worst-case time, is it possible that it takes $O(n)$ on all inputs? \
  (c) If an algorithm takes $Theta(n^2)$ worst-case time, is it possible that it takes $O(n)$ on some inputs? \
  (d) If an algorithm takes $Theta(n^2)$ worst-case time, is it possible that it takes $O(n)$ on all inputs? \
  (e) Is the function $f(n) = Theta(n^2)$, where $f(n) = 100n^2$ for even $n$ and $f(n) = 20n^2 - n log_2 n$ for odd $n$?
]

=== (a)

The trivial solution is that all $O(n)$ functions are also $O(n^2)$.
Assuming the $O(n^2)$ size of the worst-case is not pessimistic, it can still be the case that the average-case
or best-case has a smaller $O(f(n))$, like $O(n)$. A well-known example is insertion sort, which is $O(n)$ on
sorted input, but $O(n^2)$ in the worst-case.

=== (b)

Here we are only left with the trivial solution. It is possible, since all $O(n)$ functions are also $O(n^2)$.

=== (c)

Yes. Insertion sort is again an example. It takes $Theta(n^2)$ worst-case time, but $O(n)$ best-case time.

=== (d)

It is not possible, since a function that is $Theta(n^2)$ in the worst-case, will be larger than
$c n^2$ for some inputs (the worst-case ones) by definition. No function that is larger than $c n^2$
can be characterized as $O(n)$.

=== (e)

Yes, since $f(n) in Theta(n^2)$ for both $100n^2$ and $20n^2 - n log_2 n$. It would not be true if the
sub-functions for even and odd $n$ where, for example, $n^2$ and $n$.
