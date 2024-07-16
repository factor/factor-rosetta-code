! The set of combinations with repetitions is computed from a set, S (of
! cardinality n), and a size of resulting selection, k, by reporting the
! sets of cardinality k where each member of those sets is chosen from S.
! In the real world, it is about choosing sets where there is a “large”
! supply of each type of element and where the order of choice does not
! matter. For example:
! 
!     Q: How many ways can a person choose two doughnuts from a store
!     selling three types of doughnut: iced, jam, and plain? (i.e., S is
!     {iced, jam, plain}, |S| = 3, and k = 2.)
! 
!     A: 6: {iced, iced}; {iced, jam}; {iced, plain}; {jam, jam}; {jam,
!     plain}; {plain, plain}.
! 
! Note that both the order of items within a pair, and the order of the
! pairs given in the answer is not significant; the pairs represent
! multisets.
! 
! Also note that doughnut can also be spelled donut.
! 
! Task:
! 
! -   Write a function/program/routine/.. to generate all the combinations
!     with repetitions of n types of things taken k at a time and use it
!     to show an answer to the doughnut example above.
! -   For extra credit, use the function to compute and show just the
!     number of ways of choosing three doughnuts from a choice of ten
!     types of doughnut. Do not show the individual choices for this part.
! 
! References:
! 
! -   k-combination with repetitions
! 
! See also:

USING: math.combinatorics prettyprint qw ;

qw{ iced jam plain } 2 all-combinations-with-replacement .
