! Solve the Stable marriage problem using the Gale/Shapley algorithm.
! 
! Problem description
! 
! Given an equal number of men and women to be paired for marriage, each
! man ranks all the women in order of his preference and each woman ranks
! all the men in order of her preference.
! 
! A stable set of engagements for marriage is one where no man prefers a
! woman over the one he is engaged to, where that other woman also prefers
! that man over the one she is engaged to. I.e. with consulting marriages,
! there would be no reason for the engagements between the people to
! change.
! 
! Gale and Shapley proved that there is a stable set of engagements for
! any set of preferences and the first link above gives their algorithm
! for finding a set of stable engagements.
! 
! Task Specifics
! 
! Given ten males:
! 
!    abe, bob, col, dan, ed, fred, gav, hal, ian, jon
! 
! And ten females:
! 
!    abi, bea, cath, dee, eve, fay, gay, hope, ivy, jan
! 
! And a complete list of ranked preferences, where the most liked is to
! the left:
! 
!   abe: abi, eve, cath, ivy, jan, dee, fay, bea, hope, gay
!   bob: cath, hope, abi, dee, eve, fay, bea, jan, ivy, gay
!   col: hope, eve, abi, dee, bea, fay, ivy, gay, cath, jan
!   dan: ivy, fay, dee, gay, hope, eve, jan, bea, cath, abi
!    ed: jan, dee, bea, cath, fay, eve, abi, ivy, hope, gay
!  fred: bea, abi, dee, gay, eve, ivy, cath, jan, hope, fay
!   gav: gay, eve, ivy, bea, cath, abi, dee, hope, jan, fay
!   hal: abi, eve, hope, fay, ivy, cath, jan, bea, gay, dee
!   ian: hope, cath, dee, gay, bea, abi, fay, ivy, jan, eve
!   jon: abi, fay, jan, gay, eve, bea, dee, cath, ivy, hope
! 
!   abi: bob, fred, jon, gav, ian, abe, dan, ed, col, hal
!   bea: bob, abe, col, fred, gav, dan, ian, ed, jon, hal
!  cath: fred, bob, ed, gav, hal, col, ian, abe, dan, jon
!   dee: fred, jon, col, abe, ian, hal, gav, dan, bob, ed
!   eve: jon, hal, fred, dan, abe, gav, col, ed, ian, bob
!   fay: bob, abe, ed, ian, jon, dan, fred, gav, col, hal
!   gay: jon, gav, hal, fred, bob, abe, col, ed, dan, ian
!  hope: gav, jon, bob, abe, ian, dan, hal, ed, col, fred
!   ivy: ian, col, hal, gav, fred, bob, abe, ed, jon, dan
!   jan: ed, hal, gav, abe, bob, jon, col, ian, fred, dan
! 
! 1.  Use the Gale Shapley algorithm to find a stable set of engagements
! 2.  Perturb this set of engagements to form an unstable set of
!     engagements then check this new set for stability.
! 
! References
! 
! 1.  The Stable Marriage Problem. (Eloquent description and background
!     information).
! 2.  Gale-Shapley Algorithm Demonstration.
! 3.  Another Gale-Shapley Algorithm Demonstration.
! 4.  Stable Marriage Problem - Numberphile (Video).
! 5.  Stable Marriage Problem (the math bit) (Video).
! 6.  The Stable Marriage Problem and School Choice. (Excellent
!     exposition)


