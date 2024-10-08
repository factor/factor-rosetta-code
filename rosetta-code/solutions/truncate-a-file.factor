! Task:
! 
! Truncate a file to a specific length. This should be implemented as a
! routine that takes two parameters: the filename and the required file
! length (in bytes).
! 
! Truncation can be achieved using system or library calls intended for
! such a task, if such methods exist, or by creating a temporary file of a
! reduced size and renaming it, after first deleting the original file, if
! no other method is available. The file may contain non human readable
! binary data in an unspecified format, so the routine should be "binary
! safe", leaving the contents of the untruncated part of the file
! unchanged.
! 
! If the specified filename does not exist, or the provided length is not
! less than the current file length, then the routine should raise an
! appropriate error condition.
! 
! On some systems, the provided file truncation facilities might not
! change the file or may extend the file, if the specified length is
! greater than the current length of the file.
! 
! This task permits the use of such facilities. However, such behaviour
! should be noted, or optionally a warning message relating to an non
! change or increase in file size may be implemented.
! 
! Category:File System Operations


