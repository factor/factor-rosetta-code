! An AST interpreter interprets an Abstract Syntax Tree (AST) produced by
! a Syntax Analyzer.
! 
! Task
! 
! Take the AST output from the Syntax analyzer task, and interpret it as
! appropriate. Refer to the Syntax analyzer task for details of the AST.
! 
! Loading the AST from the syntax analyzer is as simple as (pseudo code):
! 
!     def load_ast()
!         line = readline()
!         # Each line has at least one token
!         line_list = tokenize the line, respecting double quotes
! 
!         text = line_list[0] # first token is always the node type
! 
!         if text == ";"   # a terminal node
!             return NULL
! 
!         node_type = text # could convert to internal form if desired
! 
!         # A line with two tokens is a leaf node
!         # Leaf nodes are: Identifier, Integer, String
!         # The 2nd token is the value
!         if len(line_list) > 1
!             return make_leaf(node_type, line_list[1])
! 
!         left = load_ast()
!         right = load_ast()
!         return make_node(node_type, left, right)
! 
! The interpreter algorithm is relatively simple:
! 
!     interp(x)
!         if x == NULL return NULL
!         elif x.node_type == Integer return x.value converted to an integer
!         elif x.node_type == Ident   return the current value of variable x.value
!         elif x.node_type == String  return x.value
!         elif x.node_type == Assign
!                         globals[x.left.value] = interp(x.right)
!                         return NULL
!         elif x.node_type is a binary operator return interp(x.left) operator interp(x.right)
!         elif x.node_type is a unary operator, return return operator interp(x.left)
!         elif x.node_type ==  If
!                         if (interp(x.left)) then interp(x.right.left)
!                         else interp(x.right.right)
!                         return NULL
!         elif x.node_type == While
!                         while (interp(x.left)) do interp(x.right)
!                         return NULL
!         elif x.node_type == Prtc
!                         print interp(x.left) as a character, no newline
!                         return NULL
!         elif x.node_type == Prti
!                         print interp(x.left) as an integer, no newline
!                         return NULL
!         elif x.node_type == Prts
!                         print interp(x.left) as a string, respecting newlines ("\n")
!                         return NULL
!         elif x.node_type == Sequence
!                         interp(x.left)
!                         interp(x.right)
!                         return NULL
!         else
!             error("unknown node type")
! 
! Notes:
! 
! Because of the simple nature of our tiny language, Semantic analysis is
! not needed.
! 
! Your interpreter should use C like division semantics, for both division
! and modulus. For division of positive operands, only the non-fractional
! portion of the result should be returned. In other words, the result
! should be truncated towards 0.
! 
! This means, for instance, that 3 / 2 should result in 1.
! 
! For division when one of the operands is negative, the result should be
! truncated towards 0.
! 
! This means, for instance, that 3 / -2 should result in -1.
! 
! Test program
! 
! +-------------------------------------+-------------------------------+
! | prime.t                             | lex <prime.t | parse | interp |
! +=====================================+===============================+
! |     /*                              |     3 is prime                |
! |      Simple prime number generator  |     5 is prime                |
! |      */                             |     7 is prime                |
! |     count = 1;                      |     11 is prime               |
! |     n = 1;                          |     13 is prime               |
! |     limit = 100;                    |     17 is prime               |
! |     while (n < limit) {             |     19 is prime               |
! |         k=3;                        |     23 is prime               |
! |         p=1;                        |     29 is prime               |
! |         n=n+2;                      |     31 is prime               |
! |         while 

