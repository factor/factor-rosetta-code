! Every symmetric, positive definite matrix A can be decomposed into a
! product of a unique lower triangular matrix L and its transpose:
! 
! A = LL^(T)
! 
! L is called the Cholesky factor of A, and can be interpreted as a
! generalized square root of A, as described in Cholesky decomposition.
! 
! In a 3x3 example, we have to solve the following system of equations:
! 
! $$\begin{align}
! A &=
! \begin{pmatrix}
!    a_{11} & a_{21} & a_{31}\\
!    a_{21} & a_{22} & a_{32}\\
!    a_{31} & a_{32} & a_{33}\\
! \end{pmatrix}\\
! & = 
! \begin{pmatrix}
!    l_{11} & 0 & 0 \\
!    l_{21} & l_{22} & 0 \\
!    l_{31} & l_{32} & l_{33}\\
! \end{pmatrix}
! \begin{pmatrix}
!    l_{11} & l_{21} & l_{31} \\
!    0 & l_{22} & l_{32} \\
!    0 & 0 & l_{33}
! \end{pmatrix} \equiv LL^T\\
! &= \begin{pmatrix}
!    l_{11}^2     & l_{21}l_{11} & l_{31}l_{11} \\
!    l_{21}l_{11} & l_{21}^2 + l_{22}^2& l_{31}l_{21}+l_{32}l_{22} \\
!    l_{31}l_{11} & l_{31}l_{21}+l_{32}l_{22} & l_{31}^2 + l_{32}^2+l_{33}^2
! \end{pmatrix}\end{align}$$
! 
! We can see that for the diagonal elements (l_(kk)) of L there is a
! calculation pattern:
! 
! $$l_{11} = \sqrt{a_{11}}$$
! 
! $$l_{22} = \sqrt{a_{22} - l_{21}^2}$$
! 
! $$l_{33} = \sqrt{a_{33} - (l_{31}^2 + l_{32}^2)}$$
! 
! or in general:
! 
! $$l_{kk} = \sqrt{a_{kk} - \sum_{j=1}^{k-1} l_{kj}^2}$$
! 
! For the elements below the diagonal (l_(ik), where i > k) there is also
! a calculation pattern:
! 
! $$l_{21} = \frac{1}{l_{11}} a_{21}$$
! 
! $$l_{31} = \frac{1}{l_{11}} a_{31}$$
! 
! $$l_{32} = \frac{1}{l_{22}} (a_{32} - l_{31}l_{21})$$
! 
! which can also be expressed in a general formula:
! 
! $$l_{ik} = \frac{1}{l_{kk}} \left ( a_{ik} - \sum_{j=1}^{k-1} l_{ij}l_{kj} \right )$$
! 
! Task description
! 
! The task is to implement a routine which will return a lower Cholesky
! factor L for every given symmetric, positive definite nxn matrix A. You
! should then test it on the following two examples and include your
! output.
! 
! Example 1:
! 
!     25  15  -5                 5   0   0
!     15  18   0         -->     3   3   0
!     -5   0  11                -1   1   3
! 
! Example 2:
! 
!     18  22   54   42           4.24264    0.00000    0.00000    0.00000
!     22  70   86   62   -->     5.18545    6.56591    0.00000    0.00000
!     54  86  174  134          12.72792    3.04604    1.64974    0.00000
!     42  62  134  106           9.89949    1.62455    1.84971    1.39262
! 
! Note:
! 
! 1.  The Cholesky decomposition of a Pascal upper-triangle matrix is the
!     Identity matrix of the same size.
! 2.  The Cholesky decomposition of a Pascal symmetric matrix is the
!     Pascal lower-triangle matrix of the same size.


