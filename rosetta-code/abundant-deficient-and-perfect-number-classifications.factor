! These define three classifications of positive integers based on their
! proper divisors.
! 
! Let P(n) be the sum of the proper divisors of n where the proper
! divisors are all positive divisors of n other than n itself.
! 
!    if   P(n) < n   then  n  is classed as  deficient  (OEIS A005100).
!    if   P(n) == n   then  n  is classed as  perfect    (OEIS A000396).
!    if   P(n) > n   then  n  is classed as  abundant   (OEIS A005101).
! 
! Example:
! 
! 6 has proper divisors of 1, 2, and 3.
! 
! 1 + 2 + 3 = 6, so 6 is classed as a perfect number.
! 
! Task:
! 
! Calculate how many of the integers 1 to 20,000 (inclusive) are in each
! of the three classes.
! 
! Show the results here.
! 
! Related tasks:
! 
! -   Aliquot sequence classifications. (The whole series from which this
!     task is a subset.)
! -   Proper divisors
! -   Amicable pairs

USING: fry math.primes.factors math.ranges ;
: psum     ( n -- m )   divisors but-last sum ;
: pcompare ( n -- <=> ) dup psum swap <=> ;
: classify ( -- seq )   20,000 [1,b] [ pcompare ] map ;
: pcount   ( <=> -- n ) '[ _ = ] count ;
classify [ +lt+ pcount "Deficient: " write . ]
         [ +eq+ pcount "Perfect: "   write . ]
         [ +gt+ pcount "Abundant: "  write . ] tri
