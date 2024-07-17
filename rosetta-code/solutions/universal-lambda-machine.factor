! One of the foundational mathematical constructs behind computer science
! is the universal machine, as a machine that can emulate the behaviour of
! any other machine, given a description of it. Alan Turing introduced the
! idea of a universal Turing machine in 1936–1937.
! 
! The lambda calculus is an even older, and in many ways simpler, model of
! computation. That simplicity is reflected in the Binary Lambda Calculus
! (BLC for short), which describes lambda terms with binary tokens 00 for
! lambda, 01 for application, and 1^n0 for variable n (which binds to the
! n'th enclosing lambda).
! 
! BLC also specifies a way to represent bits and lists as lambda terms,
! which provides the following I/O convention:
! 
! The lambda universal machine parses the binary encoding of a lambda term
! from the start of its input, applies that term to the remainder of
! input, and outputs the result interpreted as a list of bits or bytes.
! 
! BLC as a programming language has its own entry on Rosetta Code at
! https://rosettacode.org/wiki/Category:Binary_Lambda_Calculus which links
! to more detailed descriptions of the language.
! 
! Task:
! 
! Simulate the universal lambda machine Or in other words, write a BLC
! interpreter. Support either bit-mode or byte-mode, or preferably both
! (with byte-mode as the default, and a -b command line flag for bit
! mode).
! 
! To test your universal lambda machine, you should execute the following
! BLC programs.
! 
! For bit-mode, one should reproduce the BLC Rosetta Code solutions of
! 
! -   https://rosettacode.org/wiki/Quine#Binary_Lambda_Calculus
! -   https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Binary_Lambda_Calculus
!     (
! 
! producing as much output as possible before running out of stack/heap
! space).
! 
! -   https://rosettacode.org/wiki/100_doors#Binary_Lambda_Calculus
! 
! Also, the 342 bit program
! 
!     010100011010000000011000010110011110000010010111110111100001010110000000011000011111000000101111110110010111111011001011110100111010111100010000001011100101010001101000000000010110000101011111101111100000010101111011111011111100001011000000101111111010110111000000111111000010110111101110011110100000010110000011011000100000101111000111001110
! 
! should produce output
! 
!     11010
! 
! For byte-mode, one should reproduce the BLC Rosetta Code solutions of
! 
! -   https://rosettacode.org/wiki/Hilbert_curve#Binary_Lambda_Calculus
! -   https://rosettacode.org/wiki/Execute_Brain****#Binary_Lambda_Calculus
! 
! When run on the 186-byte binary file
! https://www.ioccc.org/2012/tromp/tromp/symbolic.Blc followed by input
! 010000011100111001110100000011100111010, it should output
! 
!     (\a \b a (a (a b))) (\a \b a (a b))
!     \a (\b \c b (b c)) ((\b \c b (b c)) ((\b \c b (b c)) a))
!     \a \b (\c \d c (c d)) ((\c \d c (c d)) a) ((\c \d c (c d)) ((\c \d c (c d)) a) b)
!     \a \b (\c (\d \e d (d e)) a ((\d \e d (d e)) a c)) ((\c \d c (c d)) ((\c \d c (c d)) a) b)
!     \a \b (\c \d c (c d)) a ((\c \d c (c d)) a ((\c \d c (c d)) ((\c \d c (c d)) a) b))
!     \a \b (\c a (a c)) ((\c \d c (c d)) a ((\c \d c (c d)) ((\c \d c (c d)) a) b))
!     \a \b a (a ((\c \d c (c d)) a ((\c \d c (c d)) ((\c \d c (c d)) a) b)))
!     \a \b a (a ((\c a (a c)) ((\c \d c (c d)) ((\c \d c (c d)) a) b)))
!     \a \b a (a (a (a ((\c \d c (c d)) ((\c \d c (c d)) a) b))))
!     \a \b a (a (a (a ((\c (\d \e d (d e)) a ((\d \e d (d e)) a c)) b))))
!     \a \b a (a (a (a ((\c \d c (c d)) a ((\c \d c (c d)) a b)))))
!     \a \b a (a (a (a ((\c a (a c)) ((\c \d c (c d)) a b)))))
!     \a \b a (a (a (a (a (a ((\c \d c (c d)) a b))))))
!     \a \b a (a (a (a (a (a ((\c a (a c)) b))))))
!     \a \b a (a (a (a (a (a (a (a b)))))))


