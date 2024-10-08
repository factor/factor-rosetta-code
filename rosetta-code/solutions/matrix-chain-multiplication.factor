! Problem
! 
! Using the most straightforward algorithm (which we assume here),
! computing the product of two matrices of dimensions (n1,n2) and (n2,n3)
! requires n1*n2*n3 FMA operations. The number of operations required to
! compute the product of matrices A1, A2... An depends on the order of
! matrix multiplications, hence on where parens are put. Remember that the
! matrix product is associative, but not commutative, hence only the
! parens can be moved.
! 
! For instance, with four matrices, one can compute A(B(CD)), A((BC)D),
! (AB)(CD), (A(BC))D, (AB)C)D. The number of different ways to put the
! parens is a Catalan number, and grows exponentially with the number of
! factors.
! 
! Here is an example of computation of the total cost, for matrices
! A(5,6), B(6,3), C(3,1):
! 
! -   AB costs 5*6*3=90 and produces a matrix of dimensions (5,3), then
!     (AB)C costs 5*3*1=15. The total cost is 105.
! -   BC costs 6*3*1=18 and produces a matrix of dimensions (6,1), then
!     A(BC) costs 5*6*1=30. The total cost is 48.
! 
! In this case, computing (AB)C requires more than twice as many
! operations as A(BC). The difference can be much more dramatic in real
! cases.
! 
! Task
! 
! Write a function which, given a list of the successive dimensions of
! matrices A1, A2... An, of arbitrary length, returns the optimal way to
! compute the matrix product, and the total cost. Any sensible way to
! describe the optimal solution is accepted. The input list does not
! duplicate shared dimensions: for the previous example of matrices A,B,C,
! one will only pass the list [5,6,3,1] (and not [5,6,6,3,3,1]) to mean
! the matrix dimensions are respectively (5,6), (6,3) and (3,1). Hence, a
! product of n matrices is represented by a list of n+1 dimensions.
! 
! Try this function on the following two lists:
! 
! -   [1, 5, 25, 30, 100, 70, 2, 1, 100, 250, 1, 1000, 2]
! -   [1000, 1, 500, 12, 1, 700, 2500, 3, 2, 5, 14, 10]
! 
! To solve the task, it's possible, but not required, to write a function
! that enumerates all possible ways to parenthesize the product. This is
! not optimal because of the many duplicated computations, and this task
! is a classic application of dynamic programming.
! 
! See also Matrix chain multiplication on Wikipedia.
! 
! __TOC__
! 
! Category:Matrices


