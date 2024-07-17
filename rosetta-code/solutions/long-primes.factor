! A long prime (as defined here) is a prime number whose reciprocal (in
! decimal) has a period length of one less than the prime number.
! 
! Long primes are also known as:
! 
! -   -   base ten cyclic numbers
!     -   full reptend primes
!     -   golden primes
!     -   long period primes
!     -   maximal period primes
!     -   proper primes
! 
! Another definition: primes p such that the decimal expansion of 1/p has
! period p-1, which is the greatest period possible for any integer.
! 
! Example:
! 
! 7 is the first long prime, the reciprocal of seven is ¹/⁷, which is
! equal to the repeating decimal fraction '''0.142857142857···
! 
! The length of the repeating part of the decimal fraction is six, (the
! underlined part) which is one less than the (decimal) prime number 7.
! 
! Thus 7 is a long prime.
! 
! There are other (more) general definitions of a long prime which include
! wording/verbiage for bases other than ten.
! 
! Task:
! 
! -   -   Show all long primes up to 500 (preferably on one line).
!     -   Show the number of long primes up to 500
!     -   Show the number of long primes up to 1,000
!     -   Show the number of long primes up to 2,000
!     -   Show the number of long primes up to 4,000
!     -   Show the number of long primes up to 8,000
!     -   Show the number of long primes up to 16,000
!     -   Show the number of long primes up to 32,000
!     -   Show the number of long primes up to 64,000 (optional)
!     -   Show all output here.
! 
! ;;Also see:
! 
! -   -   Wikipedia: full reptend prime
!     -   MathWorld: full reptend prime
!     -   OEIS: A001913

USING: formatting fry io kernel math math.functions math.primes
math.primes.factors memoize prettyprint sequences ;
IN: rosetta-code.long-primes

: period-length ( p -- len )
    [ 1 - divisors ] [ '[ 10 swap _ ^mod 1 = ] ] bi find nip ;

MEMO: long-prime? ( p -- ? ) [ period-length ] [ 1 - ] bi = ;

: .lp<=500 ( -- )
    500 primes-upto [ long-prime? ] filter
    "Long primes <= 500:" print [ pprint bl ] each nl ;

: .#lp<=n ( n -- )
    dup primes-upto [ long-prime? t = ] count swap
    "%-4d long primes <= %d\n" printf ;

: long-primes-demo ( -- )
    .lp<=500 nl
    { 500 1,000 2,000 4,000 8,000 16,000 32,000 64,000 }
    [ .#lp<=n ] each ;

MAIN: long-primes-demo
