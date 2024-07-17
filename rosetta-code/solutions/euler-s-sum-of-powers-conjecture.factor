! There is a conjecture in mathematics that held for over two hundred
! years before it was disproved by the finding of a counterexample in 1966
! by Lander and Parkin.
! 
! This conjecture is called Euler's sum of powers conjecture and can be
! stated as such:
! 
!     At least k positive k^(th) powers are required to sum to a k^(th)
!     power, except for the trivial case of one k^(th) power: y^(k) =
!     y^(k).
! 
! In 1966, Leon J. Lander and Thomas R. Parkin used a brute-force search
! on a CDC 6600 computer restricting numbers to those less than 250.
! 
! The task consists in writing a program to search for an integer solution
! of x₀⁵ + x₁⁵ + x₂⁵ + x₃⁵ = y⁵ where all x_(i) and y are distinct
! integers between 0 and 250 (exclusive). Show an answer here.
! 
! Related tasks are:
! 
! -   Pythagorean quadruples.
! -   Pythagorean triples.

USING: arrays backtrack kernel literals math.functions
math.ranges prettyprint sequences ;

CONSTANT: pow5 $[ 0 250 [a,b) [ 5 ^ ] map ]

: xn ( n1 -- n2 n2 ) [1,b) amb-lazy dup ;

250 xn xn xn xn drop 4array dup pow5 nths sum dup pow5
member? [ pow5 index suffix . ] [ 2drop fail ] if
