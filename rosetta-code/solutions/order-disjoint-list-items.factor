! Given M as a list of items and another list N of items chosen from M,
! create M' as a list with the first occurrences of items from N sorted to
! be in one of the set of indices of their original occurrence in M but in
! the order given by their order in N.
! 
! That is, items in N are taken from M without replacement, then the
! corresponding positions in M' are filled by successive items from N.
! 
! For example:
!     if M is 'the cat sat on the mat'
!     And N is 'mat cat'
!     Then the result M' is 'the mat sat on the cat'.
! 
! The words not in N are left in their original positions.
! 
! If there are duplications then only the first instances in M up to as
! many as are mentioned in N are potentially re-ordered.
! 
! For example:
!     M = 'A B C A B C A B C'
!     N = 'C A C A'
! 
! Is ordered as:
! 
!     M' = 'C B A C B A A B C'
! 
! Show the output, here, for at least the following inputs:
! 
!     Data M: 'the cat sat on the mat' Order N: 'mat cat'
!     Data M: 'the cat sat on the mat' Order N: 'cat mat'
!     Data M: 'A B C A B C A B C'      Order N: 'C A C A'
!     Data M: 'A B C A B D A B E'      Order N: 'E A D A'
!     Data M: 'A B'                    Order N: 'B'      
!     Data M: 'A B'                    Order N: 'B A'    
!     Data M: 'A B B A'                Order N: 'B A'
! 
! Cf:
! 
! -   Sort disjoint sublist
! 
! Category:Sorting

qw{ the cat sat on the mat } qw{ mat cat } make-slots
