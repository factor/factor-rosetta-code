! Hamming numbers are numbers of the form
! 
!     H = 2^(i) × 3^(j) × 5^(k)
!            where 
!      i,  j,  k  ≥  0 
! 
! Hamming numbers are also known as ugly numbers and also 5-smooth numbers
! (numbers whose prime divisors are less or equal to 5).
! 
! Task:
! 
! Generate the sequence of Hamming numbers, in increasing order. In
! particular:
! 
! 1.  Show the first twenty Hamming numbers.
! 2.  Show the 1691^(st) Hamming number (the last one below 2³¹).
! 3.  Show the one million^(th) Hamming number (if the language – or a
!     convenient library – supports arbitrary-precision integers).
! 
! Related tasks:
! 
! -   Humble numbers
! -   N-smooth numbers
! 
! References:
! 
! -   Wikipedia entry: Hamming numbers (this link is re-directed to
!     Regular number).
! -   Wikipedia entry: Smooth number
! -   OEIS entry: A051037 5-smooth or Hamming numbers
! -   Hamming problem from Dr. Dobb's CodeTalk (dead link as of Sep 2011;
!     parts of the thread here and here).

USING: accessors deques dlists fry kernel make math math.order
;
IN: rosetta.hamming

TUPLE: hamming-iterator 2s 3s 5s ;

: <hamming-iterator> ( -- hamming-iterator )
    hamming-iterator new
        1 1dlist >>2s
        1 1dlist >>3s
        1 1dlist >>5s ;

: enqueue ( n hamming-iterator -- )
    [ [ 2 * ] [ 2s>> ] bi* push-back ]
    [ [ 3 * ] [ 3s>> ] bi* push-back ]
    [ [ 5 * ] [ 5s>> ] bi* push-back ] 2tri ;

: next ( hamming-iterator -- n )
    dup [ 2s>> ] [ 3s>> ] [ 5s>> ] tri
    3dup [ peek-front ] tri@ min min
    [
        '[
            dup peek-front _ =
            [ pop-front* ] [ drop ] if
        ] tri@
    ] [ swap enqueue ] [ ] tri ;

: next-n ( hamming-iterator n -- seq )
    swap '[ _ [ _ next , ] times ] { } make ;

: nth-from-now ( hamming-iterator n -- m )
    1 - over '[ _ next drop ] times next ;
