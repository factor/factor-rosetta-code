! A complex number is a number which can be written as: a + b × i
! (sometimes shown as: b + a × i where a and bare real numbers, and i is √
! 
! Typically, complex numbers are represented as a pair of real numbers
! called the "imaginary part" and "real part", where the imaginary part is
! the number to be multiplied by i.
! 
! Task:
! 
! -   Show addition, multiplication, negation, and inversion of complex
!     numbers in separate functions. (Subtraction and division operations
!     can be made with pairs of these operations.)
! -   Print the results for each operation tested.
! -   Optional: Show complex conjugation.
! 
! By definition, the complex conjugate of a + bi is a − bi
! 
! Some languages have complex number libraries available. If your language
! does, show the operations. If your language does not, also show the
! definition of this type.

USING: combinators kernel math math.functions prettyprint ;

C{ 1 2 } C{ 0.9 -2.78 } {
    [ + . ]             ! addition
    [ - . ]             ! subtraction
    [ * . ]             ! multiplication
    [ / . ]             ! division
    [ ^ . ]             ! power
} 2cleave

C{ 1 2 } {
    [ neg . ]           ! negation
    [ recip . ]         ! multiplicative inverse
    [ conjugate . ]     ! complex conjugate
    [ sin . ]           ! sine
    [ log . ]           ! natural logarithm
    [ sqrt . ]          ! square root
} cleave
