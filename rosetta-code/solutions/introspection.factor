! Task:
! 
! -   verify the version/revision of your currently running
!     (compiler/interpreter/byte-compiler/runtime environment/whatever
!     your language uses) and exit if it is too old.
! -   check whether the variable "bloop" exists and whether the
!     math-function "abs()" is available and if yes compute abs(bloop).
! 
! Extra credit:
! 
! -   Report the number of integer variables in global scope, and their
!     sum.

: if-older ( n true false -- )
    [ build > ] 2dip if ; inline

: when-older ( n true -- )
    [ ] if-older ; inline
: unless-older ( n false -- )
    [ [ ] ] dip if-older ; inline

900 [ "Your version of Factor is too old." print 1 exit ] when-older

"bloop" search [
    get [
        "abs" search [ execute( n -- n' ) ] when*
    ] [ 0 ] if*
] [ 0 ] if*

USING: assocs formatting kernel math namespaces ;

0 0
global [
    nip dup integer? [ + [ 1 + ] dip ] [ drop ] if
] assoc-each
"There are %d integer variables, the sum is %d\n" printf
