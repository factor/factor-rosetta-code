! A tree sort is a sort algorithm that builds a binary search tree from
! the keys to be sorted, and then traverses the tree (in-order) so that
! the keys come out in sorted order. Its typical use is when sorting the
! elements of a stream from a file. Several other sorts would have to load
! the elements to a temporary data structure, whereas in a tree sort the
! act of loading the input into a data structure is sorting it.
! 
! The tree sort is considered by some to be the faster method to sort a
! linked list, followed by Quicksort and Mergesort:
! 
! -   A Comparative Study of Linked List Sorting Algorithms by Ching-Kuang
!     Shene
! 
! Sediment sort, bubble sort, selection sort perform very badly.
! 
! -   http://www.martinbroadhurst.com/sorting-a-linked-list-by-turning-it-into-a-binary-tree.html
! 
! Task:
! 
! First, construct a doubly linked list (unsorted).
! 
! Then construct a tree in situ: use the prev and next of that list as
! left and right tree pointers.
! 
! Then traverse the tree, in order, and recreate a doubly linked list,
! again in situ, but of course now in sorted order.
! 
! Category:Sorting


