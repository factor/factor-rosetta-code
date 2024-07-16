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

USE: infix
[infix
    5*(1+1) ! 10
infix]
