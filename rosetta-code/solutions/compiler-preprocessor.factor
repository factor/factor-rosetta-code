! This task modifies the source code prior to the lexical analysis similar
! to the C built-in preprocessor. All design decisions go with as simple
! an example as possible to show concept and match the simple language the
! other tasks support.
! 
! Create a preprocessor for the simple programming language specified in
! the lexical analysis task referenced below. The program should read
! input from a file and/or stdin, and write output to a file and/or
! stdout.
! 
! The program should treat any line starting with a hashtag (#) as a
! command to process. There are currently two valid commands, include and
! define. No space between the hashtag and its command. Multiple
! whitespace is treated the same as one.
! 
! The include command must be followed by whitespace and a double quoted
! string whose contents is the actual file to read. Includes should allow
! the inclusion of other files to a recursive limit of five active header
! files plus the original source file.
! 
! The define command must be followed by whitespace and a new macro name.
! Redefinition or overloading of the macro name is illegal. The same
! character convention for naming variables in the language is used for
! macro names. No whitespace is required in the arguments but is allowed
! between every token. When there are no parameters, both the definition
! or usage must either have an empty argument list or there must not be
! one. The empty list is required to avoid confusion when the definition
! needs parenthesizes to force precedence. If there is a close
! parenthesis, the whitespace trailing it is optional. Otherwise, it is
! required. From that point to end of line is the definition, whitespace
! removed from both the start and end of it. Whitespace within the
! definition between tokens must be maintained. Any names within the
! definition are treated as macro names first before it is assumed they
! are a variable in the language during the usage.
! 
! To make it easier to find, the usage will be within hashtags, and
! replaces its usage elsewhere in the files processed. These usages will
! be processed everywhere they are encountered without regard to the
! syntax of the sample language. The calling arguments replace the
! define's parameters as a simple string substitution. You may not assume
! the usage proceeds in an order to form complex combinations. Tokens
! detected during definition processing can remain separated during usage
! processing. If the contents within the double hashtags is not a valid
! macro usage, its entire text is written to the output as if it was not
! detected. It is not required to use the ending hashtag as the start of
! another macro usage. Both start and end hashtags must be on the same
! line.
! 
! There are three possible [optional] command line arguments, debug,
! input, and output. Debug is an implementer depended switch such as -d or
! --debug to allow the user to pick between the commands vanishing from
! the output or the commands appearing as comments in the output. Debug
! can be specified in any order on the command line beyond the command.
! Input is the file to process, when missing the console input is used.
! The Input is always specified before the Output. Output is the file to
! create, when missing the console output is used. If only one file is
! specified, it is the input file. If you wish to use an output file and
! console input, you must specify both arguments, who's usage is left up
! to the implementer. It is not required that there be a way to specify
! the console on the command line so you could use a file for the output
! and console for the input.
! 
! This is an example usage of this concept, given a header and source the
! output should be able to feed straight into the lexical analyzer task.
! 
!     ~~ Header.h ~~
!     #define area(h, w) h * w
! 
!     ~~ Source.t ~~
!     #include "Header.h"
!     #define width 5
!     #define height 6
!     area = #area(height, width)#;
! 
! If you do not support a runtime debugging flag, your code should support
! only the second version. Otherwise, it should provide either. Yielding
! code output of:
! 
!     area = 6 * 5;
! 
! Or:
! 
!     /* Include Header.h */
!     /* Define area(h, w) as h * w */
!     /* End Header.h */
!     /* Define width as 5 */
!     /* Define height as 6 */
!     /* Use area, height, and width */
!     area = 6 * 5;
! 
! Related Tasks
! 
! -   Lexical Analyzer task
! -   Syntax Analyzer task
! -   Code Generator task
! -   Virtual Machine Interpreter task
! -   AST Interpreter task
! 
! __TOC__


