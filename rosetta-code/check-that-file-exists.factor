! Task:
! 
! Verify that a file called input.txt and a directory called docs exist.
! 
! This should be done twice:
! 
! -   -   once for the current working directory, and
!     -   once for a file and a directory in the filesystem root.
! 
! Optional criteria (May 2015): verify it works with:
! 
! -   -   zero-length files
!     -   an unusual filename: `Abdu'l-Bahá.txt

: print-exists? ( path -- )
    [ write ": " write ] [ exists? "exists." "doesn't exist." ? print ] bi ;

{ "input.txt" "/input.txt" "docs" "/docs" } [ print-exists? ] each
