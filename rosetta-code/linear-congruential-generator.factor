! The linear congruential generator is a very simple example of a random
! number generator.
! 
! All linear congruential generators use this formula:
! 
! -   r_(n + 1) = a × r_(n) + c (mod  m)
! 
! Where:
! 
! -   r₀ is a seed.
! -   r₁, r₂, r₃, ..., are the random numbers.
! -   a, c, m are constants.
! 
! If one chooses the values of a, c and m with care, then the generator
! produces a uniform distribution of integers from 0 to m − 1.
! 
! LCG numbers have poor quality. r_(n) and r_(n + 1) are not independent,
! as true random numbers would be. Anyone who knows r_(n) can predict
! r_(n + 1), therefore LCG is not cryptographically secure. The LCG is
! still good enough for simple tasks like Miller-Rabin primality test, or
! FreeCell deals. Among the benefits of the LCG, one can easily reproduce
! a sequence of numbers, from the same r₀. One can also reproduce such
! sequence with a different programming language, because the formula is
! so simple.
! 
! The task is to replicate two historic random number generators. One is
! the rand() function from BSD libc, and the other is the rand() function
! from the Microsoft C Runtime (MSCVRT.DLL). Each replica must yield the
! same sequence of integers as the original generator, when starting from
! the same seed.
! 
! In these formulas, the seed becomes state₀. The random sequence is
! rand₁, rand₂ and so on.
! 
! BSD formula:
! 
! -   state_(n + 1) = 1103515245 × state_(n) + 12345 (mod  2³¹)
! -   rand_(n) = state_(n)
! -   rand_(n) is in range 0 to 2147483647.
! 
! Microsoft formula:
! 
! -   state_(n + 1) = 214013 × state_(n) + 2531011 (mod  2³¹)
! -   rand_(n) = state_(n) ÷ 2¹⁶
! -   rand_(n) is in range 0 to 32767.
! 
! The BSD formula was so awful that FreeBSD switched to a different
! formula.
! 
! More info is at Random number generator (included)#C.

USING: fry io kernel lists lists.lazy math prettyprint ;

: lcg ( seed a c m quot: ( state -- rand ) -- list )
    [ '[ _ * _ + _ mod ] lfrom-by ] [ lmap-lazy cdr ] bi* ; inline

0 1103515245 12345 2147483648 [ ] lcg           ! bsd
0 214013 2531011 2147483648 [ -16 shift ] lcg   ! ms
[ 10 swap ltake [ . ] leach nl ] bi@
