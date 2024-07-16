! Given a series of ones and zeroes in a string, define a repeated string
! or rep-string as a string which is created by repeating a substring of
! the first N characters of the string truncated on the right to the
! length of the input string, and in which the substring appears repeated
! at least twice in the original.
! 
! For example, the string 10011001100 is a rep-string as the leftmost four
! characters of 1001 are repeated three times and truncated on the right
! to give the original string.
! 
! Note that the requirement for having the repeat occur two or more times
! means that the repeating unit is never longer than half the length of
! the input string.
! 
! Task:
! 
! -   Write a function/subroutine/method/... that takes a string and
!     returns an indication of if it is a rep-string and the repeated
!     string. (Either the string that is repeated, or the number of
!     repeated characters would suffice).
! -   There may be multiple sub-strings that make a string a rep-string -
!     in that case an indication of all, or the longest, or the shortest
!     would suffice.
! -   Use the function to indicate the repeating substring if any, in the
!     following:
! 
!     1001110011
!     1110111011
!     0010010010
!     1010101010
!     1111111111
!     0100101101
!     0100100
!     101
!     11
!     00
!     1
! 
! -   Show your output on this page.

USING: formatting grouping kernel math math.ranges qw sequences ;
IN: rosetta-code.rep-string
    
: (find-rep-string) ( str -- str )
    dup dup length 2/ [1,b]
    [ <groups> [ head? ] monotonic? ] with find nip dup
    [ head ] [ 2drop "N/A" ] if ;
    
: find-rep-string ( str -- str )
    dup length 1 <= [ drop "N/A" ] [ (find-rep-string) ] if ;

qw{ 1001110011 1110111011 0010010010 1010101010 1111111111
    0100101101 0100100 101 11 00 1 }
"Shortest cycle:\n\n" printf
[ dup find-rep-string "%-10s -> %s\n" printf ] each
