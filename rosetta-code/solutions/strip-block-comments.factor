! A block comment begins with a beginning delimiter and ends with a ending
! delimiter, including the delimiters. These delimiters are often
! multi-character sequences.
! 
! Task:
! 
! Strip block comments from program text (of a programming language much
! like classic C).
! 
! Your demos should at least handle simple, non-nested and multi-line
! block comment delimiters.
! 
! The block comment delimiters are the two-character sequences:
! 
! -   -    /* (beginning delimiter)
!     -    */ (ending delimiter)
! 
! Sample text for stripping:
! 
!       /**
!        * Some comments
!        * longer comments here that we can parse.
!        *
!        * Rahoo 
!        */
!        function subroutine() {
!         a = /* inline comment */ b + c ;
!        }
!        /*/ <-- tricky comments */
! 
!        /**
!         * Another comment.
!         */
!         function something() {
!         }
! 
! Extra credit:
! 
! Ensure that the stripping code is not hard-coded to the particular
! delimiters described above, but instead allows the caller to specify
! them. (If your language supports them, optional parameters may be useful
! for this.)
! 
! Category:String manipulation Category:Strings


: strip-block-comments ( string -- string )
  R/ /\*.*?\*\// "" re-replace ;

