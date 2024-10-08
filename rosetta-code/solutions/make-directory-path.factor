! Task:
! 
! Create a directory and any missing parents.
! 
! This task is named after the posix mkdir -p command, and several
! libraries which implement the same behavior.
! 
! Please implement a function of a single path string (for example
! ./path/to/dir) which has the above side-effect. If the directory already
! exists, return successfully. Ideally implementations will work equally
! well cross-platform (on windows, linux, and OS X).
! 
! It's likely that your language implements such a function as part of its
! standard library. If so, please also show how such a function would be
! implemented.

USE: io.directories
"path/to/dir" make-directories
