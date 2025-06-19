! Task:
! 
! Get and set the modification time of a file.
! 
! Category:Date and time

"foo.txt" file-info modified>> .

USE: io.files.info.unix

"foo.txt" now 2 hours time+ set-file-modified-time
