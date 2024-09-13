! Task:
! 
! -   Find and show (in decimal) the first six numbers (non-negative
!     integers) that are palindromes in both:
!     -   -   base 2
!         -   base 3
! -   Display 0 (zero) as the first number found, even though some other
!     definitions ignore it.
! -   Optionally, show the decimal number found in its binary and ternary
!     form.
! -   Show all output here.
! 
! It's permissible to assume the first two numbers and simply list them.
! 
! See also
! 
! -   Sequence A60792, numbers that are palindromic in bases 2 and 3 on
!     The On-Line Encyclopedia of Integer Sequences.
! 
! Category:Palindromes

USING: combinators.short-circuit formatting io kernel lists
lists.lazy literals math math.parser sequences tools.time ;
IN: rosetta-code.2-3-palindromes

CONSTANT: info $[
    "The first 6 numbers which are palindromic in both binary "
    "and ternary:" append
]

: expand ( n -- m ) 3 >base dup <reversed> "1" glue 3 base> ;

: 2-3-pal? ( n -- ? )
    expand >bin
    { [ length odd? ] [ dup <reversed> sequence= ] } 1&& ;

: first6 ( -- seq )
    4 0 lfrom [ 2-3-pal? ] lfilter ltake list>array
    [ expand ] map { 0 1 } prepend ;

: main ( -- )
    info print nl first6 [
        dup [ >bin ] [ 3 >base ] bi
        "Decimal : %d\nBinary  : %s\nTernary : %s\n\n" printf
    ] each ;

[ main ] time
