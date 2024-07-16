! Task:
! 
! -   Generate a string with N opening brackets [ and with N closing
!     brackets ], in some arbitrary order.
! -   Determine whether the generated string is balanced; that is, whether
!     it consists entirely of pairs of opening/closing brackets (in that
!     order), none of which mis-nest.
! 
! Examples:
! 
!    (empty)      OK
!    []           OK   
!    [][]         OK   
!    [[][]]       OK 
!    ][         NOT OK
!    ][][       NOT OK
!    []][[]     NOT OK

USING: io formatting locals kernel math sequences unicode.case ;
IN: balanced-brackets 

:: balanced ( str -- )
   0 :> counter!
   1 :> ok!
   str
   [ dup length 0 > ]
   [ 1 cut swap
     "[" = [ counter 1 + counter! ] [ counter 1 - counter! ] if
     counter 0 < [ 0 ok! ] when
   ]
   while
   drop
   ok 0 =
   [ "NO" ]
   [ counter 0 > [ "NO" ] [ "YES" ] if ]
   if
   print ;

readln
balanced
