! Pascal's triangle is an arithmetic and geometric figure often associated
! with the name of Blaise Pascal, but also studied centuries earlier in
! India, Persia, China and elsewhere.
! 
! Its first few rows look like this:
! 
!     1
!    1 1
!   1 2 1
!  1 3 3 1 
! 
! where each element of each row is either 1 or the sum of the two
! elements right above it.
! 
! For example, the next row of the triangle would be:
! 
!     
! 
!         1 (since the first element of each row doesn't have two elements
!         above it)
!         4 (1 + 3)
!         6 (3 + 3)
!         4 (3 + 1)
!         1 (since the last element of each row doesn't have two elements
!         above it)
! 
! So the triangle now looks like this:
! 
!     1
!    1 1
!   1 2 1
!  1 3 3 1
! 1 4 6 4 1 
! 
! Each row n (starting with row 0 at the top) shows the coefficients of
! the binomial expansion of (x + y)^(n).
! 
! Task:
! 
! Write a function that prints out the first n rows of the triangle (with
! f(1) yielding the row consisting of only the element 1).
! 
! This can be done either by summing elements from the previous rows or
! using a binary coefficient or combination function.
! 
! Behavior for n ≤ 0 does not need to be uniform, but should be noted.
! 
! See also:
! 
! -   Evaluate binomial coefficients

USING: grouping kernel math sequences ;

: (pascal) ( seq -- newseq )
    dup last 0 prefix 0 suffix 2 <clumps> [ sum ] map suffix ;

: pascal ( n -- seq )
    1 - { { 1 } } swap [ (pascal) ] times ;
