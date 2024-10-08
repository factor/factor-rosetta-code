! The Sieve of Pritchard is an algorithm for finding the prime numbers up
! to a given limit N, published in 1981. It considers many fewer composite
! numbers than the Sieve of Eratosthenes (and has a better asymptotic time
! complexity). However, unlike the latter, it cannot be modified to
! greatly reduce its space requirement, making it unsuitable for very
! large limits.
! 
! Conceptually, it works by building a wheel representing the repeating
! pattern of numbers not divisible by one of the first k primes,
! increasing k until the square of the k'th prime is at least N. Since
! wheels grow very quickly, the algorithm restricts attention to the
! initial portions of wheels up to N. (Small examples of the wheels
! constructed by the Sieve of Pritchard are used in the "wheel-based
! optimizations" mentioned in the Eratosthenes task.)
! 
! For example, the second-order wheel has circumference 6 (the product of
! the first two primes, 2 and 3) and is marked only at the numbers between
! 1 and 6 that are not multiples of 2 or 3, namely 1 and 5. As this wheel
! is rolled along the number line, it will pick up only numbers of the
! form 6k+1 or 6k+5 (that is, n where n mod 6 is in {1,5}). By the time it
! stops at 30 (2x3x5) it has added only 8 of the numbers between 6 and 30
! as candidates for primality. Those that are multiples of 5 (only 2: 1*5
! and 5*5) are obtained by multiplying the members of the second-order
! wheel. Removing them gives the next wheel, and so on.
! 
! This YouTube video presents the execution of the algorithm for N=150 in
! a format that permits single-stepping forward and backward through the
! run. In that implementation, the wheel is represented by a sparse global
! array s such that for each member w of the wheel, s[w] contains the next
! member of the wheel; along with a similar "previous member" value, this
! allows numbers to be removed in a constant number of operations. But the
! simple abstract algorithm is based on an ordered set, and there is
! plenty of scope for different implementations.
! 
! Task:
! 
! Write a program/subprogram that uses the Sieve of Pritchard algorithm to
! find all primes up to a specified limit. Show the result of running it
! with a limit of 150.
! 
! Related tasks:
! 
! -   Sieve of Eratosthenes
! -   Emirp primes
! -   count in factors
! -   prime decomposition
! -   factors of an integer
! -   extensible prime generator
! -   primality by trial division
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes
! -   sequence of primes by Trial Division
! 
! Category:Simple


