! A new medical treatment was tested on a population of n + m volunteers,
! with each volunteer randomly assigned either to a group of n treatment
! subjects, or to a group of m control subjects.
! 
! Members of the treatment group were given the treatment, and members of
! the control group were given a placebo. The effect of the treatment or
! placebo on each volunteer was measured and reported in this table.
! 
!     
! 
!         {| style="text-align: left; width: 25%;" border="4"
!         cellpadding="2" cellspacing="2"
! 
! |+ Table of experimental results |- style="background-color: rgb(255,
! 204, 255);" ! Treatment group !! Control group |- | 85 || 68 |- | 88 ||
! 41 |- | 75 || 10 |- | 66 || 49 |- | 25 || 16 |- | 29 || 65 |- | 83 || 32
! |- | 39 || 92 |- | 97 || 28 |- | || 98 |} Write a program that performs
! a permutation test to judge whether the treatment had a significantly
! stronger effect than the placebo.
! 
! -   Do this by considering every possible alternative assignment from
!     the same pool of volunteers to a treatment group of size n and a
!     control group of size m (i.e., the same group sizes used in the
!     actual experiment but with the group members chosen differently),
!     while assuming that each volunteer's effect remains constant
!     regardless.
! -   Note that the number of alternatives will be the binomial
!     coefficient $\tbinom{n+m}{n}$.
! -   Compute the mean effect for each group and the difference in means
!     between the groups in every case by subtracting the mean of the
!     control group from the mean of the treatment group.
! -   Report the percentage of alternative groupings for which the
!     difference in means is less or equal to the actual experimentally
!     observed difference in means, and the percentage for which it is
!     greater.
! -   Note that they should sum to 100%.
! 
! Extremely dissimilar values are evidence of an effect not entirely due
! to chance, but your program need not draw any conclusions.
! 
! You may assume the experimental data are known at compile time if that's
! easier than loading them at run time. Test your solution on the data
! given above.


