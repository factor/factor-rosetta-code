! Task:
! 
! Given a set of positive integers, write a function to order the integers
! in such a way that the concatenation of the numbers forms the largest
! possible integer and return this integer.
! 
! Use the following two sets of integers as tests and show your program
! output here.
! 
! -   -   {1, 34, 3, 98, 9, 76, 45, 4}
!     -   {54, 546, 548, 60}
! 
! Possible algorithms:
! 
! 1.  A solution could be found by trying all combinations and return the
!     best.
! 2.  Another way to solve this is to note that in the best arrangement,
!     for any two adjacent original integers X and Y, the concatenation X
!     followed by Y will be numerically greater than or equal to the
!     concatenation Y followed by '''X.
! 3.  Yet another way to solve this is to pad the integers to the same
!     size by repeating the digits then sort using these repeated integers
!     as a sort key.
! 
! See also:
! 
! -   Algorithms: What is the most efficient way to arrange the given
!     numbers to form the biggest number?
! -   Constructing the largest number possible by rearranging a list

USING: assocs io kernel math qw sequences sorting ;
IN: rosetta-code.largest-int

: pad ( target seq -- padded )
    2dup length / swap <repetition> concat swap head ;
    
: largest-int ( seq -- )
    dup dup [ length ] map supremum    ! find longest length so we know how much to pad
    [ swap pad ] curry map             ! pad the integers
    <enum> sort-values                 ! sort the padded integers
    keys                               ! find the original indices of the sorted integers
    swap nths                          ! order non-padded integers according to their sorted order
    reverse concat print ;             
    
qw{ 1 34 3 98 9 76 45 4 } qw{ 54 546 548 60 } [ largest-int ] bi@
