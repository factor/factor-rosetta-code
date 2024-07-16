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

USING: io kernel math math.functions math.parser ranges
sequences ;
IN: rosetta-code.fizz-buzz

PREDICATE: fizz < integer 3 divisor? ;
PREDICATE: buzz < integer 5 divisor? ;

INTERSECTION: fizzbuzz fizz buzz ;

GENERIC: fizzbuzz>string ( n -- str )

M: fizz fizzbuzz>string 
    drop "Fizz" ;

M: buzz fizzbuzz>string
    drop "Buzz" ;

M: fizzbuzz fizzbuzz>string 
    drop "FizzBuzz" ;

M: integer fizzbuzz>string
    number>string ;

MAIN: [ 1 100 [a..b] [ fizzbuzz>string print ] each ]