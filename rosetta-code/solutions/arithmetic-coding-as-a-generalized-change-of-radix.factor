! Arithmetic coding is a form of entropy encoding used in lossless data
! compression. Normally, a string of characters such as the words "hello
! there" is represented using a fixed number of bits per character, as in
! the ASCII code. When a string is converted to arithmetic encoding,
! frequently used characters will be stored with fewer bits and
! not-so-frequently occurring characters will be stored with more bits,
! resulting in fewer bits used in total. Arithmetic coding differs from
! other forms of entropy encoding, such as Huffman coding, in that rather
! than separating the input into component symbols and replacing each with
! a code, arithmetic coding encodes the entire message into a single
! number.
! 
! Task
! 
! Create a program which implements the arithmetic coding as a generalized
! change of radix.
! 
! Show the results, in base 10, for all the following strings:
! 
! -   "DABDDB"
! -   "DABDDBBDDBA"
! -   "ABRACADABRA"
! -   "TOBEORNOTTOBEORTOBEORNOT"
! 
! Verify the implementation by decoding the results back into strings and
! checking for equality with the given strings.


