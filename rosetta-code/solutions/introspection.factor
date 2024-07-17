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
