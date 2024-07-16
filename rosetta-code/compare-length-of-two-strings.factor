! Task:
! 
! Given two strings of different length, determine which string is longer
! or shorter. Print both strings and their length, one on each line. Print
! the longer one first.
! 
! Measure the length of your string in terms of bytes or characters, as
! appropriate for your language. If your language doesn't have an operator
! for measuring the length of a string, note it.
! 
! Extra credit:
! 
! Given more than two strings:
! 
! list = ["abcd","123456789","abcdef","1234567"]
! 
! Show the strings in descending length order.
! 
! Category: String manipulation Category:Simple

USING: formatting io kernel qw sequences sorting ;

: .length ( str -- ) dup length "%u has length %d\n" printf ;

"I am a string" "I am a string too"
[ longer .length ] [ shorter .length ] 2bi nl

qw{ abcd 123456789 abcdef 1234567 } dup [ length ] inv-sort-with
"%u sorted by descending length:\n%u\n" printf
