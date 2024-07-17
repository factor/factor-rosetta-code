! Task:
! 
! Generate random 1000-digit number.
! 
! Find the five adjacent digits in the 1000-digit number that form the largest 5-digit number. 
! 
! Extra credit
! 
! Find the five adjacent digits in the 1000-digit number that form the
! smallest 5-digit number.

USING: grouping io math.functions prettyprint random sequences ;

1000 10^ random unparse 5 <clumps> supremum print
