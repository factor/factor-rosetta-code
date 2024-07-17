! The Engel expansion of a positive real number x is the unique
! non-decreasing sequence of positive integers { a₁, a₂, a₃ ... } such
! that
! 
!     x = 1 / a¹ + 1 / a¹a² + 1 / a¹a²a³ ...
! 
! In other words, each term is the reciprocal of the cumulative product of
! the expansion and x is the sum of those terms.
! 
! Rational numbers have a finite Engel expansion, while irrational numbers
! have an infinite Engel expansion.
! 
! Tiny amounts of imprecision can cause wild variation from actual values
! as the (reciprocal) terms grow smaller. It can be quite challenging to
! maintain precision in later terms.
! 
! Task
! 
! -   Write routines (functions, procedures, whatever it may be called in
!     your language) to convert a rational number to an Engel expansion
!     representation and from an Engle expansion to a rational number.
! -   Demonstrate converting some rational numbers to an Engel expansion
!     and back.
! 
! Test it with at least the following rational approximations of:
! 
! -   𝜋 - 3.14159265358979
! -   𝑒 - 2.71828182845904
! -   √2 - 1.414213562373095
! 
! Stretch
! 
! -   If your language supports high precision rational numbers, do the
!     same with at least:
! 
! -   𝜋 -
!     3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211
! -   𝑒 -
!     2.71828182845904523536028747135266249775724709369995957496696762772407663035354759457138217852516642743
! -   √2 -
!     1.4142135623730950488016887242096980785696718753769480731766797379907324784621070388503875343276415727350138462309122970249248360558507372126441214970999358314132226659275055927558
! 
! There almost definitely will be some imprecision in the later terms.
! Feel free to limit the display of the expansion to the first 30 terms.
! 
! See also
! * Wikipedia: Engel expansion
! * OEIS:A006784 - Engel expansion of Pi
! * OEIS:A028310 - Engel expansion of 𝑒
! * OEIS:A028254 - Engel expansion of sqrt(2)


