! Task:
! 
! Given a list of arbitrarily many strings, show how to:
! 
! -   test if they are all lexically equal
! -   test if every string is lexically less than the one after it (i.e.
!     whether the list is in strict ascending order)
! 
! Each of those two tests should result in a single true or false value,
! which could be used as the condition of an if statement or similar.
! 
! If the input list has less than two elements, the tests should always
! return true.
! 
! There is no need to provide a complete program and output.
! 
! Assume that the strings are already stored in an
! array/list/sequence/tuple variable (whatever is most idiomatic) with the
! name strings, and just show the expressions for performing those two
! tests on it (plus of course any includes and custom functions etc. that
! it needs), with as little distractions as possible.
! 
! Try to write your solution in a way that does not modify the original
! list, but if it does then please add a note to make that clear to
! readers.
! 
! If you need further guidance/clarification, see #Perl and #Python for
! solutions that use implicit short-circuiting loops, and #Raku for a
! solution that gets away with simply using a built-in language feature.

USE: grouping
all-equal?
