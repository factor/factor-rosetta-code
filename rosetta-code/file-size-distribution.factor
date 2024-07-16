! Task:
! 
! Beginning from the current directory, or optionally from a directory
! specified as a command-line argument, determine how many files there are
! of various sizes in a directory hierarchy.
! 
! My suggestion is to sort by logarithmn of file size, since a few bytes
! here or there, or even a factor of two or three, may not be that
! significant.
! 
! Don't forget that empty files may exist, to serve as a marker.
! 
! Is your file system predominantly devoted to a large number of smaller
! files, or a smaller number of huge files?

USING: accessors assocs formatting io io.directories.search
io.files.types io.pathnames kernel math math.functions
math.statistics namespaces sequences ;

: classify ( m -- n ) [ 0 ] [ log10 >integer 1 + ] if-zero ;

: file-size-histogram ( path -- assoc )
    recursive-directory-entries
    [ type>> +directory+ = ] reject
    [ size>> classify ] map histogram ;

current-directory get file-size-histogram dup
[ "Count of files < 10^%d bytes: %4d\n" printf ] assoc-each
nl values sum "Total files: %d\n" printf
