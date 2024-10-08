! Some languages support one or more integer types of the underlying
! processor.
! 
! This integer types have fixed size; usually 8-bit, 16-bit, 32-bit, or
! 64-bit.
! 
! The integers supported by such a type can be signed or unsigned.
! 
! Arithmetic for machine level integers can often be done by single CPU
! instructions.
! 
! This allows high performance and is the main reason to support machine
! level integers.
! 
! Definition:
! 
! An integer overflow happens when the result of a computation does not
! fit into the fixed size integer. The result can be too small or too big
! to be representable in the fixed size integer.
! 
! Task:
! 
! When a language has fixed size integer types, create a program that does
! arithmetic computations for the fixed size integers of the language.
! 
! These computations must be done such that the result would overflow.
! 
! The program should demonstrate what the following expressions do.
! 
! For 32-bit signed integers:
! 
!     
! 
!         {|class="wikitable"
! 
! !Expression !Result that does not fit into a 32-bit signed integer |- |
! -(-2147483647-1) | 2147483648 |- | 2000000000 + 2000000000 | 4000000000
! |- | -2147483647 - 2147483647 | -4294967294 |- | 46341 * 46341 |
! 2147488281 |- | (-2147483647-1) / -1 | 2147483648 |}
! 
! For 64-bit signed integers:
! 
!     
! 
!         {|class="wikitable"
! 
! !Expression !Result that does not fit into a 64-bit signed integer |- |
! -(-9223372036854775807-1) | 9223372036854775808 |- |
! 5000000000000000000+5000000000000000000 | 10000000000000000000 |- |
! -9223372036854775807 - 9223372036854775807 | -18446744073709551614 |- |
! 3037000500 * 3037000500 | 9223372037000250000 |- |
! (-9223372036854775807-1) / -1 | 9223372036854775808 |}
! 
! For 32-bit unsigned integers:
! 
!     
! 
!         {|class="wikitable"
! 
! !Expression !Result that does not fit into a 32-bit unsigned integer |-
! | -4294967295 | -4294967295 |- | 3000000000 + 3000000000 | 6000000000 |-
! | 2147483647 - 4294967295 | -2147483648 |- | 65537 * 65537 | 4295098369
! |}
! 
! For 64-bit unsigned integers:
! 
!     
! 
!         {|class="wikitable"
! 
! !Expression !Result that does not fit into a 64-bit unsigned integer |-
! | -18446744073709551615 | -18446744073709551615 |- |
! 10000000000000000000 + 10000000000000000000 | 20000000000000000000 |- |
! 9223372036854775807 - 18446744073709551615 | -9223372036854775808 |- |
! 4294967296 * 4294967296 | 18446744073709551616 |}
! 
! Notes:
! 
! -   -   When the integer overflow does trigger an exception show how the
!         exception is caught.
!     -   When the integer overflow produces some value, print it.
!     -   It should be explicitly noted when an integer overflow is not
!         recognized, the program continues with wrong results.
!     -   This should be done for signed and unsigned integers of various
!         sizes supported by the computer programming language.
!     -   When a language has no fixed size integer type, or when no
!         integer overflow can occur for other reasons, this should be
!         noted.
!     -   It is okay to mention, when a language supports unlimited
!         precision integers, but this task is NOT the place to
!         demonstrate the
! 
! capabilities of unlimited precision integers.


