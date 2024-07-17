! Given a finite alphabet, we can lexicographically order all strings in
! the alphabet. If two strings have different lengths, then pad the
! shorter string on the right with the smallest letter. For example, we
! have 01 > 001, but 01 = 010. As we see, this order is a total preorder,
! but not a total order, since it identifies different strings.
! 
! A Lyndon word is a non-empty string that is strictly lower in
! lexicographic order than all its circular rotations. In particular, if a
! string is equal to a circular rotation, then it is not a Lyndon word.
! For example, since 0101 = 0101 (rotation by 2), it is not a Lyndon word.
! 
! The first Lyndon words on the binary alphabet {0, 1} are:
! 
!     0, 1, 01, 001, 011, 0001, 0011, 0111, 00001, 00011, 00101, 00111,
!     01011, 01111, ...
!     
! 
! Task: Given a positive number n and an ordered list of alphabet, list
! all Lyndon words of length at most n, in the lexicographic order.
! 
! Duval (1988) provides an efficient algorithm. If w is one of the words
! in the sequence, then the next word after w can be found by the
! following steps:
! 
! 1.  Repeat w and truncate it to a new word x of length exactly n.
! 2.  As long as the final symbol of x is the last symbol in the sorted
!     ordering of the alphabet, remove it, producing a shorter word.
! 3.  Replace the final remaining symbol of x by its successor in the
!     sorted ordering of the alphabet.
! 
! For example, suppose we have generated the binary Lyndon words of length
! up to 7, and we have generated up to w = 00111, then the steps are:
! 
! 1.  Repeat and truncate to get $x = 00111\;00\cancel{111}$
! 2.  Since the last symbol is 0, it is not the final symbol.
! 3.  Increment the last symbol to obtain x = 00111 01.


