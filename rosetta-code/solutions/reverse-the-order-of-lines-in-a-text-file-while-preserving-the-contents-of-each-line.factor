! Task:
! 
! -   -   Read an entire (input) file (into memory or buffers).
!     -   Display the lines/records of the entire file in reverse order.
!     -   Show the results here, on this page.
! 
! For the input file, use the following five lines (records):
! 
!  "Diplomacy is the art of                                    ◄■■■■■■ starts in column 3.
!    saying  'Nice Doggy'                                      ◄■■■■■■ starts in column 5,
! until you can find a rock."                                  ◄■■■■■■ starts in column 2,
!                                                              ◄■■■■■■ (a blank line),
!                             --- Will Rodgers                 ◄■■■■■■ starts in column 30.
! 
! You can (or may) assume there are no superfluous trailing blanks, and
! that line four has one blank.
! 
! Also, don't include the rightmost informative comments (◄■■■■■■), as
! they are not meant to be part of the file.
! 
! Reference: Bash tac command

USING: io io.encodings.utf8 io.files sequences ;

"rodgers.txt" utf8 file-lines <reversed> [ print ] each
