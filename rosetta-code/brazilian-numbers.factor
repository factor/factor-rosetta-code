! Brazilian numbers are so called as they were first formally presented at
! the 1994 math Olympiad Olimpiada Iberoamericana de Matematica in
! Fortaleza, Brazil.
! 
! Brazilian numbers are defined as:
! 
! The set of positive integer numbers where each number N has at least one
! natural number B where 1 < B < N-1 where the representation of N in base
! B has all equal digits.
! 
! E.G.:
! 
! -   -   1, 2 & 3 can not be Brazilian; there is no base B that satisfies
!         the condition 1 < B < N-1.
!     -   4 is not Brazilian; 4 in base 2 is 100. The digits are not all
!         the same.
!     -   5 is not Brazilian; 5 in base 2 is 101, in base 3 is 12. There
!         is no representation where the digits are the same.
!     -   6 is not Brazilian; 6 in base 2 is 110, in base 3 is 20, in base
!         4 is 12. There is no representation where the digits are the
!         same.
!     -   7 is Brazilian; 7 in base 2 is 111. There is at least one
!         representation where the digits are all the same.
!     -   8 is Brazilian; 8 in base 3 is 22. There is at least one
!         representation where the digits are all the same.
!     -   and so on...
! 
! All even integers 2P >= 8 are Brazilian because 2P = 2(P-1) + 2, which
! is 22 in base P-1 when P-1 > 2. That becomes true when P >= 4.
! More common: for all all integers R and S, where R > 1 and also S-1 > R,
! then R*S is Brazilian because R*S = R(S-1) + R, which is RR in base S-1
! The only problematic numbers are squares of primes, where R = S. Only
! 11^2 is brazilian to base 3.
! All prime integers, that are brazilian, can only have the digit 1.
! Otherwise one could factor out the digit, therefore it cannot be a prime
! number. Mostly in form of 111 to base Integer(sqrt(prime number)). Must
! be an odd count of 1 to stay odd like primes > 2
! 
! Task:
! 
! Write a routine (function, whatever) to determine if a number is
! Brazilian and use the routine to show here, on this page;
! 
! -   -   the first 20 Brazilian numbers;
!     -   the first 20 odd Brazilian numbers;
!     -   the first 20 prime Brazilian numbers;
! 
! See also:
! 
! -   -   OEIS:A125134 - Brazilian numbers
!     -   OEIS:A257521 - Odd Brazilian numbers
!     -   OEIS:A085104 - Prime Brazilian numbers

USING: combinators grouping io kernel lists lists.lazy math
math.parser math.primes.lists math.ranges namespaces prettyprint
prettyprint.config sequences ;

: (brazilian?) ( n -- ? )
    2 over 2 - [a,b] [ >base all-equal? ] with find nip >boolean ;

: brazilian? ( n -- ? )
    {
        { [ dup 7 < ] [ drop f ] }
        { [ dup even? ] [ drop t ] }
        [ (brazilian?) ]
    } cond ;

: .20-brazilians ( list -- )
    [ 20 ] dip [ brazilian? ] lfilter ltake list>array . ;

100 margin set
1 lfrom "First 20 Brazilian numbers:"
1 [ 2 + ] lfrom-by "First 20 odd Brazilian numbers:"
lprimes "First 20 prime Brazilian numbers:"
[ print .20-brazilians nl ] 2tri@
