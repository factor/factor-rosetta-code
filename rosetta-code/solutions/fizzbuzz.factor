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


USING: math kernel io math.functions math.parser math.ranges ;
IN: fizzbuzz
: fizz ( n -- str ) 3 divisor? "Fizz" "" ? ;
: buzz ( n -- str ) 5 divisor? "Buzz" "" ? ;
: fizzbuzz ( n -- str ) dup [ fizz ] [ buzz ] bi append [ number>string ] [ nip ] if-empty ;
: main ( -- ) 100 [1,b] [ fizzbuzz print ] each ;
MAIN: main


USING: kernel sequences arrays generalizations fry math math.parser prettyprint ;
IN: fizzbuzz

: zz ( m seq -- v ) dup length 1 <array> V{ } clone 4 -nrot 1 4 -nrot 3 nrot
 '[ dup _ <= ]
  3 -nrot
 '[
    "" _ [ _ [ swap execute( str n -- str n ) ] change-nth ] each-index
    dup empty? [ drop dup number>string ] [ ] if swapd suffix! swap 1 +
  ]
  while drop ;

: fizz ( str n -- str n ) dup 3 < [ 1 + ] [ drop "Fizz" append 1 ] if ;
: buzz ( str n -- str n ) dup 5 < [ 1 + ] [ drop "Buzz" append 1 ] if ;
: quxx ( str n -- str n ) dup 7 < [ 1 + ] [ drop "Quxx" append 1 ] if ;
: FizzBuzzQuxx ( m -- v ) { fizz buzz quxx } zz ;
: FizzBuzzQuxx-100 ( -- ) 100 FizzBuzzQuxx . ;

MAIN: FizzBuzzQuxx-100



USING: io kernel math math.functions math.parser ranges
sequences ;
IN: rosetta-code.fizz-buzz

PREDICATE: fizz < integer 3 divisor? ;
PREDICATE: buzz < integer 5 divisor? ;

INTERSECTION: fizzbuzz fizz buzz ;

GENERIC: fizzbuzz>string ( n -- str )

M: fizz fizzbuzz>string 
    drop "Fizz" ;

M: buzz fizzbuzz>string
    drop "Buzz" ;

M: fizzbuzz fizzbuzz>string 
    drop "FizzBuzz" ;

M: integer fizzbuzz>string
    number>string ;

MAIN: [ 1 100 [a..b] [ fizzbuzz>string print ] each ]

