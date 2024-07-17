! Task:
! 
! Create a program that takes an RPN representation of an expression
! formatted as a space separated sequence of tokens and generates the
! equivalent expression in infix notation.
! 
! -   Assume an input of a correct, space separated, string of tokens
! -   Generate a space separated output string representing the same
!     expression in infix notation
! -   Show how the major datastructure of your algorithm changes with each
!     new token parsed.
! -   Test with the following input RPN strings then print and display the
!     output here.
! 
!     
! 
!         {| class="wikitable"
! 
! ! RPN input !! sample output |- || align="center" |
! 3 4 2 * 1 5 - 2 3 ^ ^ / +|| 3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3 |- ||
! align="center" | 1 2 + 3 4 + ^ 5 6 + ^||
! ( ( 1 + 2 ) ^ ( 3 + 4 ) ) ^ ( 5 + 6 ) |}
! 
! -   Operator precedence and operator associativity is given in this
!     table:
! 
!     
! 
!         {| class="wikitable"
! 
! ! operator !! precedence !! associativity !! operation |- ||
! align="center" | ^ || 4 || right || exponentiation |- || align="center"
! |  * || 3 || left || multiplication |- || align="center" | / || 3 ||
! left || division |- || align="center" |  + || 2 || left || addition |-
! || align="center" |  - || 2 || left || subtraction |}
! 
! See also:
! 
! -   Parsing/Shunting-yard algorithm for a method of generating an RPN
!     from an infix expression.
! -   Parsing/RPN calculator algorithm for a method of calculating a final
!     value from this output RPN expression.
! -   Postfix to infix from the RubyQuiz site.


