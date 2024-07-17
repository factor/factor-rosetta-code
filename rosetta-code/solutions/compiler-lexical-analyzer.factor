! Definition from Wikipedia:
! 
!     Lexical analysis is the process of converting a sequence of
!     characters (such as in a computer program or web page) into a
!     sequence of tokens (strings with an identified "meaning"). A program
!     that performs lexical analysis may be called a lexer, tokenizer, or
!     scanner (though "scanner" is also used to refer to the first stage
!     of a lexer).
! 
! Create a lexical analyzer for the simple programming language specified
! below. The program should read input from a file and/or stdin, and write
! output to a file and/or stdout. If the language being used has a lexer
! module/library/class, it would be great if two versions of the solution
! are provided: One without the lexer module, and one with.
! 
! The simple programming language to be analyzed is more or less a subset
! of C. It supports the following tokens:
! 
! Operators
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Name !! Common name !! Character sequence |- | Op_multiply ||
! multiply || * |- | Op_divide || divide || / |- | Op_mod || mod || % |- |
! Op_add || plus || + |- | Op_subtract || minus || - |- | Op_negate ||
! unary minus || - |- | Op_less || less than || < |- | Op_lessequal ||
! less than or equal || <= |- | Op_greater || greater than || > |- |
! Op_greaterequal || greater than or equal || >= |- | Op_equal || equal ||
! == |- | Op_notequal || not equal || != |- | Op_not || unary not || ! |-
! | Op_assign || assignment || = |- | Op_and || logical and || && |- |
! Op_or || logical or || ¦¦ |}
! 
! -   The - token should always be interpreted as Op_subtract by the
!     lexer. Turning some Op_subtract into Op_negate will be the job of
!     the syntax analyzer, which is not part of this task.
! 
! Symbols
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Name !! Common name !! Character |- | LeftParen || left parenthesis
! || ( |- | RightParen || right parenthesis || ) |- | LeftBrace || left
! brace || { |- | RightBrace || right brace || } |- | Semicolon ||
! semi-colon || ; |- | Comma || comma || , |}
! 
! Keywords
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Name || Character sequence |- | Keyword_if || if |- | Keyword_else
! || else |- | Keyword_while || while |- | Keyword_print || print |- |
! Keyword_putc || putc |}
! 
! Identifiers and literals
! 
! These differ from the the previous tokens, in that each occurrence of
! them has a value associated with it.
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Name ! Common name ! Format description ! Format regex ! Value |- |
! Identifier | identifier | one or more letter/number/underscore
! characters, but not starting with a number | [_a-zA-Z][_a-zA-Z0-9]* | as
! is |- | Integer | integer literal | one or more digits | [0-9]+ | as is,
! interpreted as a number |- | Integer | char literal | exactly one
! character (anything except newline or single quote) or one of the
! allowed escape sequences, enclosed by single quotes |
! '([^'\n]|\\n|\\\\)' | the ASCII code point number of the character, e.g.
! 65 for 'A' and 10 for '\n' |- | String | string literal | zero or more
! characters (anything except newline or double quote), enclosed by double
! quotes | "[^"\n]*" | the characters without the double quotes and with
! escape sequences converted |}
! 
! -   For char and string literals, the \n escape sequence is supported to
!     represent a new-line character.
! -   For char and string literals, to represent a backslash, use \\.
! -   No other special sequences are supported. This means that:
!     -   Char literals cannot represent a single quote character (value
!         39).
!     -   String literals cannot represent strings containing double quote
!         characters.
! 
! Zero-width tokens
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Name || Location |- | End_of_input || when the end of the input
! stream is reached |}
! 
! White space
! 
! -   Zero or more whitespace characters, or comments enclosed in
!     /* ... */, are allowed between any two tokens, with the exceptions
!     noted below.
! -   "Longest token matching" is used to resolve conflicts (e.g., in
!     order to match <= as a single token rather than the two tokens < and
!     =).
! -   Whitespace is required between two tokens that have an alphanumeric
!     character or underscore at the edge.
!     -   This means: keywords, identifiers, and integer literals.
!     -   e.g. ifprint is recognized as an identifier, instead of the
!         keywords if and print.
!     -   e.g. 42fred is invalid, and neither recognized as a number nor
!         an identifier.
! -   Whitespace is not allowed inside of tokens (except for chars and
!     strings where they are part of the value).
!     -   e.g. & & is invalid, and not interpreted as the && operator.
! 
! For example, the following two program fragments are equivalent, and
! should produce the same token stream except for the line and column
! positions:
! 
! *
! 
!     if ( p /* meaning n is prime */ ) {
!         print ( n , " " ) ;
!         count = count + 1 ; /* number of primes found so far */
!     }
! 
! -   if(p){print(n," ");count=count+1;}
! 
! Complete list of token names
! 
!     End_of_input  Op_multiply   Op_divide     Op_mod       Op_add     Op_subtract
!     Op_negate     Op_not        Op_less       Op_lessequal Op_greater Op_greaterequal
!     Op_equal      Op_notequal   Op_assign     Op_and       Op_or      Keyword_if
!     Keyword_else  Keyword_while Keyword_print Keyword_putc LeftParen  RightParen
!     LeftBrace     RightBrace    Semicolon     Comma        Identifier Integer
!     String
! 
! The program output should be a sequence of lines, each consisting of the
! following whitespace-separated fields:
! 
! 1.  the line number where the token starts
! 2.  the column number where the token starts
! 3.  the token name
! 4.  the token value (only for Identifier, Integer, and String tokens)
! 5.  the number of spaces between fields is up to you. Neatly aligned is
!     nice, but not a requirement.
! 
! This task is intended to be used as part of a pipeline, with the other
! compiler tasks - for example:
! 
! lex < hello.t | parse | gen | vm
! 
! Or possibly:
! 
! lex hello.t lex.out
! 
! parse lex.out parse.out
! 
! gen parse.out gen.out
! 
! vm gen.out
! 
! This implies that the output of this task (the lexical analyzer) should
! be suitable as input to any of the Syntax Analyzer task programs.
! 
! The following error conditions should be caught:
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Error ! Example |- | Empty character constant | '' |- | Unknown
! escape sequence. | \r |- | Multi-character constant. | 'xx' |- |
! End-of-file in comment. Closing comment characters not found. |- |
! End-of-file while scanning string literal. Closing string character not
! found. |- | End-of-line while scanning string literal. Closing string
! character not found before end-of-line. |- | Unrecognized character. | |
! |- | Invalid number. Starts like a number, but ends in non-numeric
! characters. | 123abc |}
! 
!     {| class="wikitable"
! 
! |- ! Input ! Output |- | style="vertical-align:top" | Test Case 1:
! 
!     /*
!       Hello world
!      */
!     print("Hello, World!\n");
! 
! | style="vertical-align:top" |
! 
!         4      1 Keyword_print
!         4      6 LeftParen
!         4      7 String         "Hello, World!\n"
!         4     24 RightParen
!         4     25 Semicolon
!         5      1 End_of_input
! 
! |- | style="vertical-align:top" | Test Case 2:
! 
!     /*
!       Show Ident and Integers
!      */
!     phoenix_number = 142857;
!     print(phoenix_number, "\n");
! 
! | style="vertical-align:top" |
! 
!         4      1 Identifier     phoenix_number
!         4     16 Op_assign
!         4     18 Integer         142857
!         4     24 Semicolon
!         5      1 Keyword_print
!         5      6 LeftParen
!         5      7 Identifier     phoenix_number
!         5     21 Comma
!         5     23 String         "\n"
!         5     27 RightParen
!         5     28 Semicolon
!         6      1 End_of_input
! 
! |- | style="vertical-align:top" | Test Case 3:
! 
!     /*
!       All lexical tokens - not syntactically correct, but that will
!       have to wait until syntax analysis
!      */
!     /* Print   */  print    /* Sub     */  -
!     /* Putc    */  putc     /* Lss     */  <
!     /* If      */  if       /* Gtr     */  >
!     /* Else    */  else     /* Leq     */  <=
!     /* While   */  while    /* Geq     */  >=
!     /* Lbrace  */  {        /* Eq      */  ==
!     /* Rbrace  */  }        /* Neq     */  !=
!     /* Lparen  */  (        /* And     */  &&
!     /* Rparen  */  )        /* Or      */  ||
!     /* Uminus  */  -        /* Semi    */  ;
!     /* Not     */  !        /* Comma   */  ,
!     /* Mul     */  *        /* Assign  */  =
!     /* Div     */  /        /* Integer */  42
!     /* Mod     */  %        /* String  */  "String literal"
!     /* Add     */  +        /* Ident   */  variable_name
!     /* character literal */  '\n'
!     /* character literal */  '\\'
!     /* character literal */  ' '
! 
! | style="vertical-align:top" |
! 
!         5     16   Keyword_print
!         5     40   Op_subtract
!         6     16   Keyword_putc
!         6     40   Op_less
!         7     16   Keyword_if
!         7     40   Op_greater
!         8     16   Keyword_else
!         8     40   Op_lessequal
!         9     16   Keyword_while
!         9     40   Op_greaterequal
!        10     16   LeftBrace
!        10     40   Op_equal
!        11     16   RightBrace
!        11     40   Op_notequal
!        12     16   LeftParen
!        12     40   Op_and
!        13     16   RightParen
!        13     40   Op_or
!        14     16   Op_subtract
!        14     40   Semicolon
!        15     16   Op_not
!        15     40   Comma
!        16     16   Op_multiply
!        16     40   Op_assign
!        17     16   Op_divide
!        17     40   Integer             42
!        18     16   Op_mod
!        18     40   String          "String literal"
!        19     16   Op_add
!        19     40   Identifier      variable_name
!        20     26   Integer             10
!        21     26   Integer             92
!        22     26   Integer             32
!        23      1   End_of_input
! 
! |- | style="vertical-align:top" | Test Case 4:
! 
!     /*** test printing, embedded \n and comments with lots of '*' ***/
!     print(42);
!     print("\nHello World\nGood Bye\nok\n");
!     print("Print a slash n - \\n.\n");
! 
! | style="vertical-align:top" |
! 
!         2      1 Keyword_print
!         2      6 LeftParen
!         2      7 Integer            42
!         2      9 RightParen
!         2     10 Semicolon
!         3      1 Keyword_print
!         3      6 LeftParen
!         3      7 String          "\nHello World\nGood Bye\nok\n"
!         3     38 RightParen
!         3     39 Semicolon
!         4      1 Keyword_print
!         4      6 LeftParen
!         4      7 String          "Print a slash n - \\n.\n"
!         4     33 RightParen
!         4     34 Semicolon
!         5      1 End_of_input
! 
! |}
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
! -   Syntax Analyzer task
! -   Code Generator task
! -   Virtual Machine Interpreter task
! -   AST Interpreter task


