! In this task, the job is to create a new empty file called "output.txt"
! of size 0 bytes and an empty directory called "docs". This should be
! done twice: once "here", i.e. in the current working directory and once
! in the filesystem root.

USE: io.directories

"output.txt" "/output.txt" [ touch-file ] bi@
"docs" "/docs" [ make-directory ] bi@
