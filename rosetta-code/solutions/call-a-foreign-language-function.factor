! Task:
! 
! Show how a foreign language function can be called from the language.
! 
! As an example, consider calling functions defined in the C language.
! Create a string containing "Hello World!" of the string type typical to
! the language. Pass the string content to C's strdup. The content can be
! copied if necessary. Get the result from strdup and print it using
! language means. Do not forget to free the result of strdup (allocated in
! the heap).
! 
! Notes:
! 
! -   It is not mandated if the C run-time library is to be loaded
!     statically or dynamically. You are free to use either way.
! -   C++ and C solutions can take some other language to communicate
!     with.
! -   It is not mandatory to use strdup, especially if the foreign
!     function interface being demonstrated makes that uninformative.
! 
! See also:
! 
! -   Use another language to call a function

FUNCTION: char* strdup ( c-string s ) ;

: my-strdup ( str -- str' )
    strdup [ utf8 alien>string ] [ (free) ] bi ;
