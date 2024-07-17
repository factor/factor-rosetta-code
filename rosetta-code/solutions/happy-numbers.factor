! From Wikipedia, the free encyclopedia:
! 
!     
! 
!         A happy number is defined by the following process:
! 
!     
! 
!         Starting with any positive integer, replace the number by the
!         sum of the squares of its digits, and repeat the process until
!         the number equals 1 (where it will stay), or it loops endlessly
!         in a cycle which does not include 1.
! 
!     
! 
!         Those numbers for which this process end in 1 are happy numbers,
!         while those numbers that do not end in 1 are unhappy numbers.
! 
! Task:
! 
! Find and print the first 8 happy numbers.
! 
! Display an example of your output here on this page.
! 
! Related tasks:
! 
! -   Iterated digits squaring
! 
! See also:
! 
! -   The OEIS entry: The happy numbers: A007770
! -   The OEIS entry: The unhappy numbers; A031177

USING: combinators kernel make math sequences ;

: squares ( n -- s )
    0 [ over 0 > ] [ [ 10 /mod sq ] dip + ] while nip ;

: (happy?) ( n1 n2 -- ? )
    [ squares ] [ squares squares ] bi* {
        { [ dup 1 = ] [ 2drop t ] }
        { [ 2dup = ] [ 2drop f ] }
        [ (happy?) ]
    } cond ;

: happy? ( n -- ? )
    dup (happy?) ;

: happy-numbers ( n -- seq )
    [
        0 [ over 0 > ] [
            dup happy? [ dup , [ 1 - ] dip ] when 1 +
        ] while 2drop
    ] { } make ;
