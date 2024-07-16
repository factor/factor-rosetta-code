! Task:
! 
! Create a Thue-Morse sequence.
! 
! See also
! 
! -   YouTube entry: The Fairest Sharing Sequence Ever
! -   YouTube entry: Math and OCD - My story with the Thue-Morse sequence
! -   Task: Fairshare between two and more

USING: io kernel math math.parser sequences ;

: thue-morse ( seq n -- seq' )
    [ [ ] [ [ 1 bitxor ] map ] bi append ] times ;
    
: print-tm ( seq -- ) [ number>string ] map "" join print ;

7 <iota> [ { 0 } swap thue-morse print-tm ] each
