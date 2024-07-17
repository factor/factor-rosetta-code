! Suppose that a matrix M contains complex numbers. Then the conjugate
! transpose of M is a matrix M^(H) containing the complex conjugates of
! the matrix transposition of M.
! 
!     
! 
!         $(M^H)_{ji} = \overline{M_{ij}}$
! 
! This means that row j, column i of the conjugate transpose equals the
! 
! complex conjugate of row i, column j of the original matrix.
! 
! In the next list, M must also be a square matrix.
! 
! -   A Hermitian matrix equals its own conjugate transpose: M^(H) = M.
! -   A normal matrix is commutative in multiplication with its conjugate
!     transpose: M^(H)M = MM^(H).
! -   A unitary matrix has its inverse equal to its conjugate transpose:
!     M^(H) = M⁻¹.
! 
! This is true iff M^(H)M = I_(n) and iff MM^(H) = I_(n), where I_(n) is the identity matrix.
! 
! Task:
! 
! Given some matrix of complex numbers, find its conjugate transpose.
! 
! Also determine if the matrix is a:
! 
! -   -   Hermitian matrix,
!     -   normal matrix, or
!     -   unitary matrix.
! 
! See also:
! 
! -   MathWorld entry: conjugate transpose
! -   MathWorld entry: Hermitian matrix
! -   MathWorld entry: normal matrix
! -   MathWorld entry: unitary matrix
! 
! Category:Matrices

USING: kernel math.functions math.matrices sequences ;
IN: rosetta.hermitian

: conj-t ( matrix -- conjugate-transpose )
    flip [ [ conjugate ] map ] map ;

: hermitian-matrix? ( matrix -- ? )
    dup conj-t = ;

: normal-matrix? ( matrix -- ? )
    dup conj-t [ m. ] [ swap m. ] 2bi = ;

: unitary-matrix? ( matrix -- ? )
    [ dup conj-t m. ] [ length identity-matrix ] bi = ;
