! For a given matrix, return the determinant and the permanent of the
! matrix. For a matrix of orthonormal basis vectors, return the
! Levi-Civita symbol of the orthonormal basis vector permutation.
! 
! The determinant is given by
! 
!     
! 
!         $\det(A) = \sum_\sigma\sgn(\sigma)\prod_{i=1}^n M_{i,\sigma_i}$
! 
! while the permanent is given by
! 
!     
! 
!         $\operatorname{perm}(A)=\sum_\sigma\prod_{i=1}^n M_{i,\sigma_i}$
! 
! In both cases the sum is over the permutations σ of the permutations of
! 1, 2, ..., n. (A permutation's sign is 1 if there are an even number of
! inversions and -1 otherwise; see parity of a permutation.)
! 
! Complexity of known algorithms:
! 
! -   Laplace expansion O(n!)
! -   Leibniz fomula Ω(n! ⋅ n)
! -   Bareiss algorithm O(n³)
! -   LU-decomposition O(n³)
! -   Strassen algorithm O(n^(2.807))
! -   Coppersmith-Winograd algorithm O(n^(2.376))
! -   Le Gall algorithm
! -   Bird's algorithm
! 
! Related task:
! 
! -   Computational complexity of matrix multiplication
! -   Richard Bird Pearls
! -   Funkcionálne programovanie
! -   Permutations by swapping

USING: fry kernel math.combinatorics math.matrices sequences ;

: permanent ( matrix -- x )
    dup square-matrix? [ "Matrix must be square." throw ] unless
    [ dim first <iota> ] keep
    '[ [ _ nth nth ] map-index product ] map-permutations sum ;
