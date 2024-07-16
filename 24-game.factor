! The 24 Game tests one's mental arithmetic.
! 
! Task
! 
! Write a program that randomly chooses and displays four digits, each
! from 1 ──► 9 (inclusive) with repetitions allowed.
! 
! The program should prompt for the player to enter an arithmetic
! expression using just those, and all of those four digits, used exactly
! once each. The program should check then evaluate the expression.
! 
! The goal is for the player to enter an expression that (numerically)
! evaluates to 24.
! 
! -   Only the following operators/functions are allowed: multiplication,
!     division, addition, subtraction
! -   Division should use floating point or rational arithmetic, etc, to
!     preserve remainders.
! -   Brackets are allowed, if using an infix expression evaluator.
! -   Forming multiple digit numbers from the supplied digits is
!     disallowed. (So an answer of 12+12 when given 1, 2, 2, and 1 is
!     wrong).
! -   The order of the digits when given does not have to be preserved.
! 
! Notes
! 
! -   The type of expression evaluator used is not mandated. An RPN
!     evaluator is equally acceptable for example.
! -   The task is not for the program to generate the expression, or test
!     whether an expression is even possible.
! 
! Related tasks
! 
! -   24 game/Solve
! 
! Reference
! 
! -   The 24 Game on h2g2.

IN: scratchpad main
Your numbers are { 4, 1, 8, 2 }, make an expression
8 4 + 2 * 1 /
You got it!
