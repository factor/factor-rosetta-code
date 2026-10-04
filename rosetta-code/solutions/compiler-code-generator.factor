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
! Run one of the Syntax analyzer solutions
! 
!     
! 
! parse < while.lex > while.ast
! 
! while.ast can be input into the code generator.
! 
! The following table shows the input to lex, lex output, the AST produced by the parser, and the generated virtual assembly code.
! 
! Run as:  lex < while.t | parse | gen
! 
! +-------------------------------------------+-------------------------------------------------+--------------------------------+----------------------------+
! | Input to lex                              | Output from lex, input to parse                 | Output from parse              | Output from gen, input to  |
! |                                           |                                                 |                                | VM                         |
! +===========================================+=================================================+================================+============================+
! |     count = 1;                            |         1      1   Identifier      count        |     Sequence                   |     Datasize: 1 Strings: 2 |
! |     while (count < 10) {                  |         1      7   Op_assign                    |     Sequence                   |     "count is: "           |
! |         print("count is: ", count, "\n"); |         1      9   Integer              1       |     ;                          |     "\n"                   |
! |         count = count + 1;                |         1     10   Semicolon                    |     Assign                     |        0 push  1           |
! |     }                                     |         2      1   Keyword_while                |     Identifier    count        |        5 store [0]         |
! |                                           |         2      7   LeftParen                    |     Integer       1            |       10 fetch [0]         |
! |                                           |         2      8   Identifier      count        |     While                      |       15 push  10          |
! |                                           |         2     14   Op_less                      |     Less                       |       20 lt                |
! |                                           |         2     16   Integer             10       |     Identifier    count        |       21 jz     (43) 65    |
! |                                           |         2     18   RightParen                   |     Integer       10           |       26 push  0           |
! |                                           |         2     20   LeftBrace                    |     Sequence                   |       31 prts              |
! |                                           |         3      5   Keyword_print                |     Sequence                   |       32 fetch [0]         |
! |                                           |         3     10   LeftParen                    |     ;                          |       37 prti              |
! |                                           |         3     11   String          "count is: " |     Sequence                   |       38 push  1           |
! |                                           |         3     23   Comma                        |     Sequence                   |       43 prts              |
! |                                           |         3     25   Identifier      count        |     Sequence                   |       44 fetch [0]         |
! |                                           |         3     30   Comma                        |     ;                          |       49 push  1           |
! |                                           |         3     32   String          "\n"         |     Prts                       |       54 add               |
! |                                           |         3     36   RightParen                   |     String        "count is: " |       55 store [0]         |
! |                                           |         3     37   Semicolon                    |     ;                          |       60 jmp    (-51) 10   |
! |                                           |         4      5   Identifier      count        |     Prti                       |       65 halt              |
! |                                           |         4     11   Op_assign                    |     Identifier    count        |                            |
! |                                           |         4     13   Identifier      count        |     ;                          |                            |
! |                                           |         4     19   Op_add                       |     Prts                       |                            |
! |                                           |         4     21   Integer              1       |     String        "\n"         |                            |
! |                                           |         4     22   Semicolon                    |     ;                          |                            |
! |                                           |         5      1   RightBrace                   |     Assign                     |                            |
! |                                           |         6      1   End_of_input                 |     Identifier    count        |                            |
! |                                           |                                                 |     Add                        |                            |
! |                                           |                                                 |     Identifier    count        |                            |
! |                                           |                                                 |     Integer       1            |                            |
! +-------------------------------------------+-------------------------------------------------+--------------------------------+----------------------------+
! 
! Input format
! 
!     
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
! - The first line is the header: Size of data, and number of constant
!   strings.
!   - size of data is the number of 32-bit unique variables used. In this
!     example, one variable, count
!   - number of constant strings is just that - how many there are
! - After that, the constant strings
! - Finally, the assembly code
! 
! Registers
! 
!     
! 
! - sp: the stack pointer - points to the next top of stack. The stack is
!   a 32-bit integer array.
! 
! - pc: the program counter - points to the current instruction to be
!   performed. The code is an array of bytes.
! 
! Data
! 
!     
! 
! 32-bit integers and strings
! 
! Instructions
! 
!     
! 
! Each instruction is one byte. The following instructions also have a
! 32-bit integer operand:
! 
! fetch [index]
! 
! where index is an index into the data array.
! 
! store [index]
! 
! where index is an index into the data array.
! 
! push n
! 
! where value is a 32-bit integer that will be pushed onto the stack.
! 
! jmp (n) addr
! 
! where (n) is a 32-bit integer specifying the distance between the
! current location and the desired location. addr is an unsigned value of
! the actual code address.
! 
! jz (n) addr
! 
! where (n) is a 32-bit integer specifying the distance between the
! current location and the desired location. addr is an unsigned value of
! the actual code address.
! 
! The following instructions do not have an operand. They perform their
! operation directly against the stack:
! 
! For the following instructions, the operation is performed against the
! top two entries in the stack:
! 
! add
! sub
! mul
! div
! mod
! lt
! gt
! le
! ge
! eq
! ne
! and
! or
! 
! For the following instructions, the operation is performed against the
! top entry in the stack:
! 
! neg
! not
! 
! prtc
! 
! Print the word at stack top as a character.
! 
! prti
! 
! Print the word at stack top as an integer.
! 
! prts
! 
! Stack top points to an index into the string pool. Print that entry.
! 
! halt
! 
! Unconditional stop.
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
! - Syntax Analyzer task
! - Virtual Machine Interpreter task
! - AST Interpreter task
! 
! __TOC__


