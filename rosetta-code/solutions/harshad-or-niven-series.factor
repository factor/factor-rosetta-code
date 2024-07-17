! The Harshad or Niven numbers are positive integers ≥ 1 that are
! divisible by the sum of their digits.
! 
! For example, 42 is a Harshad number as 42 is divisible by (4 + 2)
! without remainder.
! 
! Assume that the series is defined as the numbers in increasing order.
! 
! Task:
! 
! The task is to create a function/method/procedure to generate successive
! members of the Harshad sequence.
! 
! Use it to:
! 
! -   -   list the first 20 members of the sequence, and
!     -   list the first Harshad number greater than 1000.
! 
! Show your output here.
! 
! Related task
! 
! -   -   Increasing gaps between consecutive Niven numbers
! 
! See also
! 
! -    OEIS: A005349

USING: math.text.utils lists lists.lazy ;

: niven? ( n -- ? ) dup 1 digit-groups sum mod 0 = ;

: first-n-niven ( n -- seq )
    1 lfrom [ niven? ] lfilter ltake list>array ;

: next-niven ( n -- m ) 1 + [ dup niven? ] [ 1 + ] until ;

20 first-n-niven .
1000 next-niven .
