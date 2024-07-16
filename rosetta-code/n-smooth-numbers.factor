! n-smooth numbers are positive integers which have no prime factors  > n.
! 
! The n in the expression n-smooth is always prime;
! 
! there are no 9-smooth numbers.
! 
! 1 (unity) is always included in n-smooth numbers.
! 
! 2-smooth numbers are non-negative powers of two.
! 
! 5-smooth numbers are also called Hamming numbers.
! 
! 7-smooth numbers are also called humble numbers.
! 
! A way to express 11-smooth numbers is:
! 
!   11-smooth  =  2^(i) × 3^(j) × 5^(k) × 7^(m) × 11^(p)
! 
!            where     i, j, k, m, p ≥ 0  
! 
! Task:
! 
! -   -   calculate and show the first 25 n-smooth numbers for n=2 ───►
!         n=29
!     -   calculate and show three numbers starting with 3,000 n-smooth
!         numbers for n=3 ───► n=29
!     -   calculate and show twenty numbers starting with  30,000 n-smooth
!         numbers for n=503 ───► n=521 (optional)
! 
! All ranges (for n) are to be inclusive, and only prime numbers are to be
! used.
! 
! The (optional) n-smooth numbers for the third range are: 503, 509, and
! 521.
! 
! Show all n-smooth numbers for any particular n in a horizontal list.
! 
! Show all output here on this page.
! 
! Related tasks:
! 
! -   -   Hamming numbers
!     -   humble numbers
! 
! References:
! 
! -   -   Wikipedia entry: Hamming numbers (this link is re-directed to
!         Regular number).
!     -   Wikipedia entry: Smooth number
!     -   OEIS entry: A000079  2-smooth numbers or non-negative powers of
!         two
!     -   OEIS entry: A003586  3-smooth numbers
!     -   Mintz 1981: 3-smooth numbers
!     -   OEIS entry: A051037  5-smooth numbers or Hamming numbers
!     -   OEIS entry: A002473  7-smooth numbers or humble numbers
!     -   OEIS entry: A051038 11-smooth numbers
!     -   OEIS entry: A080197 13-smooth numbers
!     -   OEIS entry: A080681 17-smooth numbers
!     -   OEIS entry: A080682 19-smooth numbers
!     -   OEIS entry: A080683 23-smooth numbers

USING: deques dlists formatting fry io kernel locals make math
math.order math.primes math.text.english namespaces prettyprint
sequences tools.memory.private ;
IN: rosetta-code.n-smooth-numbers

SYMBOL: primes
 
: ns ( n -- seq )
    primes-upto [ primes set ] [ length [ 1 1dlist ] replicate ]
    bi ;
 
: enqueue ( n seq -- )
    [ primes get ] 2dip [ '[ _ * ] map ] dip [ push-back ] 2each
    ;
 
: next ( seq -- n )
    dup [ peek-front ] map infimum
    [ '[ dup peek-front _ = [ pop-front* ] [ drop ] if ] each ]
    [ swap enqueue ] [ nip ] 2tri ;
 
: next-n ( seq n -- seq )
    swap '[ _ [ _ next , ] times ] { } make ;

:: n-smooth ( n from to -- seq )
    n ns to next-n to from - 1 + tail* ;
 
:: show-smooth ( plo phi lo hi -- )
    plo phi primes-between [
        :> p lo commas lo ordinal-suffix hi commas hi
        ordinal-suffix p "%s%s through %s%s %d-smooth numbers: "
        printf p lo hi n-smooth [ pprint bl ] each nl        
    ] each ;

: smooth-numbers-demo ( -- )
    2 29 1 25 show-smooth nl
    3 29 3000 3002 show-smooth nl
    503 521 30,000 30,019 show-smooth ;

MAIN: smooth-numbers-demo
