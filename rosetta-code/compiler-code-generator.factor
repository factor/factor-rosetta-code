! A code generator translates the output of the syntax analyzer and/or
! semantic analyzer into lower level code, either assembly, object, or
! virtual.
! 
! Task
! 
! Take the output of the Syntax analyzer task - which is a flattened
! Abstract Syntax Tree (AST) - and convert it to virtual machine code,
! that can be run by the Virtual machine interpreter. The output is in
! text format, and represents virtual assembly code.
! 
! The program should read input from a file and/or stdin, and write output
! to a file and/or stdout.
! 
! Example - given the simple program (below), stored in a file called while.t, create the list of tokens, using one of the Lexical analyzer solutions
! 
! lex < while.t > while.lex
! 
! Run one of the Syntax analyzer solutions:
! 
! parse < while.lex > while.ast
! 
! while.ast can be input into the code generator.
! 
! The following table shows the input to lex, lex output, the AST produced by the parser, and the generated virtual assembly code.
! 
! Run as:  lex < while.t | parse | gen
! 
! +----------------+----------------+----------------+----------------+
! | Input to lex   | Output from    | Output from    | Output from    |
! |                | lex, input to  | parse          | gen, input to  |
! |                | parse          |                | VM             |
! +================+================+================+================+
! |     count = 1; |         1      |     Sequence   |     Datasize   |
! |     while      |    1   Identif |     Sequence   | : 1 Strings: 2 |
! | (count < 10) { | ier      count |     ;          |                |
! |         print  |         1      |     Assign     |   "count is: " |
! | ("count is: ", |  7   Op_assign |     Ident      |     "\n"       |
! |  count, "\n"); |         1      | ifier    count |                |
! |         coun   |   9   Integer  |     I          |      0 push  1 |
! | t = count + 1; |              1 | nteger       1 |                |
! |     }          |         1      |     While      |    5 store [0] |
! |                | 10   Semicolon |     Less       |                |
! |                |                |     Ident      |   10 fetch [0] |
! |                |     2      1   | ifier    count |                |
! |                |  Keyword_while |     In         |    15 push  10 |
! |                |         2      | teger       10 |       20 lt    |
! |                |  7   LeftParen |     Sequence   |       21       |
! |                |         2      |     Sequence   | jz     (43) 65 |
! |                |    8   Identif |     ;          |                |
! |                | ier      count |     Sequence   |     26 push  0 |
! |                |         2      |     Sequence   |       31 prts  |
! |                |   14   Op_less |     Sequence   |                |
! |                |         2      |     ;          |   32 fetch [0] |
! |                |  16   Integer  |     Prts       |       37 prti  |
! |                |             10 |                |                |
! |                |                |   String       |     38 push  1 |
! |                |        2     1 |   "count is: " |       43 prts  |
! |                | 8   RightParen |     ;          |                |
! |                |         2      |     Prti       |   44 fetch [0] |
! |                | 20   LeftBrace |     Ident      |                |
! |                |                | ifier    count |     49 push  1 |
! |                |     3      5   |     ;          |       54 add   |
! |                |  Keyword_print |     Prts       |                |
! |                |         3      |     Stri       |   55 store [0] |
! |                | 10   LeftParen | ng        "\n" |       60 j     |
! |                |                |     ;          | mp    (-51) 10 |
! |                |    3     11    |     Assign     |       65 halt  |
! |                | String         |     Ident      |                |
! |                |   "count is: " | ifier    count |                |
! |                |         3      |     Add        |                |
! |                |     23   Comma |     Ident      |                |
! |                |         3      | ifier    count |                |
! |                |   25   Identif |     I          |                |
! |                | ier      count | nteger       1 |                |
! |                |         3      |                |                |
! |                |     30   Comma |                |                |
! |                |         3      |                |                |
! |                |    32   String |                |                |
! |                |           "\n" |                |                |
! |                |                |                |                |
! |                |        3     3 |                |                |
! |                | 6   RightParen |                |                |
! |                |         3      |                |                |
! |                | 37   Semicolon |                |                |
! |                |         4      |                |                |
! |                |    5   Identif |                |                |
! |                | ier      count |                |                |
! |                |         4      |                |                |
! |                | 11   Op_assign |                |                |
! |                |         4      |                |                |
! |                |   13   Identif |                |                |
! |                | ier      count |                |                |
! |                |         4      |                |                |
! |                |    19   Op_add |                |                |
! |                |         4      |                |                |
! |                |  21   Integer  |                |                |
! |                |              1 |                |                |
! |                |         4      |                |                |
! |                | 22   Semicolon |                |                |
! |                |                |                |                |
! |                |        5       |                |                |
! |                | 1   RightBrace |                |                |
! |                |                |                |                |
! |                |      6      1  |                |                |
! |                |   End_of_input |                |                |
! +----------------+----------------+----------------+----------------+
! 
! Input format:
! 
! As shown in the table, above, the output from the syntax analyzer is a
! flattened AST.
! 
! In the AST, Identifier, Integer, and String, are terminal nodes, e.g,
! they do not have child nodes.
! 
! Loading this data into an internal parse tree should be as simple as:
! 
!     def load_ast()
!         line = readline()
!         # Each line has at least one token
!         line_list = tokenize the line, respecting double quotes
! 
!         text = line_list[0] # first token is always the node type
! 
!         if text == ";"
!             return None
! 
!         node_type = text # could convert to internal form if desired
! 
!         # A line with two tokens is a leaf node
!         # Leaf nodes are: Identifier, Integer String
!         # The 2nd token is the value
!         if len(line_list) > 1
!             return make_leaf(node_type, line_list[1])
! 
!         left = load_ast()
!         right = load_ast()
!         return make_node(node_type, left, right)
! 
! Output format - refer to the table above
! 
! -   The first line is the header: Size of data, and number of constant
!     strings.
!     -   size of data is the number of 32-bit unique variables used. In
!         this example, one variable, count
!     -   number of constant strings is just that - how many there are
! -   After that, the constant strings
! -   Finally, the assembly code
! 
! Registers:
! 
! -   sp: the stack pointer - points to the next top of stack. The stack
!     is a 32-bit integer array.
! 
! -   pc: the program counter - points to the current instruction to be
!     performed. The code is an array of bytes.
! 
! Data:
! 
! 32-bit integers and strings
! 
! Instructions:
! 
! Each instruction is one byte. The following instructions also have a

