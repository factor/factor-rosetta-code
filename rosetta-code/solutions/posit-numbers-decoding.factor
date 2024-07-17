! Posit is a quantization of the real projective line proposed by John
! Gustafson in 2015. It is claimed to be an improvement over IEEE 754.
! 
! The purpose of this task is to write a program capable of decoding a
! posit number. You will use the example provided by Gustafson in his
! paper : 0b0000110111011101, representing a 16-bit long real number with
! three bits for the exponent. Once decoded, you should obtain either the
! fraction 477/134217728 or the floating point value 3.55393E−6.
! 
! Jeff Johnson from Facebook research, described posit numbers as such:
! 
!     A more efficient representation for tapered floating points is the
!     recent posit format by Gustafson. It has no explicit size field; the
!     exponent is encoded using a Golomb-Rice prefix-free code, with the
!     exponent e encoded as a Golomb-Rice quotient and remainder (q, r)
!     with q in unary and r in binary (in posit terminology, q is the
!     regime). Remainder encoding size is defined by the exponent scale s,
!     where 2^(s) is the Golomb-Rice divisor. Any space not used by the
!     exponent encoding is used by the significand, which unlike IEEE 754
!     always has a leading 1; gradual underflow (and overflow) is handled
!     by tapering. A posit number system is characterized by (N, s), where
!     N is the word length in bits and s is the exponent scale. The
!     minimum and maximum positive finite numbers in (N, s) are
!     f_(min) = 2^(−(N − 2)2^(s)) and f_(max) = 2^((N − 2)2^(s)). The
!     number line is represented much as the projective reals, with a
!     single point at ±∞ bounding −f_(max) and f_(max). ±∞ and 0 have
!     special encodings; there is no NaN. The number system allows any
!     choice of N ≥ 3 and 0 ≤ s ≤ N − 3.
!     s controls the dynamic range achievable; e.g., 8-bit (8, 5)-posit
!     f_(max) = 2¹⁹² is larger than f_(max) in float32. (8, 0) and (8, 1)
!     are more reasonable values to choose for 8-bit floating point
!     representations, with f_(max) of 64 and 4096 accordingly. Precision
!     is maximized in the range ±[2^(−(s + 1)), 2^(s + 1)) with N − 3 − s
!     significand fraction bits, tapering to no fraction bits at ±f_(max).
!     — Jeff Johnson, Rethinking floating point for deep learning,
!     Facebook research.


