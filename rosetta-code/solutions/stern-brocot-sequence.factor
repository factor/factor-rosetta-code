! For this task, the Stern-Brocot sequence is to be generated by an
! algorithm similar to that employed in generating the Fibonacci sequence.
! 
! 1.  The first and second members of the sequence are both 1:
!     -   1, 1
! 2.  Start by considering the second member of the sequence
! 3.  Sum the considered member of the sequence and its precedent, (1 + 1)
!     = 2, and append it to the end of the sequence:
!     -   1, 1, 2
! 4.  Append the considered member of the sequence to the end of the
!     sequence:
!     -   1, 1, 2, 1
! 5.  Consider the next member of the series, (the third member i.e. 2)
! 6.  GOTO 3
!     -   
!     -   ─── Expanding another loop we get: ───
!     -   
! 7.  Sum the considered member of the sequence and its precedent, (2 + 1)
!     = 3, and append it to the end of the sequence:
!     -   1, 1, 2, 1, 3
! 8.  Append the considered member of the sequence to the end of the
!     sequence:
!     -   1, 1, 2, 1, 3, 2
! 9.  Consider the next member of the series, (the fourth member i.e. 1)
! 
! The task is to:
! 
! -   Create a function/method/subroutine/procedure/... to generate the
!     Stern-Brocot sequence of integers using the method outlined above.
! -   Show the first fifteen members of the sequence. (This should be: 1,
!     1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3, 4)
! -   Show the (1-based) index of where the numbers 1-to-10 first appear
!     in the sequence.
! -   Show the (1-based) index of where the number 100 first appears in
!     the sequence.
! -   Check that the greatest common divisor of all the two consecutive
!     members of the series up to the 1000^(th) member, is always one.
! 
! Show your output on this page.
! 
! Related tasks:
! 
! -   -   Fusc sequence.
!     -   Continued fraction/Arithmetic
! 
! Ref:
! 
! -   Infinite Fractions - Numberphile (Video).
! -   Trees, Teeth, and Time: The mathematics of clock making.
! -   A002487 The On-Line Encyclopedia of Integer Sequences.

USING: formatting io kernel lists lists.lazy locals math
math.ranges prettyprint sequences ;
IN: rosetta-code.stern-brocot

: fn ( n -- m )
    [ 1 0 ] dip
    [ dup zero? ] [
        dup 1 bitand zero?
        [ dupd [ + ] 2dip        ]
        [ [ dup ] [ + ] [ ] tri* ] if
        -1 shift
    ] until drop nip ;

:: search ( n -- m )
    1 0 lfrom [ fn n = ] lfilter ltake list>array first ;

: first15 ( -- )
    15 [1,b] [ fn pprint bl ] each
    "are the first fifteen." print ;
    
: first-appearances ( -- )
    10 [1,b] 100 suffix
    [ dup search "First %3u at Stern #%u.\n" printf ] each ;
    
: gcd-test ( -- )
    1,000 [1,b] [ dup 1 + [ fn ] bi@ gcd nip 1 = not ] filter
    empty? "" " not" ? "All GCDs are%s 1.\n" printf ;
    
: main ( -- ) first15 first-appearances gcd-test ;

MAIN: main