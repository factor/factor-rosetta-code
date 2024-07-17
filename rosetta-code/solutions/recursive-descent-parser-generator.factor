! Write a recursive descent parser generator that takes a description of a
! grammar as input and outputs the source code for a parser in the same
! language as the generator. (So a generator written in C++ would output
! C++ source code for the parser.) You can assume that all of the rules
! have been preprocessed into a form suitable for the construction of a
! recursive descent parser. Check the following links for more details.
! 
! -   http://www.cs.engr.uky.edu/~lewis/essays/compilers/rec-des.html
! -   http://www.engr.mun.ca/~theo/Misc/exp_parsing.htm
! 
! Use the parser generator and a grammar file to build a parser that takes
! an arithmetic expression and turns it in to three address code. The
! resulting parser should take this (or something similar) as input:
! 
!     (one + two) * three - four * five
! 
! And generate this (or something similar) as output:
! 
!     _0001 = one + two
!     _0002 = _0001 * three
!     _0003 = four * five
!     _0004 = _0002 - _0003


