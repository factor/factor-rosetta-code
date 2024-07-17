! Task:
! 
! Given a list of strings, find characters appearing only in one string
! and once only.
! 
! The result should be given in alphabetical order.
! 
! Use the following list for this task:
! 
!         ["133252abcdeeffd",  "a6789798st",  "yxcdfgxcyz"]

USING: io sequences sets.extras sorting ;

{ "133252abcdeeffd" "a6789798st" "yxcdfgxcyz" }
concat non-repeating natural-sort print
