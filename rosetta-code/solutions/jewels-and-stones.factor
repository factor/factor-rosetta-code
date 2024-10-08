! Task:
! 
! Create a function which takes two string parameters: 'stones' and
! 'jewels' and returns an integer.
! 
! Both strings can contain any number of upper or lower case letters.
! However, in the case of 'jewels', all letters must be distinct.
! 
! The function should count (and return) how many 'stones' are 'jewels'
! or, in other words, how many letters in 'stones' are also letters in
! 'jewels'.
! 
! Note that:
! 
! :# Only letters in the ISO basic Latin alphabet i.e. 'A to Z' or 'a to
! z' need be considered.
! 
! :# A lower case letter is considered to be different from its upper case
! equivalent for this purpose, i.e., 'a' != 'A'.
! 
! :# The parameters do not need to have exactly the same names.
! 
! :# Validating the arguments is unnecessary.
! 
! So, for example, if passed "aAAbbbb" for 'stones' and "aA" for 'jewels',
! the function should return 3.
! 
! This task was inspired by this problem.
! 
! Category:Puzzles

USING: kernel prettyprint sequences ;

: count-jewels ( stones jewels -- n ) [ member? ] curry count ;

"aAAbbbb" "aA"
"ZZ" "z" [ count-jewels . ] 2bi@
