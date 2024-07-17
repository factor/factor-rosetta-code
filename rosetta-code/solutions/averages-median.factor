! Task
! 
! Write a program to find the median value of a vector of floating-point
! numbers.
! 
! The program need not handle the case where the vector is empty, but must
! handle the case where there are an even number of elements. In that
! case, return the average of the two middle values.
! 
! There are several approaches to this. One is to sort the elements, and
! then pick the element(s) in the middle.
! 
! Sorting would take at least O(n logn). Another approach would be to
! build a priority queue from the elements, and then extract half of the
! elements to get to the middle element(s). This would also take
! O(n logn). The best solution is to use the selection algorithm to find
! the median in O(n) time.
! 
! Quickselect_algorithm

USING: arrays kernel locals math math.functions random sequences ;
IN: median

: pivot ( seq -- pivot ) random ;

: split ( seq pivot -- {lt,eq,gt} )
  [ [ < ] curry partition ] keep
  [ = ] curry partition
  3array ;

DEFER: nth-in-order
:: nth-in-order-recur ( seq ind -- elt )
  seq dup pivot split
  dup [ length ] map  0 [ + ] accumulate nip
  dup [ ind <= [ 1 ] [ 0 ] if ] map sum 1 -
  [ swap nth ] curry bi@
  ind swap -
  nth-in-order ;

: nth-in-order ( seq ind -- elt )
  dup 0 =
  [ drop first ]
  [ nth-in-order-recur ]
  if ;

: median ( seq -- median )
  dup length 1 - 2 / floor nth-in-order ;
