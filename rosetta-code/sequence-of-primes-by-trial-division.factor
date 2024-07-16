! Task:
! 
! Generate a sequence of primes by means of trial division.
! 
! Trial division is an algorithm where a candidate number is tested for
! being a prime by trying to divide it by other numbers.
! 
! You may use primes, or any numbers of your choosing, as long as the
! result is indeed a sequence of primes.
! 
! The sequence may be bounded (i.e. up to some limit), unbounded, starting
! from the start (i.e. 2) or above some given value.
! 
! Organize your function as you wish, in particular, it might resemble a
! filtering operation, or a sieving operation.
! 
! If you want to use a ready-made is_prime function, use one from the
! Primality by trial division page (i.e., add yours there if it isn't
! there already).
! 
! Related tasks:
! 
! -   count in factors
! -   prime decomposition
! -   factors of an integer
! -   Sieve of Eratosthenes
! -   primality by trial division
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes

USING: combinators kernel lists lists.lazy math math.functions
math.ranges prettyprint sequences ;

: prime? ( n -- ? )
    {
        { [ dup 2 < ] [ drop f ] }
        { [ dup even? ] [ 2 = ] }
        [ 3 over sqrt 2 <range> [ mod 0 > ] with all? ]
    } cond ;

! Create an infinite lazy list of primes.
: primes ( -- list ) 0 lfrom [ prime? ] lfilter ;

! Show the first fifteen primes.
15 primes ltake list>array .
