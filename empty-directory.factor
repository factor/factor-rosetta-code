! Starting with a path to some directory, determine whether the directory
! is empty.
! 
! An empty directory contains no files nor subdirectories. With Unix or
! Windows systems, every directory contains an entry for “.” and almost
! every directory contains “..” (except for a root directory); an empty
! directory contains no other entries.

USE: io.directories
: empty-directory? ( path -- ? ) directory-entries empty? ;
