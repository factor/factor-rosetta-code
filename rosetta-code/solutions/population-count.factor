! The population count is the number of 1s (ones) in the binary
! representation of a non-negative integer.
! 
! Population count is also known as:
! 
! -   -   pop count
!     -   popcount
!     -   sideways sum
!     -   bit summation
!     -   Hamming weight
! 
! For example, 5 (which is 101 in binary) has a population count of 2.
! 
! Evil numbers are non-negative integers that have an even population
! count.
! 
! Odious numbers are positive integers that have an odd population count.
! 
! Task:
! 
! -   write a function (or routine) to return the population count of a
!     non-negative integer.
! -   all computation of the lists below should start with 0 (zero
!     indexed).
!     -   display the pop count of the 1^(st) thirty powers of 3 (3⁰, 3¹,
!         3², 3³, 3⁴, ∙∙∙ 3²⁹).
!     -   display the 1^(st) thirty evil numbers.
!     -   display the 1^(st) thirty odious numbers.
! -   display each list of integers on one line (which may or may not
!     include a title), each set of integers being shown should be
!     properly identified.
! 
! See also
! 
! -   The On-Line Encyclopedia of Integer Sequences: A000120 population
!     count.
! -   The On-Line Encyclopedia of Integer Sequences: A000069 odious
!     numbers.
! -   The On-Line Encyclopedia of Integer Sequences: A001969 evil numbers.

USING: formatting kernel lists lists.lazy math math.bitwise
math.functions namespaces prettyprint.config sequences ;

: 3^n ( obj -- obj' ) [ 3 swap ^ bit-count ] lmap-lazy ;
: evil ( obj -- obj' ) [ bit-count even? ] lfilter ;
: odious ( obj -- obj' ) [ bit-count odd? ] lfilter ;

100 margin set 0 lfrom [ 3^n ] [ evil ] [ odious ] tri
[ 30 swap ltake list>array ] tri@
"3^n:    %u\nEvil:   %u\nOdious: %u\n" printf
