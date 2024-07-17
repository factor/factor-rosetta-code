! A is any m by n matrix, square or rectangular. Its rank is r. We will
! diagonalize this A, but not by X⁻¹AX. The eigenvectors in X have three
! big problems: They are usually not orthogonal, there are not always
! enough eigenvectors, and Ax = λx requires A to be a square matrix. The
! singular vectors of A solve all those problems in a perfect way.
! 
! The Singular Value Decomposition (SVD)
! 
! According to the web page above, for any rectangular matrix A, we can
! decomposite it as A = UΣV^(T)
! 
! Task Description
! 
! Firstly, input two numbers "m" and "n".
! 
! Then, input a square/rectangular matrix A^(m × n).
! 
! Finally, output U, Σ, V with respect to A.
! 
! Example
! 
! Sample Input
! 
!     2 2
!     3 0
!     4 5
! 
! From the input above we can know that A is a 2 by 2 matrix.
! 
! Sample Output
! 
!        
!     0.31622776601683794 -0.9486832980505138
!     0.9486832980505138 0.31622776601683794
! 
!     6.708203932499369 0
!     0 2.23606797749979
! 
!     0.7071067811865475 -0.7071067811865475
!     0.7071067811865475 0.7071067811865475
! 
! The output may vary depending your choice of the data types.
! 
! Remark
! 
! 1. It’s encouraged to implement the algorithm by yourself while using
! libraries is still acceptible.
! 
! 2. The algorithm should be applicable for general case(m × n).


