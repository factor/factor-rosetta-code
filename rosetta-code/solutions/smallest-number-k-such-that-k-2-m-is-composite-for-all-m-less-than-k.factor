! Generate the sequence of numbers a(k), where each k is the smallest
! positive integer such that k + 2^(m) is composite for every positive
! integer m less than k.
! 
! For example
! 
! Suppose k == 7; test m == 1 through m == 6. If any are prime, the test
! fails.
! 
! Is 7 + 2¹ (9) prime? False
! 
! Is 7 + 2² (11) prime? True
! 
! So 7 is not an element of this sequence.
! 
! It is only necessary to test odd natural numbers k. An even number, plus
! any positive integer power of 2 is always composite.
! 
! Task
! 
! Find and display, here on this page, the first 5 elements of this
! sequence.
! 
! See also
! 
! OEIS:A033919 - Odd k for which k+2^m is composite for all m < k


