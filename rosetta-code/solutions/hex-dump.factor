! A hex dump is a textual representation of bytes in a file, and hexdump
! is a command-line tool that can dump bytes from a file in a variety of
! formats, including hexadecimal, octal and ASCII.
! 
! hexdump's canonical format displays, on each line:
! 
! -   a byte offset in hexadecimal,
! -   up to 16 bytes in hexadecimal, separated by spaces, with an extra
!     space between the 8th and 9th byte,
! -   the same 16 bytes interpreted as ASCII characters, with non-printing
!     and non-ascii characters replaced with a dot (.), surrounded by
!     pipes (|).
! 
! The last line of output shows a final byte count, also in hexadecimal.
! 
! For example, the string "Rosetta Code is a programming chrestomathy site
! 😀." encoded in UTF-16 (little-endian - the first two bytes are the byte
! order mark), displayed in the canonical format is:
! 
!     00000000  ff fe 52 00 6f 00 73 00  65 00 74 00 74 00 61 00  |..R.o.s.e.t.t.a.|
!     00000010  20 00 43 00 6f 00 64 00  65 00 20 00 69 00 73 00  | .C.o.d.e. .i.s.|
!     00000020  20 00 61 00 20 00 70 00  72 00 6f 00 67 00 72 00  | .a. .p.r.o.g.r.|
!     00000030  61 00 6d 00 6d 00 69 00  6e 00 67 00 20 00 63 00  |a.m.m.i.n.g. .c.|
!     00000040  68 00 72 00 65 00 73 00  74 00 6f 00 6d 00 61 00  |h.r.e.s.t.o.m.a.|
!     00000050  74 00 68 00 79 00 20 00  73 00 69 00 74 00 65 00  |t.h.y. .s.i.t.e.|
!     00000060  20 00 3d d8 00 de 2e 00                           | .=.....|
!     00000068
! 
! Task
! 
! Implement a hexdump-like program that:
! 
! -   outputs in the canonical format,
! -   takes an optional offset in bytes from which to start,
! -   takes an optional length in bytes after which it will stop.
! 
! Demonstrate your implementation by showing the canonical hex dump of the
! example above, plus any other examples you find useful.
! 
! Stretch
! 
! xxd is another command-line tool similar to hexdump. It offers a binary
! mode where bytes are displayed in bits instead of hexadecimal.
! 
! Implement a binary mode. For this task, in binary mode, the example
! above should be displayed like this:
! 
!     00000000  11111111 11111110 01010010 00000000 01101111 00000000  |..R.o.|
!     00000006  01110011 00000000 01100101 00000000 01110100 00000000  |s.e.t.|
!     0000000c  01110100 00000000 01100001 00000000 00100000 00000000  |t.a. .|
!     00000012  01000011 00000000 01101111 00000000 01100100 00000000  |C.o.d.|
!     00000018  01100101 00000000 00100000 00000000 01101001 00000000  |e. .i.|
!     0000001e  01110011 00000000 00100000 00000000 01100001 00000000  |s. .a.|
!     00000024  00100000 00000000 01110000 00000000 01110010 00000000  | .p.r.|
!     0000002a  01101111 00000000 01100111 00000000 01110010 00000000  |o.g.r.|
!     00000030  01100001 00000000 01101101 00000000 01101101 00000000  |a.m.m.|
!     00000036  01101001 00000000 01101110 00000000 01100111 00000000  |i.n.g.|
!     0000003c  00100000 00000000 01100011 00000000 01101000 00000000  | .c.h.|
!     00000042  01110010 00000000 01100101 00000000 01110011 00000000  |r.e.s.|
!     00000048  01110100 00000000 01101111 00000000 01101101 00000000  |t.o.m.|
!     0000004e  01100001 00000000 01110100 00000000 01101000 00000000  |a.t.h.|
!     00000054  01111001 00000000 00100000 00000000 01110011 00000000  |y. .s.|
!     0000005a  01101001 00000000 01110100 00000000 01100101 00000000  |i.t.e.|
!     00000060  00100000 00000000 00111101 11011000 00000000 11011110  | .=...|
!     00000066  00101110 00000000                                      |..|
!     00000068
! 
! Other hexdump/xxd features and a command line interface to your program
! are optional.


