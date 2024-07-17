! In this task we want to find the ordered partitions into fixed-size
! blocks.
! 
! This task is related to Combinations in that it has to do with discrete
! mathematics and moreover a helper function to compute combinations is
! (probably) needed to solve this task.
! 
! partitions(arg₁, arg₂, ..., arg_(n)) should generate all distributions
! of the elements in {1, ..., Σ_(i = 1)^(n)arg_(i)} into n blocks of
! respective size arg₁, arg₂, ..., arg_(n).
! 
! Example 1: partitions(2, 0, 2) would create:
! 
!     {({1, 2}, {}, {3, 4}), 
!      ({1, 3}, {}, {2, 4}), 
!      ({1, 4}, {}, {2, 3}), 
!      ({2, 3}, {}, {1, 4}), 
!      ({2, 4}, {}, {1, 3}), 
!      ({3, 4}, {}, {1, 2})}
! 
! Example 2: partitions(1, 1, 1) would create:
! 
!     {({1}, {2}, {3}), 
!      ({1}, {3}, {2}), 
!      ({2}, {1}, {3}), 
!      ({2}, {3}, {1}), 
!      ({3}, {1}, {2}), 
!      ({3}, {2}, {1})}
! 
! Note that the number of elements in the list is
! 
! $${\mathit{arg}_1+\mathit{arg}_2+...+\mathit{arg}_n \choose \mathit{arg}_1} \cdot {\mathit{arg}_2+\mathit{arg}_3+...+\mathit{arg}_n \choose \mathit{arg}_2} \cdot \ldots \cdot {\mathit{arg}_n \choose \mathit{arg}_n}$$
! (see the definition of the binomial coefficient if you are not familiar
! with this notation) and the number of elements remains the same
! regardless of how the argument is permuted (i.e. the multinomial
! coefficient).
! 
! Also, partitions(1, 1, 1) creates the permutations of {1, 2, 3} and thus
! there would be 3! = 6 elements in the list.
! 
! Note: Do not use functions that are not in the standard library of the
! programming language you use. Your file should be written so that it can
! be executed on the command line and by default outputs the result of
! partitions(2, 0, 2). If the programming language does not support
! polyvariadic functions pass a list as an argument.
! 
! Notation
! 
! Here are some explanatory remarks on the notation used in the task
! description:
! 
! {1, …, n} denotes the set of consecutive numbers from 1 to n, e.g.
! {1, 2, 3} if n = 3.
! 
! Σ is the mathematical notation for summation, e.g. Σ_(i = 1)³i = 6 (see
! also 1).
! 
! arg₁, arg₂, ..., arg_(n) are the arguments — natural numbers — that the
! sought function receives.


