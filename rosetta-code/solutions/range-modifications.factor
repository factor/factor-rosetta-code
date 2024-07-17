! The increasing range of all integers from a lower to an upper bound,
! including each boundary, is shown by the lower-boundary separated from
! the higher-boundary by a single dash. So 64-1234 is the range of all
! integers from 64 to 1234, (including both 64 and 1234). 10-10 is the
! range covering the single integer 10.
! 
! A sequence of ranges is shown by successive integer ranges that do not
! overlap, and which have increasing lower bounds. Each range is separated
! by a single comma. So 13-14,22-22,100999999-101000001 is a sequence of
! ranges that contain the integers 13 14 22 100999999 101000000 and
! 101000001.
! 
! Empty ranges are removed. An empty sequence has an empty string
! representation.
! 
! Note: There are NO internal spaces in the sequence format.
! 
! Task:
! 
! Given an initial sequence of ranges write programs to add or remove an
! integer from the sequence and display the resultant sequence.
! 
! Note:
! 
! -   The initial sequence may be empty.
! -   Adding an int that is already covered should not change the
!     sequence.
! -   removing an int that is not in the sequence should not change the
!     sequence.
! -   The add and remove operations should print their result in the
!     standard form mentioned.
! -   Solutions must work by modifying range boundaries, splitting and
!     joining, as well as creating and deleting ranges.
! 
! Do not use algorithms that create and modify arrays of all the integer values within ranges. 
! 
! Show the results, (including intermediate results), of performing the
! following steps
! 
! Ex0:
! 
!    Start with ""
!        add 77
!        add 79
!        add 78
!        remove 77
!        remove 78
!        remove 79
! 
! Ex1:
! 
!    Start with "1-3,5-5"
!        add 1
!        remove 4
!        add 7
!        add 8
!        add 6
!        remove 7
! 
! Ex2:
! 
!    Start with "1-5,10-25,27-30"
!        add 26
!        add 9
!        add 7
!        remove 26
!        remove 9
!        remove 7
! 
! Requires Gdip Library


