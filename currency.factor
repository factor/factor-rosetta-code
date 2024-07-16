! Task:
! 
! Show how to represent currency in a simple example, using a data type
! that represent exact values of dollars and cents.
! 
! Note:
! 
! The IEEE 754 binary floating point representations of numbers like 2.86
! and .0765 are not exact.
! 
! For this example, data will be two items with prices in dollars and
! cents, a quantity for each, and a tax rate.
! 
! Use the values:
! 
! -   -   4000000000000000 hamburgers at $5.50 each (four quadrillion
!         burgers)
!     -   2 milkshakes at $2.86 each, and
!     -   a tax rate of 7.65%.
! 
! (That number of hamburgers is a 4 with 15 zeros after it. The number is
! contrived to exclude naïve task solutions using 64 bit floating point
! types.)
! 
! Compute and output (show results on this page):
! 
! -   -   the total price before tax
!     -   the tax
!     -   the total with tax
! 
! The tax value must be computed by rounding to the nearest whole cent and
! this exact value must be added to the total price before tax.
! 
! The output must show dollars and cents with a decimal point.
! 
! The three results displayed should be:
! 
! -   -   22000000000000005.72
!     -   1683000000000000.44
!     -   23683000000000006.16
! 
! Dollar signs and thousands separators are optional.

USING: combinators.smart io kernel math math.functions money ;

10 15 ^ 4 * 5+50/100 * ! hamburger subtotal
2 2+86/100 *           ! milkshake subtotal
+                      ! subtotal
dup DECIMAL: 0.0765 *  ! tax
[ + ] preserving       ! total

"Total before tax: " write [ money. ] 2dip
"Tax: " write [ money. ] dip
"Total with tax: " write money.
