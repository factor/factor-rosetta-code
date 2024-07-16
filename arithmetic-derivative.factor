! The arithmetic derivative of an integer (more specifically, the Lagarias
! arithmetic derivative) is a function defined for integers, based on
! prime factorization, by analogy with the product rule for the derivative
! of a function that is used in mathematical analysis. Accordingly, for
! natural numbers n, the arithmetic derivative D(n) is defined as follows:
! 
! *D(0) = D(1) = 0.
! *D(p) = 1 for any prime p.
! *D(mn) = D(m)n + mD(n) for any m,n ∈ N. (Leibniz rule for derivatives).
! 
! Additionally, for negative integers the arithmetic derivative may be
! defined as -D(-n) (n < 0).
! 
! Examples
! 
! D(2) = 1 and D(3) = 1 (both are prime) so if mn = 2 * 3, D(6) = (1)(3) +
! (1)(2) = 5.
! 
! D(9) = D(3)(3) + D(3)(3) = 6
! 
! D(27) = D(3)*9 + D(9)*3 = 9 + 18 = 27
! 
! D(30) = D(5)(6) + D(6)(5) = 6 + 5 * 5 = 31.
! 
! Task
! 
! Find and show the arithmetic derivatives for -99 through 100.
! 
! Stretch task
! 
! Find (the arithmetic derivative of 10^m) then divided by 7, where m is
! from 1 to 20.
! 
! See also
! 
! * OEIS:A003415 - a(n) = n' = arithmetic derivative of n.
! *Wikipedia: Arithmetic Derivative

USING: combinators formatting grouping io kernel math
math.primes.factors prettyprint ranges sequences ;

: n' ( m -- n )
    {
        { [ dup neg? ] [ neg n' neg ] }
        { [ dup 2 < ] [ drop 0 ] }
        { [ factors dup length 1 = ] [ drop 1 ] }
        [ unclip-slice swap product 2dup n' * spin n' * + ]
    } cond ;

-99 100 [a..b] [ n' ] map 10 group
[ [ "%5d" printf ] each nl ] each
