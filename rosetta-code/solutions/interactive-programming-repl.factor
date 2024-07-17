! Many language implementations come with an interactive mode.
! 
! This is a command-line interpreter that reads lines from the user and
! evaluates these lines as statements or expressions.
! 
! An interactive mode may also be known as a command mode, a
! read-eval-print loop (REPL), or a shell.
! 
! Task:
! 
! Show how to start this mode.
! 
! Then, as a small example of its use, interactively create a function of
! two strings and a separator that returns the strings separated by two
! concatenated instances of the separator (the 3^(rd) argument).
! 
! Example:
! 
!              f('Rosetta',  'Code',  ':')   
! 
! should return
! 
!              'Rosetta::Code'               
! 
! Note:
! 
! This task is not about creating your own interactive mode.

( scratchpad ) : cool-func ( w1 w2 sep -- res ) dup append glue ;
( scratchpad ) "Rosetta" "Code" ":" cool-func .
"Rosetta::Code"
