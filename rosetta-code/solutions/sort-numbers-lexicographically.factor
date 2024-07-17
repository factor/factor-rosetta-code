! Task:
! 
! Given an integer n, return 1──►n (inclusive) in lexicographical order.
! 
! Show all output here on this page.
! 
! Example:
! 
! Given 13,
! 
! return: [1,10,11,12,13,2,3,4,5,6,7,8,9].
! 
! Category:Sorting

USING: formatting kernel math.parser math.ranges sequences
sorting ;
IN: rosetta-code.lexicographical-numbers

: lex-order ( n -- seq )
    [1,b] [ number>string ] map natural-sort
    [ string>number ] map ;
    
{ 13 21 -22 } [ dup lex-order "%3d: %[%d, %]\n" printf ] each
