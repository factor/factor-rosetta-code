! Verify the size of a file called input.txt for a file in the current
! working directory, and another one in the file system root.

"input.txt" file-info size>> .
    1321
"file-does-not-exist.txt" file-info size>>
 "Unix system call ``stat'' failed:"...
