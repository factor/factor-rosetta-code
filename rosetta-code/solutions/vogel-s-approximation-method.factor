! Vogel's Approximation Method (VAM) is a technique for finding a good
! initial feasible solution to an allocation problem.
! 
! The powers that be have identified 5 tasks that need to be solved
! urgently. Being imaginative chaps, they have called them “A”, “B”, “C”,
! “D”, and “E”. They estimate that:
! 
! -   A will require 30 hours of work,
! -   B will require 20 hours of work,
! -   C will require 70 hours of work,
! -   D will require 30 hours of work, and
! -   E will require 60 hours of work.
! 
! They have identified 4 contractors willing to do the work, called “W”,
! “X”, “Y”, and “Z”.
! 
! -   W has 50 hours available to commit to working,
! -   X has 60 hours available,
! -   Y has 50 hours available, and
! -   Z has 50 hours available.
! 
! The cost per hour for each contractor for each task is summarized by the
! following table:
! 
!        A  B  C  D  E
!     W 16 16 13 22 17
!     X 14 14 13 19 15
!     Y 19 19 20 23 50
!     Z 50 12 50 15 11
! 
! The task is to use VAM to allocate contractors to tasks. It scales to
! large problems, so ideally keep sorts out of the iterative cycle. It
! works as follows:
! 
!     Step 1: Balance the given transportation problem if either (total
!     supply>total demand) or (total supply<total demand)
!     Step 2: Determine the penalty cost for each row and column by
!     subtracting the lowest cell cost in the row or column from the next
!     lowest cell cost in the same row or column.
!     Step 3: Select the row or column with the highest penalty cost
!     (breaking ties arbitrarily or choosing the lowest-cost cell).
!     Step 4: Allocate as much as possible to the feasible cell with the
!     lowest transportation cost in the row or column with the highest
!     penalty cost.
!     Step 5: Repeat steps 2, 3 and 4 until all requirements have been
!     meet.
!     Step 6: Compute total transportation cost for the feasible
!     allocations.
! 
! For this task assume that the model is balanced.
! 
! For each task and contractor (row and column above) calculating the
! difference between the smallest two values produces:
! 
!             A       B       C       D       E       W       X       Y       Z
!     1       2       2       0       4       4       3       1       0       1   E-Z(50)
! 
! Determine the largest difference (D or E above). In the case of ties I
! shall choose the one with the lowest price (in this case E because the
! lowest price for D is Z=15, whereas for E it is Z=11). For your choice
! determine the minimum cost (chosen E above so Z=11 is chosen now).
! Allocate as much as possible from Z to E (50 in this case limited by Z's
! supply). Adjust the supply and demand accordingly. If demand or supply
! becomes 0 for a given task or contractor it plays no further part. In
! this case Z is out of it. If you choose arbitrarily, and chose D see
! here for the working.
! 
! Repeat until all supply and demand is met:
! 
!     2       2       2       0       3       2       3       1       0       -   C-W(50)
!     3       5       5       7       4      35       -       1       0       -   E-X(10)
!     4       5       5       7       4       -       -       1       0       -   C-X(20)
!     5       5       5       -       4       -       -       0       0       -   A-X(30)
!     6       -      19       -      23       -       -       -       4       -   D-Y(30)
!             -       -       -       -       -       -       -       -       -   B-Y(20)
! 
! Finally calculate the cost of your solution. In the example given it is
! £3100:
! 
!        A  B  C  D  E
!     W       50
!     X 30    20    10
!     Y    20    30
!     Z             50
! 
! The optimal solution determined by GLPK is £3100:
! 
!        A  B  C  D  E
!     W       50
!     X 10 20 20    10
!     Y 20       30
!     Z             50
! 
! Cf.
! 
! -   Transportation problem


