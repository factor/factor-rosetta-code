! The prime-counting function π(n) computes the number of primes not
! greater than n. Legendre was the first mathematician to create a formula
! to compute π(n) based on the inclusion/exclusion principle.
! 
! To calculate:
! 
! Define
! 
! φ(x, 0) = x
! φ(x, a) = φ(x, a−1) − φ(⌊x/p_(a)⌋, a−1), where p_(a) is the a^(th) prime number.
! 
! then
! 
! π(n) = 0 when n < 2
! π(n) = φ(n, a) + a - 1, where a = π(√n), n ≥ 2
! 
! The Legendre formula still requires the use of a sieve to enumerate
! primes; however it's only required to sieve up to the √n, and for
! counting primes, the Legendre method is generally much faster than
! sieving up to n.
! 
! Task:
! 
! Calculate π(n) for values up to 1 billion. Show π(n) for n = 1, 10, 100,
! ... 10⁹.
! 
! For this task, you may refer to a prime number sieve (such as the Sieve
! of Eratosthenes or the extensible sieve) in an external library to
! enumerate the primes required by the formula. Also note that it will be
! necessary to memoize the results of φ(x, a) in order to have reasonable
! performance, since the recurrence relation would otherwise take
! exponential time.
! 
! Comments on Task
! 
! Regarding "it will be necessary to memoize the results of φ(x, a)", it
! will have exponential time performance without memoization only if a
! very small optimization that should be obvious is not done: it should be
! obvious that one can stop "splitting" the φ(x, a) "tree" when 'x' is
! zero, and even before that since the real meaning of the "phi"/φ
! function is to produce a count of all of the values greater than zero
! (including one) up to `x` that have been culled of all multiples of the
! primes up to and including the `p_(a)` prime value, if `x` is less than
! or equal to `p_(a)`, then the whole "tree" must result in a value of
! just one. If this minor (and obvious) optimization is done, the
! "exponential time" performance goes away, memoization is not absolutely
! necessary (saving the overhead in time and space of doing the
! memoization), and the time complexity becomes O(n/(log n²) and the space
! complexity becomes O(n^(1/2)/log n) as they should be.
! 
! This is the problem when non-mathematician programmers blindly apply
! such a general formula as the recursive Legendre one without doing any
! work to understand it or even doing some trivial hand calculations to
! better understand how it works just because they have very powerful
! computers which mask the limitations: a few minutes of hand calculation
! would make it obvious that there is no need to "split"/recursively call
! for "phi" nodes where the first argument is zero, and someone with a
! mathematics interest would then investigate to see if that limit can be
! pushed a little further as here to the range of nodes whose result will
! always be one. Once there is no exponential growth of the number of
! "nodes", then there is no need for memoization as usually implemented
! with a hash table at a huge cost of memory overhead and constant time
! computation per operation.
! 
! As to "the Legendre method is generally much faster than sieving up to
! n.", while the number of operations for the Legendre algorithm is about
! a factor of `log n` squared less than the number of operations for
! odds-only Sieve of Eratosthenes (SoE) sieving, those operations are
! "divide" operations which are generally much slower than the simple
! array access and addition operations used in sieving and the SoE can be
! optimized further using wheel factorization so that the required time
! for a given range can be less for a fully optimized SoE than for the
! common implementation of the Legendre algorithm; the trade off is that a
! fully optimized SoE is at least 500 lines of code, whereas the basic
! version of the Legendre prime counting algorithm is only about 40 to 50
! lines of code (depending somewhat on the language used).
! 
! Also note that the Legendre prime counting function was never used
! practically at the time it was invented other than to demonstrate that
! it would find the count of primes to a trivial range only knowing the
! primes up to the square root of that range and there were too many
! operations (especially long integer division operations) to actually use
! it for any reasonably range even with this optimization (about 250
! thousand divisions to count primes to ten million), but the follow-on
! work by Meissel in the 1800's definitely would have used this
! optimization and others in order to hand calculate the number of primes
! to a billion (1e9) in about ten years. Even with this optimization,
! Meissel would have had to hand calculate over five million divisions, so
! certainly used other Look Up Tables (LUT's) although certainly not
! caching of Phi/φ values in order to reduce the work to something
! possible in this amount of time. A "TinyPhi" LUT table for the first six
! primes of thirteen and less would have reduced the amount of work
! Meissel did to about 600 thousand divisions, but even that would have
! been perhaps too much and it is very likely that he also used "partial
! sieving" techniques, although that would have meant that as well as a
! table of the primes up to a million, he would have also needed 161 other
! tables of that range to a million sieved by the primes up to 13, 17, 19,
! to 997; however, that extra work in building these tables (which might
! have been done mechanically) would pay off in reducing the number of
! divisions to about seven thousand so the divisions become a minor
! problem possible to do over months and the majority of the time would be
! spent producing the partial sieving tables up to a million.
! 
! The reason that Meissel refined the Legendre method would have been
! that, even applying all of the optimizations including "partial
! sieving", he would still have had to do about three and a half million
! divisions to count the primes to a billion even if the number of primes
! and "partial sieve tables" only needed to be known to about 32 thousand,
! where his "Meissel" algorithm reduced the number of divisions to only a
! few thousand as per the above. Without a computer, he could never have
! completed the calculation of the number of primes to a billion using an
! optimized Legendre algorithm where he could using his modification.
! However, modern computers make (reasonably) quick work of integer
! divisions so that optimized algorithms of the Legendre type become
! moderately useful although at the cost of memory use as compared to
! Meissel type algorithms.


