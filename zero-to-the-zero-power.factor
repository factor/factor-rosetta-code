! Some computer programming languages are not exactly consistent (with
! other computer programming languages)
! 
! when raising zero to the zeroth power: 0⁰
! 
! Task:
! 
! Show the results of raising zero to the zeroth power.
! 
! If your computer language objects to 0**0 or 0^0 at compile time, you
! may also try something like:
! 
!            x = 0
!            y = 0
!            z = x**y
!            say  'z='  z
! 
! Show the result here.
! 
! And of course use any symbols or notation that is supported in your
! computer programming language for exponentiation.
! 
! See also:
! 
! -   The Wiki entry: Zero to the power of zero.
! -   The Wiki entry: Zero to the power of zero: History.
! -   The MathWorld™ entry: exponent laws.
!     -   Also, in the above MathWorld™ entry, see formula (9): x⁰ = 1.
! -   The OEIS entry: The special case of zero to the zeroth power

USING: math.functions.private ; ! ^complex
0 0 ^
C{ 0 0 } C{ 0 0 } ^complex
