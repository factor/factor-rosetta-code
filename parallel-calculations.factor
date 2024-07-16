! Many programming languages allow you to specify computations to be run
! in parallel. While Concurrent computing is focused on concurrency, the
! purpose of this task is to distribute time-consuming calculations on as
! many CPUs as possible.
! 
! Assume we have a collection of numbers, and want to find the one with
! the largest minimal prime factor (that is, the one that contains
! relatively large factors). To speed up the search, the factorization
! should be done in parallel using separate threads or processes, to take
! advantage of multi-core CPUs.
! 
! Show how this can be formulated in your language. Parallelize the
! factorization of those numbers, then search the returned list of numbers
! and factors for the largest minimal factor, and return that number and
! its prime factors.
! 
! For the prime number decomposition you may use the solution of the Prime
! decomposition task.

USING: kernel io prettyprint sequences arrays math.primes.factors math.parser concurrency.combinators ;
{ 576460752303423487 576460752303423487 576460752303423487 112272537195293
  115284584522153 115280098190773 115797840077099 112582718962171 }
dup [ factors ] parallel-map dup [ infimum ] map dup supremum
swap index swap dupd nth -rot swap nth
"Number with largest min. factor is " swap number>string append
", with factors: " append write .
