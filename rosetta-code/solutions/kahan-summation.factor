! :;Note to language implementers:
! 
!     This task touches on the details of number representation that is
!     often hidden for convenience in many programming languages. You may
!     need to understand the difference between precision in calculations
!     and precision in presenting answers for example; or understand
!     decimal arithmetic as distinct from the usual binary based floating
!     point schemes used in many languages.
! 
! The Kahan summation algorithm is a method of summing a series of numbers
! represented in a limited precision in a way that minimises the loss of
! precision in the result.
! 
! (The Kahan summation algorithm is also known as the summation with carry
! algorithm.)
! 
! The task is to follow the previously linked Wikipedia articles algorithm
! and its worked example by:
! 
! 1.  Do all arithmetic in decimal to a precision of six digits.
! 2.  Write a function/method/procedure/subroutine/... to perform Kahan
!     summation on an ordered collection of numbers, (such as a list of
!     numbers).
! 3.  Create the three numbers a, b, c equal to 10000.0, 3.14159, 2.71828
!     respectively.
! 4.  Show that the simple left-to-right summation, equivalent to
!     (a + b) + c gives an answer of 10005.8
! 5.  Show that the Kahan function applied to the sequence of values
!     a, b, c results in the more precise answer of 10005.9
! 
! If your language does not have six digit decimal point, but does have
! some fixed precision floating point number system then state this and
! try this alternative task using floating point numbers:
! 
! -   Follow the same steps as for the main task description above but for
!     the numbers a, b, c use the floating-point values
!     1.0, epsilon, -epsilon respectively where epsilon is determined by
!     its final value after the following:
! 
!     epsilon = 1.0
!     while 1.0 + epsilon != 1.0:
!         epsilon = epsilon / 2.0
! 
! The above should ensure that (a + b) + c != 1.0 whilst their Kahan sum
! does equal 1.0 . Only if this is not the case are you then free to find
! three values with this property of your own.
! 
! If your language has decimals, but not six digits of precision then you
! may follow the outline given in
! Kahan_summation#Python:_Arbitrary_precision_Decimal which uses ideas
! from the floating point case above.
! 
! In general:
! 
! -   Show all output on this page.
! -   If the floating point calculations are used then answers may depend
!     on the hardware platform or compiler/interpreter tool-chain used for
!     a language.
! -   Slight deviations from the task description should be explained and
!     the the subsequent difference in output explained.
! -   All examples should have constants chosen to clearly show the
!     benefit of Kahan summing!

USING: io kernel literals math math.extras prettyprint sequences ;

CONSTANT: epsilon $[ 1.0 [ dup 1 + 1 number= ] [ 2 /f ] until ]

${ 1.0 epsilon dup neg }
[ "Left associative: " write sum . ]
[ "Kahan summation:  " write kahan-sum . ] bi
"Epsilon:          " write epsilon .
