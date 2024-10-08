! Fixed length read/write
! 
! Before terminals, computers commonly used punch card readers or paper
! tape input.
! 
! A common format before these devices were superseded by terminal
! technology was based on the Hollerith code, Hollerith code.
! 
! These input devices handled 80 columns per card and had a limited
! character set, encoded by punching holes in one or more rows of the card
! for each column.
! 
! These devices assumed/demanded a fixed line width of 80 characters,
! newlines were not required (and could not even be encoded in some
! systems).
! 
! Task:
! 
! Write a program to read 80 column fixed length records (no newline
! terminators (but newline characters allowed in the data)) and then write
! out the reverse of each line as fixed length 80 column records.
! 
! Samples here use printable characters, but that is not a given with
! fixed length data. Filenames used are sample.txt, infile.dat,
! outfile.dat.
! 
! Note: There are no newlines, inputs and outputs are fixed at 80 columns,
! no more, no less, space padded. Fixed length data is 8 bit complete. NUL
! bytes of zero are allowed.
! 
! These fixed length formats are still in wide use on mainframes, with JCL
! and with COBOL (which commonly use EBCDIC encoding and not ASCII). Most
! of the large players in day to day financial transactions know all about
! fixed length records and the expression logical record length.
! 
! Sample data:
! 
! To create the sample input file, use an editor that supports fixed
! length records or use a conversion utility. For instance, most GNU/Linux
! versions of dd support blocking and unblocking records with a conversion
! byte size.
! 
!     Line 1...1.........2.........3.........4.........5.........6.........7.........8
!     Line 2
!     Line 3
!     Line 4
! 
!     Line 6
!     Line 7
!          Indented line 8............................................................
!     Line 9                                                                 RT MARGIN
! 
!     prompt$ dd if=sample.txt of=infile.dat cbs=80 conv=block
! 
! will create a fixed length record file of 80 bytes given newline
! delimited text input.
! 
!     prompt$ dd if=infile.dat cbs=80 conv=unblock
! 
! will display a file with 80 byte logical record lengths to standard out
! as standard text with newlines.
! 
! ;Bonus round: Forth systems often include BLOCK words. A block is 1024
! bytes. Source code is stored as 16 lines of 64 characters each (again,
! no newline character or sequence to mark the end of a line).
! 
! Write a program to convert a block file to text (using newlines).
! Trailing spaces should be excluded from the output.
! 
! Also demonstrate how to convert from a normal text file to block form.
! All lines either truncated or padded to 64 characters with no newline
! terminators. The last block filled to be exactly 1024 characters by
! adding blanks if needed. Assume a full range of 8 bit byte values for
! each character.
! 
! The COBOL example uses forth.txt and forth.blk filenames.


