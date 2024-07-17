! Task:
! 
! Delete a file called "input.txt" and delete a directory called "docs".
! 
! This should be done twice: once "here", i.e. in the current working
! directory and once in the filesystem root.

"docs" "/docs" [ delete-tree ] bi@
"input.txt" "/input.txt" [ delete-file ] bi@
