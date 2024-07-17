! Task:
! 
! Show here (on this page) the decimal numbers formed by:
! 
!     
! 
!         (n 1's appended by the digit 3) and then square the result,
!         where 0 <= n < 8
! 
! See also
! * oeis:A151997

USING: io kernel math math.functions prettyprint ;

: a ( n -- e m ) 1 + 10^ 1 - 9 / 2 + dup sq ;

8 [ a swap pprint bl . ] each-integer
