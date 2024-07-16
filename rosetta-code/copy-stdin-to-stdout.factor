! Create an executable file that copies stdin to stdout, or else a script
! that does so through the invocation of an interpreter at the command
! line.

USING: io kernel ;

[ read1 dup ] [ write1 ] while drop
