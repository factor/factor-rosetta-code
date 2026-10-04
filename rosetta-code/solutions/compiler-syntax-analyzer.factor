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
! Run one of the Syntax analyzer solutions
! 
!     
! 
! parse < while.lex > while.ast
! 
! The following table shows the input to lex, lex output, and the AST produced by the parser
! 
!     
! 
! +--------------------------------------------+-----------------------------------------------+--------------------------------+
! | Input to lex                               | Output from lex, input to parse               | Output from parse              |
! +============================================+===============================================+================================+
! |     count = 1;                             |         1      1 Identifier      count        |     Sequence                   |
! |      while (count < 10) {                  |         1      7 Op_assign                    |     Sequence                   |
! |          print("count is: ", count, "\n"); |         1      9 Integer             1        |     ;                          |
! |          count = count + 1;                |         1     10 Semicolon                    |     Assign                     |
! |      }                                     |         2      1 Keyword_while                |     Identifier    count        |
! |                                            |         2      7 LeftParen                    |     Integer       1            |
! |                                            |         2      8 Identifier      count        |     While                      |
! |                                            |         2     14 Op_less                      |     Less                       |
! |                                            |         2     16 Integer            10        |     Identifier    count        |
! |                                            |         2     18 RightParen                   |     Integer       10           |
! |                                            |         2     20 LeftBrace                    |     Sequence                   |
! |                                            |         3      5 Keyword_print                |     Sequence                   |
! |                                            |         3     10 LeftParen                    |     ;                          |
! |                                            |         3     11 String          "count is: " |     Sequence                   |
! |                                            |         3     23 Comma                        |     Sequence                   |
! |                                            |         3     25 Identifier      count        |     Sequence                   |
! |                                            |         3     30 Comma                        |     ;                          |
! |                                            |         3     32 String          "\n"         |     Prts                       |
! |                                            |         3     36 RightParen                   |     String        "count is: " |
! |                                            |         3     37 Semicolon                    |     ;                          |
! |                                            |         4      5 Identifier      count        |     Prti                       |
! |                                            |         4     11 Op_assign                    |     Identifier    count        |
! |                                            |         4     13 Identifier      count        |     ;                          |
! |                                            |         4     19 Op_add                       |     Prts                       |
! |                                            |         4     21 Integer             1        |     String        "\n"         |
! |                                            |         4     22 Semicolon                    |     ;                          |
! |                                            |         5      1 RightBrace                   |     Assign                     |
! |                                            |         6      1 End_of_input                 |     Identifier    count        |
! |                                            |                                               |     Add                        |
! |                                            |                                               |     Identifier    count        |
! |                                            |                                               |     Integer       1            |
! +--------------------------------------------+-----------------------------------------------+--------------------------------+
! 
! Specifications
! 
! List of node type names
! 
!     
! 
!     Identifier String Integer Sequence If Prtc Prts Prti While Assign Negate Not Multiply Divide Mod
!     Add Subtract Less LessEqual Greater GreaterEqual Equal NotEqual And Or
! 
! In the text below, Null/Empty nodes are represented by ";".
! 
! Non-terminal (internal) nodes
! 
!     
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
! Assign - left node is the left-hand side of the assignment, the right
! node is the right-hand side of the assignment.
! 
! (Assign Identifier expression)
! 
! Terminal (leaf) nodes:
! 
! Identifier: (Identifier ident_name)
! Integer:    (Integer 12345)
! String:     (String "Hello World!")
! ";":        Empty node
! 
! Some simple examples
! 
! Sequences denote a list node; they are used to represent a list.
! semicolon's represent a null node, e.g., the end of this path.
! 
! This simple program:
! 
!    a=11;
! 
! Produces the following AST, encoded as a binary tree:
! 
! Under each non-leaf node are two '|' lines. The first represents the
! left sub-node, the second represents the right sub-node:
! 
!    (1) Sequence
!    (2)     |-- ;
!    (3)     |-- Assign
!    (4)         |-- Identifier: a
!    (5)         |-- Integer: 11
! 
! In flattened form:
! 
!    (1) Sequence
!    (2) ;
!    (3) Assign
!    (4) Identifier    a
!    (5) Integer       11
! 
! This program:
! 
!    a=11;
!    b=22;
!    c=33;
! 
! Produces the following AST:
! 
!    ( 1) Sequence
!    ( 2)     |-- Sequence
!    ( 3)     |   |-- Sequence
!    ( 4)     |   |   |-- ;
!    ( 5)     |   |   |-- Assign
!    ( 6)     |   |       |-- Identifier: a
!    ( 7)     |   |       |-- Integer: 11
!    ( 8)     |   |-- Assign
!    ( 9)     |       |-- Identifier: b
!    (10)     |       |-- Integer: 22
!    (11)     |-- Assign
!    (12)         |-- Identifier: c
!    (13)         |-- Integer: 33
! 
! In flattened form:
! 
!    ( 1) Sequence
!    ( 2) Sequence
!    ( 3) Sequence
!    ( 4) ;
!    ( 5) Assign
!    ( 6) Identifier    a
!    ( 7) Integer       11
!    ( 8) Assign
!    ( 9) Identifier    b
!    (10) Integer       22
!    (11) Assign
!    (12) Identifier    c
!    (13) Integer       33
! 
! Pseudo-code for the parser.
! 
! Uses Precedence Climbing for expression parsing, and Recursive Descent
! for statement parsing. The AST is also built:
! 
!     def expr(p)
!         if tok is "("
!             x = paren_expr()
!         elif tok in ["-", "+", "!"]
!             gettok()
!             y = expr(precedence of operator)
!             if operator was "+"
!                 x = y
!             else
!                 x = make_node(operator, y)
!         elif tok is an Identifier
!             x = make_leaf(Identifier, variable name)
!             gettok()
!         elif tok is an Integer constant
!             x = make_leaf(Integer, integer value)
!             gettok()
!         else
!             error()
! 
!         while tok is a binary operator and precedence of tok >= p
!             save_tok = tok
!             gettok()
!             q = precedence of save_tok
!             if save_tok is not right associative
!                 q += 1
!             x = make_node(Operator save_tok represents, x, expr(q))
! 
!         return x
! 
!     def paren_expr()
!         expect("(")
!         x = expr(0)
!         expect(")")
!         return x
! 
!     def stmt()
!         t = NULL
!         if accept("if")
!             e = paren_expr()
!             s = stmt()
!             t = make_node(If, e, make_node(If, s, accept("else") ? stmt() : NULL))
!         elif accept("putc")
!             t = make_node(Prtc, paren_expr())
!             expect(";")
!         elif accept("print")
!             expect("(")
!             repeat
!                 if tok is a string
!                     e = make_node(Prts, make_leaf(String, the string))
!                     gettok()
!                 else
!                     e = make_node(Prti, expr(0))
! 
!                 t = make_node(Sequence, t, e)
!             until not accept(",")
!             expect(")")
!             expect(";")
!         elif tok is ";"
!             gettok()
!         elif tok is an Identifier
!             v = make_leaf(Identifier, variable name)
!             gettok()
!             expect("=")
!             t = make_node(Assign, v, expr(0))
!             expect(";")
!         elif accept("while")
!             e = paren_expr()
!             t = make_node(While, e, stmt()
!         elif accept("{")
!             while tok not equal "}" and tok not equal end-of-file
!                 t = make_node(Sequence, t, stmt())
!             expect("}")
!         elif tok is end-of-file
!             pass
!         else
!             error()
!         return t
! 
!     def parse()
!         t = NULL
!         gettok()
!         repeat
!             t = make_node(Sequence, t, stmt())
!         until tok is end-of-file
!         return t
! 
! Once the AST is built, it should be output in a flattened format. This can be as simple as the following
! 
!     
! 
!     def prt_ast(t)
!         if t == NULL
!             print(";\n")
!         else
!             print(t.node_type)
!             if t.node_type in [Identifier, Integer, String]     # leaf node
!                 print the value of the Ident, Integer or String, "\n"
!             else
!                 print("\n")
!                 prt_ast(t.left)
!                 prt_ast(t.right)
! 
! If the AST is correctly built, loading it into a subsequent program should be as simple as
! 
!     
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
! Finally, the AST can also be tested by running it against one of the AST
! Interpreter solutions.
! 
! Test program, assuming this is in a file called prime.t
!     lex <prime.t | parse
! 
! +-------------------------------------------------+---------------------------------------------------------+------------------------------------------+
! | Input to lex                                    | Output from lex, input to parse                         | Output from parse                        |
! +=================================================+=========================================================+==========================================+
! |     /*                                          |         4      1 Identifier      count                  |     Sequence                             |
! |      Simple prime number generator              |         4      7 Op_assign                              |     Sequence                             |
! |      */                                         |         4      9 Integer             1                  |     Sequence                             |
! |     count = 1;                                  |         4     10 Semicolon                              |     Sequence                             |
! |     n = 1;                                      |         5      1 Identifier      n                      |     Sequence                             |
! |     limit = 100;                                |         5      3 Op_assign                              |     ;                                    |
! |     while (n < limit) {                         |         5      5 Integer             1                  |     Assign                               |
! |         k=3;                                    |         5      6 Semicolon                              |     Identifier    count                  |
! |         p=1;                                    |         6      1 Identifier      limit                  |     Integer       1                      |
! |         n=n+2;                                  |         6      7 Op_assign                              |     Assign                               |
! |         while ((k*k<=n) && (p)) {               |         6      9 Integer           100                  |     Identifier    n                      |
! |             p=n/k*k!=n;                         |         6     12 Semicolon                              |     Integer       1                      |
! |             k=k+2;                              |         7      1 Keyword_while                          |     Assign                               |
! |         }                                       |         7      7 LeftParen                              |     Identifier    limit                  |
! |         if (p) {                                |         7      8 Identifier      n                      |     Integer       100                    |
! |             print(n, " is prime\n");            |         7     10 Op_less                                |     While                                |
! |             count = count + 1;                  |         7     12 Identifier      limit                  |     Less                                 |
! |         }                                       |         7     17 RightParen                             |     Identifier    n                      |
! |     }                                           |         7     19 LeftBrace                              |     Identifier    limit                  |
! |     print("Total primes found: ", count, "\n"); |         8      5 Identifier      k                      |     Sequence                             |
! |                                                 |         8      6 Op_assign                              |     Sequence                             |
! |                                                 |         8      7 Integer             3                  |     Sequence                             |
! |                                                 |         8      8 Semicolon                              |     Sequence                             |
! |                                                 |         9      5 Identifier      p                      |     Sequence                             |
! |                                                 |         9      6 Op_assign                              |     ;                                    |
! |                                                 |         9      7 Integer             1                  |     Assign                               |
! |                                                 |         9      8 Semicolon                              |     Identifier    k                      |
! |                                                 |        10      5 Identifier      n                      |     Integer       3                      |
! |                                                 |        10      6 Op_assign                              |     Assign                               |
! |                                                 |        10      7 Identifier      n                      |     Identifier    p                      |
! |                                                 |        10      8 Op_add                                 |     Integer       1                      |
! |                                                 |        10      9 Integer             2                  |     Assign                               |
! |                                                 |        10     10 Semicolon                              |     Identifier    n                      |
! |                                                 |        11      5 Keyword_while                          |     Add                                  |
! |                                                 |        11     11 LeftParen                              |     Identifier    n                      |
! |                                                 |        11     12 LeftParen                              |     Integer       2                      |
! |                                                 |        11     13 Identifier      k                      |     While                                |
! |                                                 |        11     14 Op_multiply                            |     And                                  |
! |                                                 |        11     15 Identifier      k                      |     LessEqual                            |
! |                                                 |        11     16 Op_lessequal                           |     Multiply                             |
! |                                                 |        11     18 Identifier      n                      |     Identifier    k                      |
! |                                                 |        11     19 RightParen                             |     Identifier    k                      |
! |                                                 |        11     21 Op_and                                 |     Identifier    n                      |
! |                                                 |        11     24 LeftParen                              |     Identifier    p                      |
! |                                                 |        11     25 Identifier      p                      |     Sequence                             |
! |                                                 |        11     26 RightParen                             |     Sequence                             |
! |                                                 |        11     27 RightParen                             |     ;                                    |
! |                                                 |        11     29 LeftBrace                              |     Assign                               |
! |                                                 |        12      9 Identifier      p                      |     Identifier    p                      |
! |                                                 |        12     10 Op_assign                              |     NotEqual                             |
! |                                                 |        12     11 Identifier      n                      |     Multiply                             |
! |                                                 |        12     12 Op_divide                              |     Divide                               |
! |                                                 |        12     13 Identifier      k                      |     Identifier    n                      |
! |                                                 |        12     14 Op_multiply                            |     Identifier    k                      |
! |                                                 |        12     15 Identifier      k                      |     Identifier    k                      |
! |                                                 |        12     16 Op_notequal                            |     Identifier    n                      |
! |                                                 |        12     18 Identifier      n                      |     Assign                               |
! |                                                 |        12     19 Semicolon                              |     Identifier    k                      |
! |                                                 |        13      9 Identifier      k                      |     Add                                  |
! |                                                 |        13     10 Op_assign                              |     Identifier    k                      |
! |                                                 |        13     11 Identifier      k                      |     Integer       2                      |
! |                                                 |        13     12 Op_add                                 |     If                                   |
! |                                                 |        13     13 Integer             2                  |     Identifier    p                      |
! |                                                 |        13     14 Semicolon                              |     If                                   |
! |                                                 |        14      5 RightBrace                             |     Sequence                             |
! |                                                 |        15      5 Keyword_if                             |     Sequence                             |
! |                                                 |        15      8 LeftParen                              |     ;                                    |
! |                                                 |        15      9 Identifier      p                      |     Sequence                             |
! |                                                 |        15     10 RightParen                             |     Sequence                             |
! |                                                 |        15     12 LeftBrace                              |     ;                                    |
! |                                                 |        16      9 Keyword_print                          |     Prti                                 |
! |                                                 |        16     14 LeftParen                              |     Identifier    n                      |
! |                                                 |        16     15 Identifier      n                      |     ;                                    |
! |                                                 |        16     16 Comma                                  |     Prts                                 |
! |                                                 |        16     18 String          " is prime\n"          |     String        " is prime\n"          |
! |                                                 |        16     31 RightParen                             |     ;                                    |
! |                                                 |        16     32 Semicolon                              |     Assign                               |
! |                                                 |        17      9 Identifier      count                  |     Identifier    count                  |
! |                                                 |        17     15 Op_assign                              |     Add                                  |
! |                                                 |        17     17 Identifier      count                  |     Identifier    count                  |
! |                                                 |        17     23 Op_add                                 |     Integer       1                      |
! |                                                 |        17     25 Integer             1                  |     ;                                    |
! |                                                 |        17     26 Semicolon                              |     Sequence                             |
! |                                                 |        18      5 RightBrace                             |     Sequence                             |
! |                                                 |        19      1 RightBrace                             |     Sequence                             |
! |                                                 |        20      1 Keyword_print                          |     ;                                    |
! |                                                 |        20      6 LeftParen                              |     Prts                                 |
! |                                                 |        20      7 String          "Total primes found: " |     String        "Total primes found: " |
! |                                                 |        20     29 Comma                                  |     ;                                    |
! |                                                 |        20     31 Identifier      count                  |     Prti                                 |
! |                                                 |        20     36 Comma                                  |     Identifier    count                  |
! |                                                 |        20     38 String          "\n"                   |     ;                                    |
! |                                                 |        20     42 RightParen                             |     Prts                                 |
! |                                                 |        20     43 Semicolon                              |     String        "\n"                   |
! |                                                 |        21      1 End_of_input                           |     ;                                    |
! +-------------------------------------------------+---------------------------------------------------------+------------------------------------------+
! 
! Additional examples
! 
! Your solution should pass all the test cases above and the additional
! tests found Here.
! 
! The C and Python versions can be considered reference implementations.
! 
! Related Tasks
! 
! - Lexical Analyzer task
! - Code Generator task
! - Virtual Machine Interpreter task
! - AST Interpreter task
! 
! __TOC__


