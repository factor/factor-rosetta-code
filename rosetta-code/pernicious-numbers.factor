! A pernicious number is a positive integer whose population count is a
! prime.
! 
! The population count is the number of ones in the binary representation
! of a non-negative integer.
! 
! Example
! 
! 22 (which is 10110 in binary) has a population count of 3, which is
! prime, and therefore
! 
! 22 is a pernicious number.
! 
! Task
! 
! -   display the first 25 pernicious numbers (in decimal).
! -   display all pernicious numbers between 888,888,877 and 888,888,888
!     (inclusive).
! -   display each list of integers on one line (which may or may not
!     include a title).
! 
! See also
! 
! -   Sequence A052294 pernicious numbers on The On-Line Encyclopedia of
!     Integer Sequences.
! -   Rosetta Code entry population count, evil numbers, odious numbers.

USING: lists lists.lazy math.bitwise math.primes math.ranges
prettyprint sequences ;

: pernicious? ( n -- ? ) bit-count prime? ;

25 0 lfrom [ pernicious? ] lfilter ltake list>array .    ! print first 25 pernicious numbers
888,888,877 888,888,888 [a,b] [ pernicious? ] filter .   ! print pernicious numbers in range
