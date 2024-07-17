! In computer science, the VList is a persistent data structure that
! combines the fast indexing of arrays with the easy extension of
! cons-based (or singly-linked) linked lists.
! 
! Like arrays, VLists have constant-time lookup on average and are highly
! compact, requiring only O(log n) storage for pointers, allowing them to
! take advantage of locality of reference. Like singly-linked or
! cons-based lists, they are persistent, and elements can be added to or
! removed from the front in constant time. Length can also be found in
! O(log n) time.
! 
! The primary operations of a VList are:
! 
! -   Locate the kth element (O(1) average, O(log n) worst-case)
! -   Add an element to the front of the VList (O(1) average, with an
!     occasional allocation)
! -   Obtain a new array beginning at the second element of an old array
!     (O(1))
! -   Compute the length of the list (O(log n))
! 
! Task
! 
! The task is to demonstrate creation of a VList and how to perform the
! primary operations.
! 
! Category:Encyclopedia Category:Classic CS problems and programs


