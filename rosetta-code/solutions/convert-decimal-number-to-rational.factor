! The task is to write a program to transform a decimal number into a
! fraction in lowest terms.
! 
! It is not always possible to do this exactly. For instance, while
! rational numbers can be converted to decimal representation, some of
! them need an infinite number of digits to be represented exactly in
! decimal form. Namely, repeating decimals such as 1/3 = 0.333...
! 
! Because of this, the following fractions cannot be obtained (reliably)
! unless the language has some way of representing repeating decimals:
! 
! -   67 / 74 = 0.9(054) = 0.9054054...
! -   14 / 27 = 0.(518) = 0.518518...
! 
! Acceptable output:
! 
! -   0.9054054 → 4527027 / 5000000
! -   0.518518 → 259259 / 500000
! 
! Finite decimals are of course no problem:
! 
! -   0.75 → 3 / 4

USING: kernel math.floating-point prettyprint ;

0.9054054 0.518518 0.75 [ double>ratio . ] tri@
