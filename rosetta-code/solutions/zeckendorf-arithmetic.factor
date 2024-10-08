! This task is a total immersion zeckendorf task; using decimal numbers
! will attract serious disapprobation.
! 
! The task is to implement addition, subtraction, multiplication, and
! division using Zeckendorf number representation. Optionally provide
! decrement, increment and comparitive operation functions.
! 
! Addition
! 
! Like binary 1 + 1 = 10, note carry 1 left. There the similarity ends.
! 10 + 10 = 101, note carry 1 left and 1 right. 100 + 100 = 1001, note
! carry 1 left and 2 right, this is the general case.
! 
! Occurrences of 11 must be changed to 100. Occurrences of 111 may be
! changed from the right by replacing 11 with 100, or from the left
! converting 111 to 100 + 100;
! 
! Subtraction
! 
! 10 - 1 = 1. The general rule is borrow 1 right carry 1 left. eg:
! 
!       abcde
!       10100 -
!        1000
!       _____
!         100  borrow 1 from a leaves 100
!       + 100  add the carry
!       _____
!        1001
! 
! A larger example:
! 
!       abcdef
!       100100 -
!         1000
!       ______
!       1*0100 borrow 1 from b
!        + 100 add the carry
!       ______
!       1*1001
! 
!     Sadly we borrowed 1 from b which didn't have it to lend. So now b borrows from a:
! 
!         1001
!       + 1000 add the carry
!         ____
!        10100
! 
! Multiplication
! 
! Here you teach your computer its zeckendorf tables. eg. 101 * 1001:
! 
!       a = 1 * 101 = 101
!       b = 10 * 101 = a + a = 10000
!       c = 100 * 101 = b + a = 10101
!       d = 1000 * 101 = c + b = 101010
! 
!       1001 = d + a therefore 101 * 1001 =
! 
!       101010
!        + 101
!       ______
!      1000100
! 
! Division
! 
! Lets try 1000101 divided by 101, so we can use the same table used for
! multiplication.
! 
!       1000101 -
!        101010 subtract d (1000 * 101)
!       _______
!          1000 -
!           101 b and c are too large to subtract, so subtract a
!          ____
!             1 so 1000101 divided by 101 is d + a (1001) remainder 1
! 
! Efficient algorithms for Zeckendorf arithmetic is interesting. The
! sections on addition and subtraction are particularly relevant for this
! task.


