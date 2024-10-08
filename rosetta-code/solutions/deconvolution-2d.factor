! This task is a straightforward generalization of Deconvolution/1D to
! higher dimensions. For example, the one dimensional case would be
! applicable to audio signals, whereas two dimensions would pertain to
! images. Define the discrete convolution in d dimensions of two functions
! 
! H, F : ℤ^(d) → ℝ
! 
! taking d-tuples of integers to real numbers as the function
! 
! G : ℤ^(d) → ℝ
! 
! also taking d-tuples of integers to reals and satisfying
! 
! $$G(n_0, \dots, n_{d-1})=\sum_{m_0=-\infty}^{\infty}\dots\sum_{m_{d-1}=-\infty}^{\infty}F(m_0, \dots, m_{d-1})H(n_0-m_0, \dots, n_{d-1}-m_{d-1})$$
! 
! for all d-tuples of integers (n₀, …, n_(d − 1)) ∈ ℤ^(d). Assume F and H
! (and therefore G) are non-zero over only a finite domain bounded by the
! origin, hence possible to represent as finite multi-dimensional arrays
! or nested lists f, h, and g.
! 
! For this task, implement a function (or method, procedure, subroutine,
! etc.) deconv to perform deconvolution (i.e., the inverse of convolution)
! by solving for h given f and g. (See Deconvolution/1D for details.)
! 
! -   The function should work for g of arbitrary length in each dimension
!     (i.e., not hard coded or constant) and f of any length up to that of
!     g in the corresponding dimension.
! -   The deconv function will need to be parameterized by the dimension d
!     unless the dimension can be inferred from the data structures
!     representing g and f.
! -   There may be more equations than unknowns. If convenient, use a
!     function from a library that finds the best fitting solution to an
!     overdetermined system of linear equations (as in the Multiple
!     regression task). Otherwise, prune the set of equations as needed
!     and solve as in the Reduced row echelon form task.
! -   Debug your solution using this test data, of which a portion is
!     shown below. Be sure to verify both that the deconvolution of g with
!     f is h and that the deconvolution of g with h is f. Display the
!     results in a human readable form for the three dimensional case
!     only.
! 
! dimension 1:
! 
!     h: [-8, 2, -9, -2, 9, -8, -2]
!     f: [ 6, -9, -7, -5]
!     g: [-48, 84, -16, 95, 125, -70, 7, 29, 54, 10]
! 
! dimension 2:
! 
!     h: [
!           [-8, 1, -7, -2, -9, 4], 
!           [4, 5, -5, 2, 7, -1], 
!           [-6, -3, -3, -6, 9, 5]]
!     f: [
!           [-5, 2, -2, -6, -7], 
!           [9, 7, -6, 5, -7], 
!           [1, -1, 9, 2, -7], 
!           [5, 9, -9, 2, -5], 
!           [-8, 5, -2, 8, 5]]
!     g: [
!           [40, -21, 53, 42, 105, 1, 87, 60, 39, -28], 
!           [-92, -64, 19, -167, -71, -47, 128, -109, 40, -21], 
!           [58, 85, -93, 37, 101, -14, 5, 37, -76, -56], 
!           [-90, -135, 60, -125, 68, 53, 223, 4, -36, -48], 
!           [78, 16, 7, -199, 156, -162, 29, 28, -103, -10], 
!           [-62, -89, 69, -61, 66, 193, -61, 71, -8, -30], 
!           [48, -6, 21, -9, -150, -22, -56, 32, 85, 25]]
! 
! dimension 3:
! 
!     h: [
!           [[-6, -8, -5, 9], [-7, 9, -6, -8], [2, -7, 9, 8]], 
!           [[7, 4, 4, -6], [9, 9, 4, -4], [-3, 7, -2, -3]]]
!     f: [
!           [[-9, 5, -8], [3, 5, 1]], 
!           [[-1, -7, 2], [-5, -6, 6]], 
!           [[8, 5, 8],[-2, -6, -4]]]
!     g: [
!           [
!              [54, 42, 53, -42, 85, -72], 
!              [45, -170, 94, -36, 48, 73], 
!              [-39, 65, -112, -16, -78, -72], 
!              [6, -11, -6, 62, 49, 8]], 
!           [
!              [-57, 49, -23, 52, -135, 66], 
!              [-23, 127, -58, -5, -118, 64], 
!              [87, -16, 121, 23, -41, -12], 
!              [-19, 29, 35, -148, -11, 45]], 
!           [
!              [-55, -147, -146, -31, 55, 60], 
!              [-88, -45, -28, 46, -26, -144], 
!              [-12, -107, -34, 150, 249, 66], 
!              [11, -15, -34, 27, -78, -50]], 
!           [
!              [56, 67, 108, 4, 2, -48], 
!              [58, 67, 89, 32, 32, -8], 
!              [-42, -31, -103, -30, -23, -8],
!              [6, 4, -26, -10, 26, 12]]]


