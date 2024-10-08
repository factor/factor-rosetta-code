! The aim of this task is to write functions (or create a class if your
! language is Object Oriented and you prefer) for reading and writing
! sequences of bits, most significant bit first. While the output of a
! asciiprint "STRING" is the ASCII byte sequence "S", "T", "R", "I", "N",
! "G", the output of a "print" of the bits sequence 0101011101010 (13
! bits) must be 0101011101010; real I/O is performed always quantized by
! byte (avoiding endianness issues and relying on underlying buffering for
! performance), therefore you must obtain as output the bytes 0101 0111
! 0101 0000 (bold bits are padding bits), i.e. in hexadecimal 57 50.
! 
! As test, you can implement a rough (e.g. don't care about error handling
! or other issues) compression/decompression program for ASCII sequences
! of bytes, i.e. bytes for which the most significant bit is always
! unused, so that you can write seven bits instead of eight (each 8 bytes
! of input, we write 7 bytes of output).
! 
! These bit oriented I/O functions can be used to implement compressors
! and decompressors; e.g. Dynamic and Static Huffman encodings use
! variable length bits sequences, while LZW (see LZW compression) use
! fixed or variable words nine (or more) bits long.
! 
! -   Limits in the maximum number of bits that can be written/read in a
!     single read/write operation are allowed.
! -   Errors handling is not mandatory
! 
! Category:Bitwise operations


