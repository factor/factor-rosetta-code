! Given a zero or positive integer, the task is to generate the next
! largest integer with the same digits^(*1).
! 
! -   Numbers will not be padded to the left with zeroes.
! -   Use all given digits, with their given multiplicity. (If a digit
!     appears twice in the input number, it should appear twice in the
!     result).
! -   If there is no next highest integer return zero.
! 
!     ^(*1) Alternatively phrased as: "Find the smallest integer larger
!     than the (positive or zero) integer N
! 
!         which can be obtained by reordering the (base ten) digits of N".
! 
! Algorithm 1:
! 
! 1.  Generate all the permutations of the digits and sort into numeric
!     order.
! 2.  Find the number in the list.
! 3.  Return the next highest number from the list.
! 
! The above could prove slow and memory hungry for numbers with large
! numbers of digits, but should be easy to reason about its correctness.
! 
! Algorithm 2:
! 
! 1.  Scan right-to-left through the digits of the number until you find a
!     digit with a larger digit somewhere to the right of it.
! 2.  Exchange that digit with the smallest digit on the right that is
!     greater than it.
! 3.  Order the digits to the right of this position, after the swap;
!     lowest-to-highest, left-to-right. (that is, so they form the lowest
!     numerical representation)
! 
! E.g.:
! 
!         n = 12453
!     <scan>
!         12_4_53
!     <swap>
!         12_5_43
!     <order-right>
!         12_5_34
! 
!         return: 12534
! 
! This second algorithm is faster and more memory efficient, but
! implementations may be harder to test.
! 
! One method of testing, (as used in developing the task), is to compare
! results from both algorithms for random numbers generated from a range
! that the first algorithm can handle.
! 
! Task requirements:
! 
! Calculate the next highest integer from the digits of the following
! numbers:
! 
! -   -   0
!     -   9
!     -   12
!     -   21
!     -   12453
!     -   738440
!     -   45072010
!     -   95322020
! 
! Optional stretch goal:
! 
! -   -   9589776899767587796600

USING: formatting grouping kernel math math.combinatorics
math.parser sequences ;

: next-highest ( m -- n )
    number>string dup [ >= ] monotonic?
    [ drop 0 ] [ next-permutation string>number ] if ;

{
    0 9 12 21 12453 738440 45072010 95322020
    9589776899767587796600
}
[ dup next-highest "%d -> %d\n" printf ] each
