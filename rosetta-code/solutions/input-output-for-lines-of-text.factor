! Task:
! 
! The first line contains the number of lines to follow, followed by that
! number of lines of text on STDIN.
! 
! Write to STDOUT each line of input by passing it to a method as an
! intermediate step. The code should demonstrate these 3 things.
! 
! Sample input with corresponding output:
! 
! Input
! 
!     3
!     hello
!     hello world
!     Pack my Box with 5 dozen liquor jugs 
! 
! Output
! 
!     hello
!     hello world
!     Pack my Box with 5 dozen liquor jugs
! 
! Related tasks:
! 
! -   Input/Output for Pairs of Numbers
! -   File/Input and Output

USING: io kernel strings ;
IN: input-output

GENERIC: do-stuff ( obj -- )
M: string do-stuff print ;

readln drop [ do-stuff ] each-line
