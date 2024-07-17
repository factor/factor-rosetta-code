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
! Once the AST is built, it should be output in a flattened format. This can be as simple as the following:
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
! If the AST is correctly built, loading it into a subsequent program should be as simple as:
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
! Test program, assuming this is in a file called prime.t: lex <prime.t | parse
! 
! +----------------------+----------------------+----------------------+
! | Input to lex         | Output from lex,     | Output from parse    |
! |                      | input to parse       |                      |
! +======================+======================+======================+
! |     /*               |         4      1 I   |     Sequence         |
! |      Simple pr       | dentifier      count |     Sequence         |
! | ime number generator |                      |     Sequence         |
! |      */              |   4      7 Op_assign |     Sequence         |
! |     count = 1;       |         4      9 I   |     Sequence         |
! |     n = 1;           | nteger             1 |     ;                |
! |     limit = 100;     |                      |     Assign           |
! |                      |   4     10 Semicolon |                      |
! |  while (n < limit) { |         5            |  Identifier    count |
! |         k=3;         |  1 Identifier      n |     Integer       1  |
! |         p=1;         |                      |     Assign           |
! |         n=n+2;       |   5      3 Op_assign |     Identifier    n  |
! |         while        |         5      5 I   |     Integer       1  |
! |  ((k*k<=n) && (p)) { | nteger             1 |     Assign           |
! |                      |                      |                      |
! |          p=n/k*k!=n; |   5      6 Semicolon |  Identifier    limit |
! |             k=k+2;   |         6      1 I   |                      |
! |         }            | dentifier      limit |    Integer       100 |
! |         if (p) {     |                      |     While            |
! |             prin     |   6      7 Op_assign |     Less             |
! | t(n, " is prime\n"); |         6      9 I   |     Identifier    n  |
! |                      | nteger           100 |                      |
! |   count = count + 1; |                      |  Identifier    limit |
! |         }            |   6     12 Semicolon |     Sequence         |
! |     }                |         7            |     Sequence         |
! |     pri              |      1 Keyword_while |     Sequence         |
! | nt("Total primes fou |                      |     Sequence         |
! | nd: ", count, "\n"); |   7      7 LeftParen |     Sequence         |
! |                      |         7            |     ;                |
! |                      |  8 Identifier      n |     Assign           |
! |                      |                      |     Identifier    k  |
! |                      |     7     10 Op_less |     Integer       3  |
! |                      |         7     12 I   |     Assign           |
! |                      | dentifier      limit |     Identifier    p  |
! |                      |                      |     Integer       1  |
! |                      |  7     17 RightParen |     Assign           |
! |                      |                      |     Identifier    n  |
! |                      |   7     19 LeftBrace |     Add              |
! |                      |         8            |     Identifier    n  |
! |                      |  5 Identifier      k |     Integer       2  |
! |                      |                      |     While            |
! |                      |   8      6 Op_assign |     And              |
! |                      |         8      7 I   |     LessEqual        |
! |                      | nteger             3 |     Multiply         |
! |                      |                      |     Identifier    k  |
! |                      |   8      8 Semicolon |     Identifier    k  |
! |                      |         9            |     Identifier    n  |
! |                      |  5 Identifier      p |     Identifier    p  |
! |                      |                      |     Sequence         |
! |                      |   9      6 Op_assign |     Sequence         |
! |                      |         9      7 I   |     ;                |
! |                      | nteger             1 |     Assign           |
! |                      |                      |     Identifier    p  |
! |                      |   9      8 Semicolon |     NotEqual         |
! |                      |        10            |     Multiply         |
! |                      |  5 Identifier      n |     Divide           |
! |                      |                      |     Identifier    n  |
! |                      |  10      6 Op_assign |     Identifier    k  |
! |                      |        10            |     Identifier    k  |
! |                      |  7 Identifier      n |     Identifier    n  |
! |                      |                      |     Assign           |
! |                      |     10      8 Op_add |     Identifier    k  |
! |                      |        10      9 I   |     Add              |
! |                      | nteger             2 |     Identifier    k  |
! |                      |                      |     Integer       2  |
! |                      |  10     10 Semicolon |     If               |
! |                      |        11            |     Identifier    p  |
! |                      |      5 Keyword_while |     If               |
! |                      |                      |     Sequence         |
! |                      |  11     11 LeftParen |     Sequence         |
! |                      |                      |     ;                |
! |                      |  11     12 LeftParen |     Sequence         |
! |                      |        11            |     Sequence         |
! |                      | 13 Identifier      k |     ;                |
! |                      |        1             |     Prti             |
! |                      | 1     14 Op_multiply |     Identifier    n  |
! |                      |        11            |     ;                |
! |                      | 15 Identifier      k |     Prts             |
! |                      |        11            |     String           |
! |                      |      16 Op_lessequal |        " is prime\n" |
! |                      |        11            |     ;                |
! |                      | 18 Identifier      n |     Assign           |
! |                      |                      |                      |
! |                      | 11     19 RightParen |  Identifier    count |
! |                      |                      |     Add              |
! |                      |     11     21 Op_and |                      |
! |                      |                      |  Identifier    count |
! |                      |  11     24 LeftParen |     Integer       1  |
! |                      |        11            |     ;                |
! |                      | 25 Identifier      p |     Sequence         |
! |                      |                      |     Sequence         |
! |                      | 11     26 RightParen |     Sequence         |
! |                      |                      |     ;                |
! |                      | 11     27 RightParen |     Prts             |
! |                      |                      |     String        "T |
! |                      |  11     29 LeftBrace | otal primes found: " |
! |                      |        12            |     ;                |
! |                      |  9 Identifier      p |     Prti             |
! |                      |                      |                      |
! |                      |  12     10 Op_assign |  Identifier    count |
! |                      |        12            |     ;                |
! |                      | 11 Identifier      n |     Prts             |
! |                      |                      |                      |
! |                      |  12     12 Op_divide |   String        "\n" |
! |                      |        12            |     ;                |
! |                      | 13 Identifier      k |                      |
! |                      |        1             |                      |
! |                      | 2     14 Op_multiply |                      |
! |                      |        12            |                      |
! |                      | 15 Identifier      k |                      |
! |                      |        1             |                      |
! |                      | 2     16 Op_notequal |                      |
! |                      |        12            |                      |
! |                      | 18 Identifier      n |                      |
! |                      |                      |                      |
! |                      |  12     19 Semicolon |                      |
! |                      |        13            |                      |
! |                      |  9 Identifier      k |                      |
! |                      |                      |                      |
! |                      |  13     10 Op_assign |                      |
! |                      |        13            |                      |
! |                      | 11 Identifier      k |                      |
! |                      |                      |                      |
! |                      |     13     12 Op_add |                      |
! |                      |        13     13 I   |                      |
! |                      | nteger             2 |                      |
! |                      |                      |                      |
! |                      |  13     14 Semicolon |                      |
! |                      |                      |                      |
! |                      | 14      5 RightBrace |                      |
! |                      |                      |                      |
! |                      | 15      5 Keyword_if |                      |
! |                      |                      |                      |
! |                      |  15      8 LeftParen |                      |
! |                      |        15            |                      |
! |                      |  9 Identifier      p |                      |
! |                      |                      |                      |
! |                      | 15     10 RightParen |                      |
! |                      |                      |                      |
! |                      |  15     12 LeftBrace |                      |
! |                      |        16            |                      |
! |                      |      9 Keyword_print |                      |
! |                      |                      |                      |
! |                      |  16     14 LeftParen |                      |
! |                      |        16            |                      |
! |                      | 15 Identifier      n |                      |
! |                      |                      |                      |
! |                      |      16     16 Comma |                      |
! |                      |                      |                      |
! |                      |  16     18 String    |                      |
! |                      |        " is prime\n" |                      |
! |                      |                      |                      |
! |                      | 16     31 RightParen |                      |
! |                      |                      |                      |
! |                      |  16     32 Semicolon |                      |
! |                      |        17      9 I   |                      |
! |                      | dentifier      count |                      |
! |                      |                      |                      |
! |                      |  17     15 Op_assign |                      |
! |                      |        17     17 I   |                      |
! |                      | dentifier      count |                      |
! |                      |                      |                      |
! |                      |     17     23 Op_add |                      |
! |                      |        17     25 I   |                      |
! |                      | nteger             1 |                      |
! |                      |                      |                      |
! |                      |  17     26 Semicolon |                      |
! |                      |                      |                      |
! |                      | 18      5 RightBrace |                      |
! |                      |                      |                      |
! |                      | 19      1 RightBrace |                      |
! |                      |        20            |                      |
! |                      |      1 Keyword_print |                      |
! |                      |                      |                      |
! |                      |  20      6 LeftParen |                      |
! |                      |        20            |                      |
! |                      | 7 String          "T |                      |
! |                      | otal primes found: " |                      |
! |                      |                      |                      |
! |                      |      20     29 Comma |                      |
! |                      |        20     31 I   |                      |
! |                      | dentifier      count |                      |
! |                      |                      |                      |
! |                      |      20     36 Comma |                      |
! |                      |        20     38     |                      |
! |                      | String          "\n" |                      |
! |                      |                      |                      |
! |                      | 20     42 RightParen |                      |
! |                      |                      |                      |
! |                      |  20     43 Semicolon |                      |
! |                      |        21            |                      |
! |                      |       1 End_of_input |                      |
! +----------------------+----------------------+----------------------+
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
! -   Lexical Analyzer task
! -   Code Generator task
! -   Virtual Machine Interpreter task
! -   AST Interpreter task
! 
! __TOC__


