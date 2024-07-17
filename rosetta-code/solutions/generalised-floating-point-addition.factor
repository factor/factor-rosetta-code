! It is possible to implement floating point arithmetic in many different
! ways; though the standard IEEE arithmetic implementation on modern
! hardware usually uses a fixed-width binary implementation (using a total
! of 32 bits for single-precision floats — float in a number of languages
! — and 64 bits for double-precision floats — double) many other schemes
! can be used. For example, the base need not be binary (alternatives
! include decimal, binary-coded decimal, and even balanced ternary) and
! there is no requirement that a fixed number of digits be used.
! 
! Define addition for floating point numbers where the digits are stored
! in an arbitrary base; e.g. the digits can be stored as binary, decimal,
! binary-coded decimal, or even balanced ternary. You should implement the
! code in a generalised form (such as a Template, Module or Mixin etc)
! that permits reusing of the code for different Bases.
! 
! If it is not possible to implement code by providing an implementation
! that uses the syntax of the specific language then:
! 
! -   Note the reason why this is.
! -   Demonstrate that the language still supports the semantics of
!     generalised floating point by implementing the test case using
!     built-in code or a library.
! 
! Test case:
! 
! Define arbitrary precision addition on floating point numbers (e.g.,
! encoding those numbers using Binary Coded Decimal, or using an arbitrary
! precision integer arithmetic library). Calculate the terms for -7 to 21
! in this sequence of calculations:
! 
!   Number   Term calculation                                     Result
!   -------- ---------------------------------------------------- --------
!   -7       12345679e63 × 81 + 1e63                              1e72
!   -6       12345679012345679e54 × 81 + 1e54                     1e72
!   -5       12345679012345679012345679e45 × 81 + 1e45            1e72
!   -4       12345679012345679012345679012345679e36 × 81 + 1e36   1e72
!   etc.     The final calculation will be over 256 digits wide   1e72
! 
!   : Calculate the terms for -7 to 21 in this sequence of calculations
! 
! You will either need to implement multiplication, or perform the
! multiplication by 81 by using repeated additions. The results will
! always be 1e72.
! 
! Bonus
! 
! Make the template (module, class, mixing, etc.) able to successfully
! handle using other bases to perform the above test case. Demonstrate
! using balanced ternary.


