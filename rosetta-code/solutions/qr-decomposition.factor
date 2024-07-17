! Any rectangular m × n matrix A can be decomposed to a product of an
! orthogonal matrix Q and an upper (right) triangular matrix R, as
! described in QR decomposition.
! 
! Task
! 
! Demonstrate the QR decomposition on the example matrix from the
! Wikipedia article:
! 
! $$A = \begin{pmatrix}
! 12 & -51 & 4 \\
! 6 & 167 & -68 \\
! -4 & 24 & -41 \end{pmatrix}$$
! 
! and the usage for linear least squares problems on the example from
! Polynomial regression. The method of Householder reflections should be
! used:
! 
! Method
! 
! Multiplying a given vector a, for example the first column of matrix A,
! with the Householder matrix H, which is given as
! 
! $$H = I - \frac {2} {u^T u} u u^T$$
! 
! reflects a about a plane given by its normal vector u. When the normal
! vector of the plane u is given as
! 
! u = a−∥a∥₂ e₁
! 
! then the transformation reflects a onto the first standard basis vector
! 
! e₁ = [1 0 0 ...]^(T)
! 
! which means that all entries but the first become zero. To avoid
! numerical cancellation errors, we should take the opposite sign of a₁:
! 
! u = a + sign(a₁)∥a∥₂ e₁
! 
! and normalize with respect to the first element:
! 
! $$v = \frac{u}{u_1}$$
! 
! The equation for H thus becomes:
! 
! $$H = I - \frac {2} {v^T v} v v^T$$
! 
! or, in another form
! 
! H = I − βvv^(T)
! 
! with
! 
! $$\beta = \frac {2} {v^T v}$$
! 
! Applying H on a then gives
! 
! H a = −sign(a₁) ∥a∥₂ e₁
! 
! and applying H on the matrix A zeroes all subdiagonal elements of the
! first column:
! 
! $$H_1 \; A = \begin{pmatrix}
! r_{11} & r_{12} & r_{13} \\
! 0    & *    & * \\
! 0    & *    & * \end{pmatrix}$$
! 
! In the second step, the second column of A, we want to zero all elements
! but the first two, which means that we have to calculate H with the
! first column of the submatrix (denoted *), not on the whole second
! column of A.
! 
! To get H₂, we then embed the new H into an m × n identity:
! 
! $$H_2 = \begin{pmatrix}
! 1 & 0 & 0 \\
! 0 & H & \\
! 0 &   & \end{pmatrix}$$
! 
! This is how we can, column by column, remove all subdiagonal elements of
! A and thus transform it into R.
! 
! H_(n) ... H₃H₂H₁A = R
! 
! The product of all the Householder matrices H, for every column, in
! reverse order, will then yield the orthogonal matrix Q.
! 
! H₁H₂H₃ ... H_(n) = Q
! 
! The QR decomposition should then be used to solve linear least squares
! (Multiple regression) problems Ax = b by solving
! 
! R x = Q^(T) b
! 
! When R is not square, i.e. m > n we have to cut off the m − n zero
! padded bottom rows.
! 
! $$R =
! \begin{pmatrix}
! R_1 \\
! 0 \end{pmatrix}$$
! 
! and the same for the RHS:
! 
! $$Q^T \; b =
! \begin{pmatrix}
! q_1 \\
! q_2 \end{pmatrix}$$
! 
! Finally, solve the square upper triangular system by back substitution:
! 
! R₁ x = q₁


