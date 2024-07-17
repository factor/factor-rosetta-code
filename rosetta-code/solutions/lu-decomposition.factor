! Every square matrix A can be decomposed into a product of a lower
! triangular matrix L and a upper triangular matrix U, as described in LU
! decomposition.
! 
! A = LU
! 
! It is a modified form of Gaussian elimination. While the Cholesky
! decomposition only works for symmetric, positive definite matrices, the
! more general LU decomposition works for any square matrix.
! 
! There are several algorithms for calculating L and U. To derive Crout's
! algorithm for a 3x3 example, we have to solve the following system:
! 
! $$A =
! \begin{pmatrix}
!    a_{11} & a_{12} & a_{13}\\
!    a_{21} & a_{22} & a_{23}\\
!    a_{31} & a_{32} & a_{33}\\
! \end{pmatrix}
! =
! \begin{pmatrix}
!    l_{11} & 0 & 0 \\
!    l_{21} & l_{22} & 0 \\
!    l_{31} & l_{32} & l_{33}\\
! \end{pmatrix}
! \begin{pmatrix}
!    u_{11} & u_{12} & u_{13} \\
!    0 & u_{22} & u_{23} \\
!    0 & 0 & u_{33}
! \end{pmatrix}
! = LU$$
! 
! We now would have to solve 9 equations with 12 unknowns. To make the
! system uniquely solvable, usually the diagonal elements of L are set to
! 1
! 
! l₁₁ = 1
! 
! l₂₂ = 1
! 
! l₃₃ = 1
! 
! so we get a solvable system of 9 unknowns and 9 equations.
! 
! $$A =
! \begin{pmatrix}
!    a_{11} & a_{12} & a_{13}\\
!    a_{21} & a_{22} & a_{23}\\
!    a_{31} & a_{32} & a_{33}\\
! \end{pmatrix}
! =
! \begin{pmatrix}
!    1      & 0      & 0 \\
!    l_{21} & 1      & 0 \\
!    l_{31} & l_{32} & 1\\
! \end{pmatrix}
! \begin{pmatrix}
!    u_{11} & u_{12} & u_{13} \\
!    0 & u_{22} & u_{23} \\
!    0 & 0 & u_{33}
! \end{pmatrix}
! =
! \begin{pmatrix}
!    u_{11}        & u_{12}                    & u_{13}              \\
!    u_{11}l_{21}  & u_{12}l_{21}+u_{22}       & u_{13}l_{21}+u_{23} \\
!    u_{11}l_{31}  & u_{12}l_{31}+u_{22}l_{32} & u_{13}l_{31} + u_{23}l_{32}+u_{33}
! \end{pmatrix}
! = LU$$
! 
! Solving for the other l and u, we get the following equations:
! 
! u₁₁ = a₁₁
! 
! u₁₂ = a₁₂
! 
! u₁₃ = a₁₃
! 
! u₂₂ = a₂₂ − u₁₂l₂₁
! 
! u₂₃ = a₂₃ − u₁₃l₂₁
! 
! u₃₃ = a₃₃ − (u₁₃l₃₁ + u₂₃l₃₂)
! 
! and for l:
! 
! $$l_{21}=\frac{1}{u_{11}} a_{21}$$
! 
! $$l_{31}=\frac{1}{u_{11}} a_{31}$$
! 
! $$l_{32}=\frac{1}{u_{22}} (a_{32} - u_{12}l_{31})$$
! 
! We see that there is a calculation pattern, which can be expressed as
! the following formulas, first for U
! 
! $$u_{ij} = a_{ij} - \sum_{k=1}^{i-1} u_{kj}l_{ik}$$
! 
! and then for L
! 
! $$l_{ij} = \frac{1}{u_{jj}} (a_{ij} - \sum_{k=1}^{j-1} u_{kj}l_{ik})$$
! 
! We see in the second formula that to get the l_(ij) below the diagonal,
! we have to divide by the diagonal element (pivot) u_(jj), so we get
! problems when u_(jj) is either 0 or very small, which leads to numerical
! instability.
! 
! The solution to this problem is pivoting A, which means rearranging the
! rows of A, prior to the LU decomposition, in a way that the largest
! element of each column gets onto the diagonal of A. Rearranging the rows
! means to multiply A by a permutation matrix P:
! 
! PA ⇒ A′
! 
! Example:
! 
! $$\begin{pmatrix}
!    0 & 1 \\
!    1 & 0 
! \end{pmatrix}
! \begin{pmatrix}
!    1 & 4 \\
!    2 & 3 
! \end{pmatrix}
! \Rightarrow
! \begin{pmatrix}
!    2 & 3 \\
!    1 & 4 
! \end{pmatrix}$$
! 
! The decomposition algorithm is then applied on the rearranged matrix so
! that
! 
! PA = LU
! 
! Task description:
! 
! The task is to implement a routine which will take a square nxn matrix A
! and return a lower triangular matrix L, a upper triangular matrix U and
! a permutation matrix P, so that the above equation is fulfilled.
! 
! You should then test it on the following two examples and include your
! output.
! 
! Example 1:
! 
!     A
! 
!     1   3   5
!     2   4   7
!     1   1   0
! 
!     L
! 
!     1.00000   0.00000   0.00000
!     0.50000   1.00000   0.00000
!     0.50000  -1.00000   1.00000
! 
!     U
! 
!     2.00000   4.00000   7.00000
!     0.00000   1.00000   1.50000
!     0.00000   0.00000  -2.00000
! 
!     P
! 
!     0   1   0
!     1   0   0
!     0   0   1
! 
! Example 2:
! 
!     A
! 
!     11    9   24    2
!      1    5    2    6
!      3   17   18    1
!      2    5    7    1
! 
!     L
! 
!     1.00000   0.00000   0.00000   0.00000
!     0.27273   1.00000   0.00000   0.00000
!     0.09091   0.28750   1.00000   0.00000
!     0.18182   0.23125   0.00360   1.00000
! 
!     U
! 
!     11.00000    9.00000   24.00000    2.00000
!      0.00000   14.54545   11.45455    0.45455
!      0.00000    0.00000   -3.47500    5.68750
!      0.00000    0.00000    0.00000    0.51079
! 
!     P
! 
!     1   0   0   0
!     0   0   1   0
!     0   1   0   0
!     0   0   0   1


