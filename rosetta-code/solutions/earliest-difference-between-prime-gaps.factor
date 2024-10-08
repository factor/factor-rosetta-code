! When calculating prime numbers > 2, the difference between adjacent
! primes is always an even number. This difference, also referred to as
! the gap, varies in an random pattern; at least, no pattern has ever been
! discovered, and it is strongly conjectured that no pattern exists.
! However, it is also conjectured that between some two adjacent primes
! will be a gap corresponding to every positive even integer.
! 
!   gap   minimal starting prime   ending prime
!   ----- ------------------------ --------------
!   2     3                        5
!   4     7                        11
!   6     23                       29
!   8     89                       97
!   10    139                      149
!   12    199                      211
!   14    113                      127
!   16    1831                     1847
!   18    523                      541
!   20    887                      907
!   22    1129                     1151
!   24    1669                     1693
!   26    2477                     2503
!   28    2971                     2999
!   30    4297                     4327
! 
! This task involves locating the minimal primes corresponding to those
! gaps.
! 
! Though every gap value exists, they don't seem to come in any particular
! order. For example, this table shows the gaps and minimum starting value
! primes for 2 through 30:
! 
! For the purposes of this task, considering only primes greater than 2,
! consider prime gaps that differ by exactly two to be adjacent.
! 
! Task
! 
! For each order of magnitude m from 10¹ through 10⁶:
! 
! -   Find the first two sets of minimum adjacent prime gaps where the
!     absolute value of the difference between the prime gap start values
!     is greater than m.
! 
! E.G.
! 
! For an m of 10¹;
! 
! The start value of gap 2 is 3, the start value of gap 4 is 7, the
! difference is 7 - 3 or 4. 4 < 10¹ so keep going.
! 
! The start value of gap 4 is 7, the start value of gap 6 is 23, the
! difference is 23 - 7, or 16. 16 > 10¹ so this the earliest adjacent gap
! difference > 10¹.
! 
! Stretch goal
! 
! -   Do the same for 10⁷ and 10⁸ (and higher?) orders of magnitude
! 
! Note: the earliest value found for each order of magnitude may not be
! unique, in fact, is not unique; also, with the gaps in ascending order,
! the minimal starting values are not strictly ascending.


