! For a given matrix, return the determinant and the permanent of the
! matrix.
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
! More efficient algorithms for the determinant are known: LU
! decomposition, see for example wp:LU decomposition#Computing the
! determinant. Efficient methods for calculating the permanent are not
! known.
! 
! Related task:
! 
! -   Permutations by swapping

USING: fry kernel math.combinatorics math.matrices sequences ;

: permanent ( matrix -- x )
    dup square-matrix? [ "Matrix must be square." throw ] unless
    [ dim first <iota> ] keep
    '[ [ _ nth nth ] map-index product ] map-permutations sum ;
