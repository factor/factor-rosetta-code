! Task:
! 
! Create a stack-based evaluator for an expression in reverse Polish
! notation (RPN) that also shows the changes in the stack as each
! individual token is processed as a table.
! 
! -   Assume an input of a correct, space separated, string of tokens of
!     an RPN expression
! -   Test with the RPN expression generated from the
!     Parsing/Shunting-yard algorithm task:
! 
! 3 4 2 * 1 5 - 2 3 ^ ^ / +
! 
! -   Print or display the output here
! 
! Notes:
! 
! -    ^ means exponentiation in the expression above.
! -    / means division.
! 
! See also:
! 
! -   Parsing/Shunting-yard algorithm for a method of generating an RPN
!     from an infix expression.
! -   Several solutions to 24 game/Solve make use of RPN evaluators
!     (although tracing how they work is not a part of that task).
! -   Parsing/RPN to infix conversion.
! -   Arithmetic evaluation.

{ 3 4 2 * 1 5 - 2 3 ^ ^ / + }
[ dup pprint bl 1quotation call get-datastack . ] each
