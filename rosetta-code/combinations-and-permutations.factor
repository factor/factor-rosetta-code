! Task:
! 
! Implement the combination (^(n)C_(k)) and permutation (^(n)P_(k))
! operators in the target language:
! 
! -   -   $^n\operatorname C_k =\binom nk = \frac{n(n-1)\ldots(n-k+1)}{k(k-1)\dots1}$
! 
! -   -   ^(n)P_(k) = n ⋅ (n − 1) ⋅ (n − 2)⋯(n − k + 1)
! 
! See the Wikipedia articles for a more detailed description.
! 
! To test, generate and print examples of:
! 
! -   A sample of permutations from 1 to 12 and Combinations from 10 to 60
!     using exact Integer arithmetic.
! -   A sample of permutations from 5 to 15000 and Combinations from 100
!     to 1000 using approximate Floating point arithmetic.
! 
! This 'floating point' code could be implemented using an approximation, e.g., by calling the Gamma function.
! 
! Related task:
! 
! -   Evaluate binomial coefficients

USING: math.combinatorics prettyprint ;

1000 10 nCk .   ! 263409560461970212832400
1000 10 nPk .   ! 955860613004397508326213120000
