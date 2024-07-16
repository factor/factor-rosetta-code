! A set  is a collection of elements, without duplicates and without
! order.
! 
! Task:
! 
! Show each of these set operations:
! 
! -   Set creation
! -   Test m ∈ S -- "m is an element in set S"
! -   A ∪ B -- union; a set of all elements either in set A or in set B.
! -   A ∩ B -- intersection; a set of all elements in both set A and set
!     B.
! -   A ∖ B -- difference; a set of all elements in set A, except those in
!     set B.
! -   A ⊆ B -- subset; true if every element in set A is also in set B.
! -   A = B -- equality; true if every element of set A is in set B and
!     vice versa.
! 
! As an option, show some other set operations.
! 
! (If A ⊆ B, but A ≠ B, then A is called a true or proper subset of B,
! written A ⊂ B or A ⊊ B.)
! 
! As another option, show how to modify a mutable set.
! 
! One might implement a set using an associative array (with set elements
! as array keys and some dummy value as the values).
! 
! One might also implement a set with a binary search tree, or with a hash
! table, or with an ordered array of binary bits (operated on with
! bit-wise binary operators).
! 
! The basic test, m ∈ S, is O(n) with a sequential list of elements, O(log
! n) with a balanced binary search tree, or (O(1) average-case, O(n) worst
! case) with a hash table.

( scratchpad ) USE: sets
( scratchpad ) HS{ 2 5 4 3 } HS{ 5 6 7 } union .
HS{ 2 3 4 5 6 7 }
( scratchpad ) HS{ 2 5 4 3 } HS{ 5 6 7 } intersect .
HS{ 5 }
( scratchpad ) HS{ 2 5 4 3 } HS{ 5 6 7 } diff .
HS{ 2 3 4 }
( scratchpad ) HS{ 2 5 4 3 } HS{ 5 6 7 } subset? .
f
( scratchpad ) HS{ 5 6 } HS{ 5 6 7 } subset? .
t
( scratchpad ) HS{ 5 6 } HS{ 5 6 7 } set= .
f
( scratchpad ) HS{ 6 5 7 } HS{ 5 6 7 } set= .
t
