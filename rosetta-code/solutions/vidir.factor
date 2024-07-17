! Recreate the vidir utility in your favorite programming language.
! 
! Vidir is a bulk file renaming utility included in the moreutils package
! available for Linux and Linux-like operating systems.
! 
! Basic operation involves:
! 
! -   Reading the file names from a directory into a text file.
! -   Editing the text file with a third party editor to make bulk changes
!     to file names (modify,delete).
! -   Using the edited text file to then apply the desired changes to the
!     file system.
! 
! In general, the filenames are typically written to the text file, one to
! a line with an identifying label (a unique integer in the originals
! case). The text file is edited as desired; file names changed, files
! moved, files removed, files added. Then the edited text file is used to
! apply the changes to the file system.
! 
! It is not required to support multiple operating systems. Make a note of
! which one(s) are supported.
! 
! There are many possible ways to enhance the utility but that is the
! basic functionality.
! 
! Some possible enhancements:
! 
! -   Operate on directories other than the current directory.
! -   Recursive directory search.
! -   File input filtering.
! -   File/Directory permissions detection.
! -   Allow creation of files / directories.
! -   Verbose operation.
! -   Text editor selectable from the command line.
! -   First party text editing.
! -   Support multiple operating systems
! 
! At a minimum support file name modification and file removal in the
! current directory. Add as many enhancements as desired.
! 
! See also
! 
! * Linux.com article covering moreutils / vidir


