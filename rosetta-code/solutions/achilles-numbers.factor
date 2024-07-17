! An Achilles number is a number that is powerful but imperfect. Named
! after Achilles, a hero of the Trojan war, who was also powerful but
! imperfect.
! 
! A positive integer n is a powerful number if, for every prime factor p
! of n, p² is also a divisor.
! 
! In other words, every prime factor appears at least squared in the
! factorization.
! 
! All Achilles numbers are powerful. However, not all powerful numbers are
! Achilles numbers: only those that cannot be represented as m^(k), where
! m and k are positive integers greater than 1.
! 
! A strong Achilles number is an Achilles number whose Euler totient (𝜑)
! is also an Achilles number.
! 
! E.G.
! 
! 108 is a powerful number. Its prime factorization is 2² × 3³, and thus
! its prime factors are 2 and 3. Both 2² = 4 and 3² = 9 are divisors of
! 108. However, 108 cannot be represented as m^(k), where m and k are
! positive integers greater than 1, so 108 is an Achilles number.
! 
! 360 is not an Achilles number because it is not powerful. One of its
! prime factors is 5 but 360 is not divisible by 5² = 25.
! 
! Finally, 784 is not an Achilles number. It is a powerful number, because
! not only are 2 and 7 its only prime factors, but also 2² = 4 and 7² = 49
! are divisors of it. Nonetheless, it is a perfect power; its square root
! is an even integer, so it is not an Achilles number.
! 
! 500 = 2² × 5³ is a strong Achilles number as its Euler totient, 𝜑(500),
! is 200 = 2³ × 5² which is also an Achilles number.
! 
! Task
! 
! -   Find and show the first 50 Achilles numbers.
! -   Find and show at least the first 20 strong Achilles numbers.
! -   For at least 2 through 5, show the count of Achilles numbers with
!     that many digits.
! 
! See also
! 
! * Wikipedia: Achilles number
! * OEIS:A052486 - Achilles numbers - powerful but imperfect numbers
! * OEIS:A194085 - Strong Achilles numbers: Achilles numbers m such that phi(m) is also an Achilles number
! * Related task: Powerful numbers
! * Related task: Totient function

USING: assocs combinators.short-circuit formatting grouping io
kernel lists lists.lazy math math.functions math.primes.factors
prettyprint ranges sequences ;

: achilles? ( n -- ? )
    group-factors values {
        [ [ 1 > ] all? ]
        [ unclip-slice [ simple-gcd ] reduce 1 = ]
    } 1&& ;

: achilles ( -- list )
    2 lfrom [ achilles? ] lfilter ;

: strong-achilles ( -- list )
    achilles [ totient achilles? ] lfilter ;

: show ( n list -- ) ltake list>array 10 group simple-table. ;

: <order-of-magnitude> ( n -- range )
    1 - 10^ dup 10 * [a..b) ;

"First 50 Achilles numbers:" print
50 achilles show nl

"First 30 strong Achilles numbers:" print
30 strong-achilles show nl

"Number of Achilles numbers with" print
{ 2 3 4 5 } [
    dup <order-of-magnitude> [ achilles? ] count
    "%d digits: %d\n" printf
] each
