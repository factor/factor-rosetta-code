! The Padovan sequence is similar to the Fibonacci sequence in several
! ways. Some are given in the table below, and the referenced video shows
! some of the geometric similarities.
! 
!     
! 
!         {| class="wikitable"
! 
! ! Comment !! Padovan !! Fibonacci |- | || || |- | Named after. ||
! Richard Padovan || Leonardo of Pisa: Fibonacci |- | || || |- |
! Recurrence initial values. || P(0)=P(1)=P(2)=1 || F(0)=0, F(1)=1 |- |
! Recurrence relation. || P(n)=P(n-2)+P(n-3) || F(n)=F(n-1)+F(n-2) |- | ||
! || |- | First 10 terms. || 1,1,1,2,2,3,4,5,7,9 || 0,1,1,2,3,5,8,13,21,34
! |- | || || |- | Ratio of successive terms... || Plastic ratio, p ||
! Golden ratio, g |- | || 1.324717957244746025960908854… ||
! 1.6180339887498948482... |- | Exact formula of ratios p and q. ||
! ((9+69**.5)/18)**(1/3) + ((9-69**.5)/18)**(1/3) || (1+5**0.5)/2 |- |
! Ratio is real root of polynomial. || p: x**3-x-1 || g: x**2-x-1 |- | ||
! || |- | Spirally tiling the plane using. || Equilateral triangles ||
! Squares |- | || || |- | Constants for ... || s= 1.0453567932525329623 ||
! a=5**0.5 |- | ... Computing by truncation. || P(n)=floor(p**(n-1) / s +
! .5) || F(n)=floor(g**n / a + .5) |- | || || |- | L-System Variables. ||
! A,B,C || A,B |- | L-System Start/Axiom. || A || A |- | L-System Rules.
! || A->B,B->C,C->AB || A->B,B->AB |}
! 
! Task:
! 
! -   Write a function/method/subroutine to compute successive members of
!     the Padovan series using the recurrence relation.
! -   Write a function/method/subroutine to compute successive members of
!     the Padovan series using the floor function.
! -   Show the first twenty terms of the sequence.
! -   Confirm that the recurrence and floor based functions give the same
!     results for 64 terms,
! -   Write a function/method/... using the L-system to generate
!     successive strings.
! -   Show the first 10 strings produced from the L-system
! -   Confirm that the length of the first 32 strings produced is the
!     Padovan sequence.
! 
! Show output here, on this page.
! 
! Ref:
! 
! -   The Plastic Ratio - Numberphile video.

USING: L-system accessors io kernel make math math.functions
memoize prettyprint qw sequences ;

CONSTANT: p 1.324717957244746025960908854
CONSTANT: s 1.0453567932525329623

: pfloor ( m -- n ) 1 - p swap ^ s /f .5 + >integer ;

MEMO: precur ( m -- n )
    dup 3 < [ drop 1 ]
    [ [ 2 - precur ] [ 3 - precur ] bi + ] if ;

: plsys, ( L-system -- )
    [ iterate-L-system-string ] [ string>> , ] bi ;

: plsys ( n -- seq )
    <L-system>
    "A" >>axiom
    { qw{ A B } qw{ B C } qw{ C AB } } >>rules
    swap 1 - '[ "A" , _ [ dup plsys, ] times ] { } make nip ;

"First 20 terms of the Padovan sequence:" print
20 [ pfloor pprint bl ] each-integer nl nl

64 [ [ pfloor ] [ precur ] bi assert= ] each-integer
"Recurrence and floor based algorithms match to n=63." print nl

"First 10 L-system strings:" print
10 plsys . nl

32 <iota> [ pfloor ] map 32 plsys [ length ] map assert=
"The L-system, recurrence and floor based algorithms match to n=31." print
