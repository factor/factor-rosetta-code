! Clarification: This task is asking for the position of two bits in the
! binary representation of a positive integer. Some parts of this task
! assume that this is the native representation in the language you are
! working in. Any part of this task which makes assumptions about native
! representation should be treated as a recommendation which is only
! relevant in some contexts. A bit is defined as the exponent in a binary
! polynomial -- an exponent corresponding to a power of 2 which has a
! non-zero multiplier in the summation sequence of powers of two which
! yields the desired positive integer, where the only allowed coefficients
! are 0 and 1.
! 
! Define routines (or operators) lwb and upb that find the first and last
! set bit in a binary value. Implement using a binary search to find the
! location of the particular upper/lower bit.
! 
! Also: Define the reverse routines (or operators) rlwb and rupb that find
! host's positive integers least- and most-significant set bit in a binary
! value expressed in LSB 0 bit numbering, i.e. indexed from the extreme
! right bit.
! 
! Use primarily bit operations, such as and, or, and bit shifting. Avoid
! additions, multiplications and especially avoid divisions.
! 
! Two implementations:
! 
! 1.  For the host word size on the host platform, implement the routine
!     "efficiently" in without looping or recursion.
! 2.  For the extended precision/long word implement the algorithm more
!     generally - maybe as a template, and maybe with looping - so that
!     any bits width for a binary type can be accommodated.
! 
! Test cases:
! 
! 1.  For the host machine word size: Use the powers of 42 up to host's
!     the "natural" word size to calculate the index of the first and last
!     set bit.
! 2.  For the extended precision: Use the powers of 1302 up to the host's
!     next "natural" long host word size to calculate the index of the
!     first and last set bit.
! 3.  Output bit indexes in LSB 0 bit numbering.
! 
! Additionally:
! 
! In a particular language, there maybe (at least) two alternative
! approaches of calculating the required values:
! 
! -   Using an external library.
! -   Using a built-in library.
! 
! If any of these approaches are available, then also note the library or
! built-in name.
! 
! See also:
! 
! -   Find the log base 2 of an N-bit integer in O(lg(N)) operations
! -   80386 Instruction Set - BSF -- Bit Scan Forward
! 
! Category:Radices


