! A Syntax analyzer transforms a token stream (from the Lexical analyzer)
! into a Syntax tree, based on a grammar.
! 
! Take the output from the Lexical analyzer task, and convert it to an
! Abstract Syntax Tree (AST), based on the grammar below. The output
! should be in a flattened format.
! 
! The program should read input from a file and/or stdin, and write output
! to a file and/or stdout. If the language being used has a parser
! module/library/class, it would be great if two versions of the solution
! are provided: One without the parser module, and one with.
! 
! The simple programming language to be analyzed is more or less a (very
! tiny) subset of C. The formal grammar in Extended Backus-Naur Form
! (EBNF):
! 
!         stmt_list           =   {stmt} ;
! 
!         stmt                =   ';'
!                               | Identifier '=' expr ';'
!                               | 'while' paren_expr stmt
!                               | 'if' paren_expr stmt ['else' stmt]
!                               | 'print' '(' prt_list ')' ';'
!                               | 'putc' paren_expr ';'
!                               | '{' stmt_list '}'
!                               ;
! 
!         paren_expr          =   '(' expr ')' ;
! 
!         prt_list            =   (string | expr) {',' (String | expr)} ;
! 
!         expr                =   and_expr            {'||' and_expr} ;
!         and_expr            =   equality_expr       {'&&' equality_expr} ;
!         equality_expr       =   relational_expr     [('==' | '!=') relational_expr] ;
!         relational_expr     =   addition_expr       [('<' | '<=' | '>' | '>=') addition_expr] ;
!         addition_expr       =   multiplication_expr {('+' | '-') multiplication_expr} ;
!         multiplication_expr =   primary             {('*' | '/' | '%') primary } ;
!         primary             =   Identifier
!                               | Integer
!                               | '(' expr ')'
!                               | ('+' | '-' | '!') primary
!                               ;
! 
! The resulting AST should be formulated as a Binary Tree.
! 
! Example - given the simple program (below), stored in a file called while.t, create the list of tokens, using one of the Lexical analyzer solutions
! 
! lex < while.t > while.lex
! 
! Run one of the Syntax analyzer solutions:
! 
! parse < while.lex > while.ast
! 
! The following table shows the input to lex, lex output, and the AST produced by the parser:
! 
! +----------------------+----------------------+----------------------+
! | Input to lex         | Output from lex,     | Output from parse    |
! |                      | input to parse       |                      |
! +======================+======================+======================+
! |     count = 1;       |         1      1 I   |     Sequence         |
! |                      | dentifier      count |     Sequence         |
! | while (count < 10) { |                      |     ;                |
! |                      |   1      7 Op_assign |     Assign           |
! |        print("count  |         1      9 I   |                      |
! | is: ", count, "\n"); | nteger             1 |  Identifier    count |
! |                      |                      |     Integer       1  |
! |   count = count + 1; |   1     10 Semicolon |     While            |
! |      }               |         2            |     Less             |
! |                      |      1 Keyword_while |                      |
! |                      |                      |  Identifier    count |
! |                      |   2      7 LeftParen |     Integer       10 |
! |                      |         2      8 I   |     Sequence         |
! |                      | dentifier      count |     Sequence         |
! |                      |                      |     ;                |
! |                      |     2     14 Op_less |     Sequence         |
! |                      |         2     16 I   |     Sequence         |
! |                      | nteger            10 |     Sequence         |
! |                      |                      |     ;                |
! |                      |  2     18 RightParen |     Prts             |
! |                      |                      |     String           |
! |                      |   2     20 LeftBrace |         "count is: " |
! |                      |         3            |     ;                |
! |                      |      5 Keyword_print |     Prti             |
! |                      |                      |                      |
! |                      |   3     10 LeftParen |  Identifier    count |
! |                      |                      |     ;                |
! |                      |    3     11 String   |     Prts             |
! |                      |         "count is: " |                      |
! |                      |                      |   String        "\n" |
! |                      |       3     23 Comma |     ;                |
! |                      |         3     25 I   |     Assign           |
! |                      | dentifier      count |                      |
! |                      |                      |  Identifier    count |
! |                      |       3     30 Comma |     Add              |
! |                      |         3     32     |                      |
! |                      | String          "\n" |  Identifier    count |
! |                      |                      |     Integer       1  |
! |                      |  3     36 RightParen |                      |
! |                      |                      |                      |
! |                      |   3     37 Semicolon |                      |
! |                      |         4      5 I   |                      |
! |                      | dentifier      count |                      |
! |                      |                      |                      |
! |                      |   4     11 Op_assign |                      |
! |                      |         4     13 I   |                      |
! |                      | dentifier      count |                      |
! |                      |                      |                      |
! |                      |      4     19 Op_add |                      |
! |                      |         4     21 I   |                      |
! |                      | nteger             1 |                      |
! |                      |                      |                      |
! |                      |   4     22 Semicolon |                      |
! |                      |                      |                      |
! |                      |  5      1 RightBrace |                      |
! |                      |         6            |                      |
! |                      |       1 End_of_input |                      |
! +----------------------+----------------------+----------------------+
! 
! Specifications
! 
! List of node type names:
! 
!     Identifier String Integer Sequence If Prtc Prts Prti While Assign Negate Not Multiply Divide Mod
!     Add Subtract Less LessEqual Greater GreaterEqual Equal NotEqual And Or
! 
! In the text below, Null/Empty nodes are represented by ";".
! 
! Non-terminal (internal) nodes:
! 
! For Operators, the following nodes should be created:
! 
! Multiply Divide Mod Add Subtract Less LessEqual Greater GreaterEqual Equal NotEqual And Or
! 
! For each of the above nodes, the left and right sub-nodes are the
! operands of the respective operation.
! 
! In pseudo S-Expression format:
! 
! (Operator expression expression)
! 
! Negate, Not
! 
! For these node types, the left node is the operand, and the right node
! is null.
! 
! (Operator expression ;)
! 
! Sequence - sub-nodes are either statements or Sequences.
! 
! If - left node is the expression, the right node is If node, with it's
! left node being the if-true statement part, and the right node being the
! if-false (else) statement part.
! 
! (If expression (If statement else-statement))
! 
! If there is not an else, the tree becomes:
! 
! (If expression (If statement ;))
! 
! Prtc
! 
! (Prtc (expression) ;)
! 
! Prts
! 
! (Prts (String "the string") ;)
! 
! Prti
! 
! (Prti (Integer 12345) ;)
! 
! While - left node is the expression, the right node is the statement.
! 
! (While expression statement)
! 
! Assign - left node is the left-hand side of

