! Task
! 
! Find decimal numbers n that when converted to hexadecimal produce a
! number that uses the same set of digits (regardless of order and
! ignoring duplicates) as the original number, where n < 100000
! 
! Example:
! 
! The decimal number 2339 is 923 when written in hexadecimal.
! 
! The set of digits used, ignoring order and duplicates, is {2, 3, 9} in
! both cases and hence this number satisfies the task requirements.

USING: formatting grouping io kernel math.parser present
sequences sets ;

100,000 <iota> [ dup present swap >hex set= ] filter
10 group [ [ "%5d " printf ] each nl ] each
