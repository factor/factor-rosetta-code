! Task:
! 
! Calculate the value of e.
! 
! (e is also known as Euler's number and Napier's constant.)
! 
! See details: Calculating the value of e

USING: math math.factorials prettyprint sequences ;
IN: rosetta-code.calculate-e

CONSTANT: terms 20

terms <iota> [ n! recip ] map-sum >float .
