! Definitions:
! 
! The fusc integer sequence is defined as:
! 
! -   -   fusc(0) = 0
!     -   fusc(1) = 1
!     -   for n>1, the n^(th) term is defined as:
!         -   -   if n is even; fusc(n) = fusc(n/2)
!             -   if n is odd; fusc(n) = fusc((n-1)/2) + fusc((n+1)/2)
! 
! Note that MathWorld's definition starts with unity, not zero. This task
! will be using the OEIS' version (above).
! 
! An observation:
! 
! -   -   fusc(A) = fusc(B)
! 
! where A is some non-negative integer expressed in binary, and where B is
! the binary value of A reversed.
! 
! Fusc numbers are also known as:
! 
! -   -   fusc function (named by Dijkstra, 1982)
!     -   Stern's Diatomic series (although it starts with unity, not
!         zero)
!     -   Stern-Brocot sequence (although it starts with unity, not zero)
! 
! Task:
! 
! -   -   show the first 61 fusc numbers (starting at zero) in a
!         horizontal format.
!     -   show the fusc number (and its index) whose length is greater
!         than any previous fusc number length.
!         -   -   (the length is the number of decimal digits when the
!                 fusc number is expressed in base ten.)
!     -   show all numbers with commas (if appropriate).
!     -   show all output here.
! 
! Related task:
! 
! -   -   Stern-Brocot sequence
!     -   Calkin-Wilf sequence.
! 
! Also see:
! 
! -   -   the MathWorld entry: Stern's Diatomic Series.
!     -   the OEIS entry: A2487.

USING: arrays assocs formatting io kernel make math math.parser
math.ranges namespaces prettyprint sequences
tools.memory.private ;
IN: rosetta-code.fusc

<PRIVATE

: (fusc) ( n -- seq )
    [ 2 ] dip [a,b) [
        0 , 1 , [
            [ building get ] dip dup even?
            [ 2/ swap nth ]
            [ [ 1 - 2/ ] [ 1 + 2/ ] 2bi [ swap nth ] 2bi@ + ]
            if ,
        ] each
    ] { } make ;

: increases ( seq -- assoc )
    [ 0 ] dip [
        [
            2array 2dup first number>string length <
            [ [ 1 + ] [ , ] bi* ] [ drop ] if
        ] each-index
    ] { } make nip ;

PRIVATE>

: fusc ( n -- seq )
    dup 3 < [ { 0 1 } swap head ] [ (fusc) ] if ;

: fusc-demo ( -- )
    "First 61 fusc numbers:" print 61 fusc [ pprint bl ] each
    nl nl
    "Fusc numbers with more digits than all previous ones:"
    print "Value   Index\n======  =======" print
    1,000,000 fusc increases
   [ [ commas ] bi@ "%-6s  %-7s\n" printf ] assoc-each ;

MAIN: fusc-demo
