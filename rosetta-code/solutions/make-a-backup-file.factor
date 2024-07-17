! Before writing to a file it is often advisable to make a backup of the
! original. Creating such a backup file is however also not without
! pitfalls.
! 
! In this task you should create a backup file from an existing file and
! then write new text to the old file. The following issues should be
! handled:
! 
! -   avoid making a copy of the file but instead rename the original and
!     then write a new file with the original filename.
! -   if a copy needs to be made, please explain why rename is not
!     possible.
! -   keep in mind symlinks, and do not rename or copy the link but the
!     target. (If there is a link foo -> bar/baz, then bar/baz should be
!     renamed to bar/baz.backup and then the new text should be written to
!     bar/baz.)
! -   it is assumed that you have permission to write in the target
!     location, thus permission errors need not be handled.
! -   you may choose the backup filename per preference or given
!     limitations. (It should somehow include the original filename
!     however.)
! -   please try to avoid executing external commands, and especially
!     avoid calling a shell script.
! 
! Some examples on this page assume that the original file already exists.
! They might fail if some user is trying to create a new file.


