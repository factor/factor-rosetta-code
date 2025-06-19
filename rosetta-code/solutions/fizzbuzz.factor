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


USE: math.parser
1 101 [ [ 3 5 [ mod 0 = ] bi-curry@ bi "Fizz" "Buzz" swapd [ and ] 2bi@ append ] keep number>string or print ] each-integer-from

