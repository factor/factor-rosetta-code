! Task:
! 
! Given the operator characteristics and input from the Shunting-yard
! algorithm page and tables, use the algorithm to show the changes in the
! operator stack and RPN output as each individual token is processed.
! 
! -   Assume an input of a correct, space separated, string of tokens
!     representing an infix expression
! -   Generate a space separated output string representing the RPN
! -   Test with the input string:
! 
!     
! 
!         3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3
! 
! -   print and display the output here.
! -   Operator precedence is given in this table:
! 
!     {| class="wikitable"
! 
! ! operator !! precedence !! associativity !! operation |- ||
! align="center" | ^ || 4 || right || exponentiation |- || align="center"
! |  * || 3 || left || multiplication |- || align="center" | / || 3 ||
! left || division |- || align="center" |  + || 2 || left || addition |-
! || align="center" |  - || 2 || left || subtraction |}
! 
! Extra credit
! 
! Add extra text explaining the actions and an optional comment for the
! action on receipt of each token.
! 
! Note
! 
! The handling of functions and arguments is not required.
! 
! See also:
! 
! -   Parsing/RPN calculator algorithm for a method of calculating a final
!     value from this output RPN expression.
! -   Parsing/RPN to infix conversion.


