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

USING: combinators formatting kernel math random sequences strings ;
IN: rosetta-code.balanced-brackets

: balanced? ( str -- ? )
    0 swap [
        {
            { CHAR: [ [ 1 + t ] }
            { CHAR: ] [ 1 - dup 0 >= ] }
            [ drop t ]
        } case
    ] all? swap zero? and ;

: bracket-pairs ( n -- str )
    [ "[]" ] replicate "" concat-as ;

: balanced-brackets-main ( -- )
    5 bracket-pairs randomize dup balanced? "" "not " ?
    "String \"%s\" is %sbalanced.\n" printf ;

MAIN: balanced-brackets-main

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
