! Task:
! 
! Write a program that prints the integers from 1 to 100 (inclusive).
! 
! But:
! 
! -   -   for multiples of three, print Fizz instead of the number;
!     -   for multiples of five, print Buzz instead of the number;
!     -   for multiples of both three and five, print FizzBuzz instead of
!         the number.
! 
! The FizzBuzz problem was presented as the lowest level of comprehension
! required to illustrate adequacy.
! 
! Also see:
! 
! -   (a blog) dont-overthink-fizzbuzz
! -   (a blog) fizzbuzz-the-programmers-stairway-to-heaven
! 
! Category:Iteration Category:Recursion Category:Simple

USING: math kernel io math.functions math.parser math.ranges ;
IN: fizzbuzz
: fizz ( n -- str ) 3 divisor? "Fizz" "" ? ;
: buzz ( n -- str ) 5 divisor? "Buzz" "" ? ;
: fizzbuzz ( n -- str ) dup [ fizz ] [ buzz ] bi append [ number>string ] [ nip ] if-empty ;
: main ( -- ) 100 [1,b] [ fizzbuzz print ] each ;
MAIN: main
