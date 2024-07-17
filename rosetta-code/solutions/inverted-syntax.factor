! Inverted syntax with conditional expressions
! 
! In traditional syntax conditional expressions are usually shown before
! the action within a statement or code block:
! 
!      IF raining=true THEN needumbrella=true 
! 
! In inverted syntax, the action is listed before the conditional
! expression in the statement or code block:
! 
!      needumbrella=true IF raining=true 
! 
! Inverted syntax with assignment
! 
! In traditional syntax, assignments are usually expressed with the
! variable appearing before the expression:
! 
!      a = 6
! 
! In inverted syntax, the expression appears before the variable:
! 
!      6 = a
! 
! Task
! 
! The task is to demonstrate support for inverted syntax forms within the
! language by showing both the traditional and inverted forms.

1 1 + ! 2
[ + 1 1 ] reverse call ! 2
{ 1 2 3 4 5 } [ sq ] map ! { 1 4 9 16 25 }
[ map [ sq ] { 1 2 3 4 5 } ] reverse call ! { 1 4 9 16 25 }
