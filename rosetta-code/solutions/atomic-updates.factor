! Task:
! 
! Define a data type consisting of a fixed number of 'buckets', each
! containing a nonnegative integer value, which supports operations to:
! 
! 1.  get the current value of any bucket
! 2.  remove a specified amount from one specified bucket and add it to
!     another, preserving the total of all bucket values, and clamping the
!     transferred amount to ensure the values remain non-negative
! 
! ------------------------------------------------------------------------
! 
! In order to exercise this data type, create one set of buckets, and
! start three concurrent tasks:
! 
! 1.  As often as possible, pick two buckets and make their values closer
!     to equal.
! 2.  As often as possible, pick two buckets and arbitrarily redistribute
!     their values.
! 3.  At whatever rate is convenient, display (by any means) the total
!     value and, optionally, the individual values of each bucket.
! 
! The display task need not be explicit; use of e.g. a debugger or trace
! tool is acceptable provided it is simple to set up to provide the
! display.
! 
! ------------------------------------------------------------------------
! 
! This task is intended as an exercise in atomic operations. The sum of
! the bucket values must be preserved even if the two tasks attempt to
! perform transfers simultaneously, and a straightforward solution is to
! ensure that at any time, only one transfer is actually occurring — that
! the transfer operation is atomic.


