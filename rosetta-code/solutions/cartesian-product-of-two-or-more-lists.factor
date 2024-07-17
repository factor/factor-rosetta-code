! Task:
! 
! Show one or more idiomatic ways of generating the Cartesian product of
! two arbitrary lists in your language.
! 
! Demonstrate that your function/method correctly returns:
! 
!     
! 
!         {1, 2} × {3, 4} = {(1, 3), (1, 4), (2, 3), (2, 4)}
! 
! and, in contrast:
! 
!     
! 
!         {3, 4} × {1, 2} = {(3, 1), (3, 2), (4, 1), (4, 2)}
! 
! Also demonstrate, using your function/method, that the product of an
! empty list with any other list is empty.
! 
!     
! 
!         {1, 2} × {} = {}
!         {} × {1, 2} = {}
! 
! For extra credit, show or write a function returning the n-ary product
! of an arbitrary number of lists, each of arbitrary length. Your function
! might, for example, accept a single argument which is itself a list of
! lists, and return the n-ary product of those lists.
! 
! Use your n-ary Cartesian product function to show the following
! products:
! 
!     
! 
!         {1776, 1789} × {7, 12} × {4, 14, 23} × {0, 1}
!         {1, 2, 3} × {30} × {500, 100}
!         {1, 2, 3} × {} × {500, 100}

IN: scratchpad { 1 2 } { 3 4 } cartesian-product .
{ { { 1 3 } { 1 4 } } { { 2 3 } { 2 4 } } }
IN: scratchpad { 3 4 } { 1 2 } cartesian-product .
{ { { 3 1 } { 3 2 } } { { 4 1 } { 4 2 } } }
IN: scratchpad { 1 2 } { } cartesian-product .
{ { } { } }
IN: scratchpad { } { 1 2 } cartesian-product .
{ }
