! Task:
! 
! Find the largest base 10 integer whose digits are all different, and is
! evenly divisible by each of its individual digits.
! 
! These numbers are also known as Lynch-Bell numbers, numbers n such that
! the (base ten) digits are all different (and do not include zero) and n
! is divisible by each of its individual digits.
! 
! Example:
! 
! 135 is evenly divisible by 1, 3, and 5.
! 
! Note that the digit zero (0) can not be in the number as integer
! division by zero is undefined.
! 
! The digits must all be unique so a base ten number will have at most 9
! digits.
! 
! Feel free to use analytics and clever algorithms to reduce the search
! space your example needs to visit, but it must do an actual search.
! (Don't just feed it the answer and verify it is correct.)
! 
! Stretch goal:
! 
! Do the same thing for hexadecimal.
! 
! Related tasks:
! 
! -   -   gapful numbers.
!     -   palindromic gapful numbers.
! 
! Also see:
! 
! -   -   The OEIS sequence: A115569: Lynch-Bell numbers.

USING: io kernel math math.combinatorics math.parser math.ranges
sequences tools.time ;
IN: rosetta-code.largest-divisible

: all-div? ( seq -- ? )
    [ string>number ] [ string>digits ] bi [ mod ] with map
    sum 0 = ;

: n-digit-all-div ( n -- seq )
    "12346789" swap <combinations>
    [ [ all-div? ] filter-permutations ] map concat ;

: largest-divisible ( -- str )
    8 [ dup n-digit-all-div dup empty? ] [ drop 1 - ] while 
    nip supremum ;

: largest-divisible-demo ( -- )
    [ largest-divisible print ] time ;

MAIN: largest-divisible-demo
