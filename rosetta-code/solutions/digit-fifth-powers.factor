! Task:
! 
! Task desciption is taken from Project Euler
! (https://projecteuler.net/problem=30)
! 
! Find the sum of all the numbers that can be written as the sum of fifth
! powers of their digits.
! 
! Even though 1⁵ = 1, it is not expressed as a sum (a sum being the
! summation of a list of two or more numbers), and is therefore not
! included.

USING: kernel math math.functions math.ranges math.text.utils
math.vectors prettyprint sequences ;

2 9 5 ^ 6 * [a,b] [ dup 1 digit-groups 5 v^n sum = ] filter sum .
