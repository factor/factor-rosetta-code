! Prime numbers are prime no matter what base they are represented in.
! 
! A prime number in a base other than 10 may not look prime at first
! glance.
! 
! For instance: 19 base 10 is 25 in base 7.
! 
! Several different prime numbers may be expressed as the "same" string
! when converted to a different base.
! 
! -   107 base 10 converted to base 6 == 255
! 
! -   173 base 10 converted to base 8 == 255
! 
! -   353 base 10 converted to base 12 == 255
! 
! -   467 base 10 converted to base 14 == 255
! 
! -   743 base 10 converted to base 18 == 255
! 
! -   1277 base 10 converted to base 24 == 255
! 
! -   1487 base 10 converted to base 26 == 255
! 
! -   2213 base 10 converted to base 32 == 255
! 
! Task
! 
! Restricted to bases 2 through 36; find the strings that have the most
! different bases that evaluate to that string when converting prime
! numbers to a base.
! 
! Find the conversion string, the amount of bases that evaluate a prime to
! that string and the enumeration of bases that evaluate a prime to that
! string.
! 
! Display here, on this page, the string, the count and the list for all
! of the: 1 character, 2 character, 3 character, and 4 character strings
! that have the maximum base count that evaluate to that string.
! 
! Should be no surprise, the string '2' has the largest base count for
! single character strings.
! 
! Stretch goal
! 
! Do the same for the maximum 5 character string.

USING: assocs assocs.extras formatting io kernel math
math.functions math.parser math.primes math.ranges present
sequences ;

: prime?* ( n -- ? ) [ prime? ] [ f ] if* ; inline

: (bases) ( n -- range quot )
    present 2 36 [a,b] [ base> prime?* ] with ; inline

: <digits> ( n -- range ) [ 1 - ] keep [ 10^ ] bi@ [a,b) ;

: multibase ( n -- assoc )
    <digits> [ (bases) count ] zip-with assoc-invert
    expand-keys-push-at >alist [ first ] supremum-by ;

: multibase. ( n -- )
    dup multibase first2
    [ "%d-digit numbers that are prime in the most bases: %d\n" printf ] dip
    [ dup (bases) filter "%d => %[%d, %]\n" printf ] each ;

4 [1,b] [ multibase. nl ] each
