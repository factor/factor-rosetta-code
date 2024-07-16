! The convolution of two functions F and H of an integer variable is
! defined as the function G satisfying
! 
! $$G(n) = \sum_{m=-\infty}^{\infty} F(m) H(n-m)$$
! 
! for all integers n. Assume F(n) can be non-zero only for 0 ≤ n ≤ |F|,
! where |F| is the "length" of F, and similarly for G and H, so that the
! functions can be modeled as finite sequences by identifying
! f₀, f₁, f₂, … with F(0), F(1), F(2), …, etc. Then for example, values of
! |F| = 6 and |H| = 5 would determine the following value of g by
! definition.
! 
! $$\begin{array}{lllllllllll}
! g_0 &= &f_0h_0\\
! g_1 &= &f_1h_0 &+ &f_0h_1\\
! g_2 &= &f_2h_0 &+ &f_1h_1 &+ &f_0h_2\\
! g_3 &= &f_3h_0 &+ &f_2h_1 &+ &f_1h_2 &+ &f_0h_3\\
! g_4 &= &f_4h_0 &+ &f_3h_1 &+ &f_2h_2 &+ &f_1h_3 &+ &f_0h_4\\
! g_5 &= &f_5h_0 &+ &f_4h_1 &+ &f_3h_2 &+ &f_2h_3 &+ &f_1h_4\\
! g_6 &= &       &  &f_5h_1 &+ &f_4h_2 &+ &f_3h_3 &+ &f_2h_4\\
! g_7 &= &       &  &       &  &f_5h_2 &+ &f_4h_3 &+ &f_3h_4\\
! g_8 &= &       &  &       &  &       &  &f_5h_3 &+ &f_4h_4\\
! g_9 &= &       &  &       &  &       &  &       &  &f_5h_4
! \end{array}$$
! 
! We can write this in matrix form as:
! 
! $$\left( 
! \begin{array}{l}
! g_0 \\
! g_1 \\
! g_2 \\
! g_3 \\
! g_4 \\
! g_5 \\
! g_6 \\
! g_7 \\
! g_8 \\
! g_9 \\
! \end{array}
! \right) = \left(
! \begin{array}{lllll}
! f_0\\
! f_1 & f_0\\
! f_2 & f_1 & f_0\\
! f_3 & f_2 & f_1 & f_0\\
! f_4 & f_3 & f_2 & f_1 & f_0\\
! f_5 & f_4 & f_3 & f_2 & f_1\\
!     & f_5 & f_4 & f_3 & f_2\\
!     &     & f_5 & f_4 & f_3\\
!     &     &     & f_5 & f_4\\
!     &     &     &     & f_5
! \end{array}
! \right) \; \left(
! \begin{array}{l}
! h_0 \\
! h_1 \\
! h_2 \\
! h_3 \\
! h_4 \\
! \end{array} \right)$$
! 
! or
! 
! g = A h
! 
! For this task, implement a function (or method, procedure, subroutine,
! etc.) deconv to perform deconvolution (i.e., the inverse of convolution)
! by constructing and solving such a system of equations represented by
! the above matrix A for h given f and g.
! 
! -   The function should work for G of arbitrary length (i.e., not hard
!     coded or constant) and F of any length up to that of G. Note that
!     |H| will be given by |G| − |F| + 1.
! -   There may be more equations than unknowns. If convenient, use a
!     function from a library that finds the best fitting solution to an
!     overdetermined system of linear equations (as in the Multiple
!     regression task). Otherwise, prune the set of equations as needed
!     and solve as in the Reduced row echelon form task.
! -   Test your solution on the following data. Be sure to verify both
!     that deconv(g, f) = h and deconv(g, h) = f and display the results
!     in a human readable form.
! 
! h = [-8,-9,-3,-1,-6,7]
! 
! f = [-3,-6,-1,8,-6,3,-1,-9,-9,3,-2,5,2,-2,-7,-1]
! 
! g =
! [24,75,71,-34,3,22,-45,23,245,25,52,25,-67,-96,96,31,55,36,29,-43,-7]

