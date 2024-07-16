! (Knuth's power tree is used for computing x^(n) efficiently.)
! 
! Task:
! 
! Compute and show the list of Knuth's power tree integers necessary for
! the computation of:
! 
! -   -   x^(n) for any real x and any non-negative integer n.
! 
! Then, using those integers, calculate and show the exact values of (at
! least) the integer powers below:
! 
! -   -   2^(n) where n ranges from 0 ──► 17 (inclusive)
! 
! -   -   3¹⁹¹
!     -   1.1⁸¹
! 
! A  zeropower is often handled separately as a special case.
! 
! Optionally, support negative integer powers.
! 
! Example:
! 
! An example of a small power tree for some low integers:
! 
!                                                                         1
!                                                                          \
!                                                                           2
!                               ___________________________________________/ \
!                              /                                              \
!                             3                                                4
!                            / \____________________________________            \
!                           /                                       \            \
!                          5                                         6            8
!                         / \____________                           / \            \
!                        /               \                         /   \            \
!                       7                 10                      9     12           16
!                      /                 //\\                     │      │           /\
!                     /            _____//  \\________            │      │          /  \
!                   14            /     /    \        \           │      │         /    \
!                  /│ \         11    13      15       20        18     24        17    32
!                 / │  \         │    /\      /\        │        /\      │        /\     │
!                /  │   \        │   /  \    /  \       │       /  \     │       /  \    │
!              19  21    28     22 23   26  25   30    40     27   36    48     33 34   64
!              │   /\    /│\     │  │   /\   │   /\    /│\     │   /\    /│\     │  │   /\
!              │  /  \  / │ \    │  │  /  \  │  /  \  / │ \    │  /  \  / │ \    │  │  /  \
!             38 35 42 29 31 56 44 46 39 52 50 45 60 41 43 80 54 37 72 49 51 96 66 68 65 128
! 
! Where, for the power 43, following the tree "downwards" from 1:
! 
! -   -   (for 2) compute square of X, store X²
!     -   (for 3) compute X * X², store X³
!     -   (for 5) compute X³ * X², store X⁵
!     -   (for 10) compute square of X⁵, store X¹⁰
!     -   (for 20) compute square of X¹⁰, store X²⁰
!     -   (for 40) compute square of X²⁰, store X⁴⁰
!     -   (for 43) compute X⁴⁰ * X³ (result).
! 
! Note that for every even integer (in the power tree), one just squares
! the previous value.
! 
! For an odd integer, multiply the previous value with an appropriate odd
! power of X (which was previously calculated). For the last
! multiplication in the above example, it would be (43-40), or 3.
! 
! According to Dr. Knuth (see below), computer tests have shown that this
! power tree gives optimum results for all of the n listed above in the
! graph.
! 
! For n ≤ 100,000, the power tree method:
! 
! -   -   bests the factor method 88,803 times,
!     -   ties 11,191 times,
!     -   loses 6 times.
! 
! References:
! 
! -   -   Donald E. Knuth's book: The Art of Computer Programming, Vol. 2,
!         Second Edition, Seminumerical Algorithms, section 4.6.3:
!         Evaluation of Powers.
!     -   link codegolf.stackexchange.com/questions/3177/knuths-power-tree
!         It shows a Haskell, Python, and a Ruby computer program example
!         (but they are mostly code golf).
!     -   link comeoncodeon.wordpress.com/tag/knuth/ (See the section on
!         Knuth's Power Tree.) It shows a C++ computer program example.
!     -   link to Rosetta Code addition-chain exponentiation.

