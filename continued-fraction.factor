! A number may be represented as a continued fraction (see Mathworld for
! more information) as follows:
! 
! $$a_0 + \cfrac{b_1}{a_1 + \cfrac{b_2}{a_2 + \cfrac{b_3}{a_3 + \ddots}}}$$
! 
! The task is to write a program which generates such a number and prints
! a real representation of it. The code should be tested by calculating
! and printing the square root of 2, Napier's Constant, and Pi, using the
! following coefficients:
! 
! For the square root of 2, use a₀ = 1 then a_(N) = 2. b_(N) is always 1.
! 
! $$\sqrt{2} = 1 + \cfrac{1}{2 + \cfrac{1}{2 + \cfrac{1}{2 + \ddots}}}$$
! 
! For Napier's Constant, use a₀ = 2, then a_(N) = N. b₁ = 1 then
! b_(N) = N − 1.
! 
! $$e = 2 + \cfrac{1}{1 + \cfrac{1}{2 + \cfrac{2}{3 + \cfrac{3}{4 + \ddots}}}}$$
! 
! For Pi, use a₀ = 3 then a_(N) = 6. b_(N) = (2N − 1)².
! 
! $$\pi = 3 + \cfrac{1}{6 + \cfrac{9}{6 + \cfrac{25}{6 + \ddots}}}$$
! 
! See also:
! 
! -   -   Continued fraction/Arithmetic for tasks that do arithmetic over
!         continued fractions.

USING: arrays combinators io kernel locals math math.functions
  math.ranges prettyprint sequences ;
IN: rosetta.cfrac

! Every continued fraction must implement these two words.
GENERIC: cfrac-a ( n cfrac -- a )
GENERIC: cfrac-b ( n cfrac -- b )

! square root of 2
SINGLETON: sqrt2
M: sqrt2 cfrac-a
    ! If n is 1, then a_n is 1, else a_n is 2.
    drop { { 1 [ 1 ] } [ drop 2 ] } case ;
M: sqrt2 cfrac-b
    ! Always b_n is 1.
    2drop 1 ;

! Napier's constant
SINGLETON: napier
M: napier cfrac-a
    ! If n is 1, then a_n is 2, else a_n is n - 1. 
    drop { { 1 [ 2 ] } [ 1 - ] } case ;
M: napier cfrac-b
    ! If n is 1, then b_n is 1, else b_n is n - 1.
    drop { { 1 [ 1 ] } [ 1 - ] } case ;

SINGLETON: pi
M: pi cfrac-a
    ! If n is 1, then a_n is 3, else a_n is 6.
    drop { { 1 [ 3 ] } [ drop 6 ] } case ;
M: pi cfrac-b
    ! Always b_n is (n * 2 - 1)^2.
    drop 2 * 1 - 2 ^ ;

:: cfrac-estimate ( cfrac terms -- number )
    terms cfrac cfrac-a             ! top = last a_n
    terms 1 - 1 [a,b] [ :> n
        n cfrac cfrac-b swap /      ! top = b_n / top
        n cfrac cfrac-a +           ! top = top + a_n
    ] each ;

:: decimalize ( rational prec -- string )
    rational 1 /mod             ! split whole, fractional parts
    prec 10^ *                  ! multiply fraction by 10 ^ prec
    [ >integer unparse ] bi@    ! convert digits to strings
    :> fraction
    "."                         ! push decimal point
    prec fraction length -
    dup 0 < [ drop 0 ] when
    "0" <repetition> concat     ! push padding zeros
    fraction 4array concat ;

<PRIVATE
: main ( -- )
    " Square root of 2: " write
    sqrt2 50 cfrac-estimate 30 decimalize print
    "Napier's constant: " write
    napier 50 cfrac-estimate 30 decimalize print
    "               Pi: " write
    pi 950 cfrac-estimate 10 decimalize print ;
PRIVATE>

MAIN: main
