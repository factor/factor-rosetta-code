! A Pierpont prime is a prime number of the form: 2^(u)3^(v) + 1 for some
! non-negative integers u and v.
! 
! A Pierpont prime of the second kind is a prime number of the form:
! 2^(u)3^(v) - 1 for some non-negative integers u and v.
! 
! ''The term "Pierpont primes" is generally understood to mean the first
! definition, but will be called "Pierpont primes of the first kind" on
! this page to distinguish them.
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find Pierpont
!         primes of the first & second kinds.
! 
! -   -   Use the routine to find and display here, on this page, the
!         first 50 Pierpont primes of the first kind.
! 
! -   -   Use the routine to find and display here, on this page, the
!         first 50 Pierpont primes of the second kind
! 
! -   -   If your language supports large integers, find and display here,
!         on this page, the 250^(th) Pierpont prime of the first kind and
!         the 250^(th) Pierpont prime of the second kind.
! 
! See also:
! 
! -   -   Wikipedia - Pierpont primes
!     -   OEIS:A005109 - Class 1 -, or Pierpont primes
!     -   OEIS:A005105 - Class 1 +, or Pierpont primes of the second kind

USING: fry grouping io kernel locals make math math.functions
math.primes prettyprint sequences sorting ;

: pierpont ( ulim vlim quot -- seq )
    '[
        _ <iota> _ <iota> [
            [ 2 ] [ 3 ] bi* [ swap ^ ] 2bi@ * 1 @
            dup prime? [ , ] [ drop ] if
        ] cartesian-each
    ] { } make natural-sort ; inline

: .fifty ( seq -- ) 50 head 10 group simple-table. nl ;

[let
    [ + ] [ - ] [ [ 120 80 ] dip pierpont ] bi@
    :> ( first second )
    
    "First 50 Pierpont primes of the first kind:" print
    first .fifty

    "First 50 Pierpont primes of the second kind:" print
    second .fifty

    "250th Pierpont prime of the first kind: " write
    249 first nth . nl

    "250th Pierpont prime of the second kind: " write
    249 second nth .
]
