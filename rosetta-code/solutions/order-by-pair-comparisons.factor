! Assume we have a set of items that can be sorted into an order by the
! user.
! 
! The user is presented with pairs of items from the set in no order, the
! user states which item is less than, equal to, or greater than the other
! (with respect to their relative positions if fully ordered).
! 
! Write a function that given items that the user can order, asks the user
! to give the result of comparing two items at a time and uses the
! comparison results to eventually return the items in order.
! 
! Try and minimise the comparisons the user is asked for.
! 
! Show on this page, the function ordering the colours of the rainbow:
! 
!    violet red green indigo blue yellow orange
! 
! The correct ordering being:
! 
!    red orange yellow green blue indigo violet
! 
! Note:
! 
! -   Asking for/receiving user comparisons is a part of the task.
! -   Code inputs should not assume an ordering.
! -   The seven colours can form twenty-one different pairs.
! -   A routine that does not ask the user "too many" comparison questions
!     should be used.
! 
! Category:Sorting

USING: formatting io kernel math.order prettyprint qw sorting ;

qw{ violet red green indigo blue yellow orange }
[ "Is %s > %s? (y/n) " printf readln "y" = +gt+ +lt+ ? ] sort .
