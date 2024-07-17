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


