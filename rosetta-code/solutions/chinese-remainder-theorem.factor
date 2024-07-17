! Suppose n₁, n₂, …, n_(k) are positive integers that are pairwise
! co-prime.
! 
! Then, for any given sequence of integers a₁, a₂, …, a_(k), there exists
! an integer x solving the following system of simultaneous congruences:
! 
!     
! 
!         $\begin{align}
!           x &\equiv a_1 \pmod{n_1} \\
!           x &\equiv a_2 \pmod{n_2} \\
!             &{}\  \  \vdots \\
!           x &\equiv a_k \pmod{n_k}
!         \end{align}$
! 
! Furthermore, all solutions x of this system are congruent modulo the
! product, N = n₁n₂…n_(k).
! 
! Task:
! 
! Write a program to solve a system of linear congruences by applying the
! Chinese Remainder Theorem.
! 
! If the system of equations cannot be solved, your program must somehow
! indicate this.
! 
! (It may throw an exception or return a special false value.)
! 
! Since there are infinitely many solutions, the program should return the
! unique solution s where 0 ≤ s ≤ n₁n₂…n_(k).
! 
! Show the functionality of this program by printing the result such that
! the n's are [3, 5, 7] and the a's are [2, 3, 2].
! 
! Algorithm: The following algorithm only applies if the n_(i)'s are
! pairwise co-prime.
! 
! Suppose, as above, that a solution is required for the system of
! congruences:
! 
!     
! 
!         x ≡ a_(i) (mod  n_(i))  for i = 1, …, k
! 
! Again, to begin, the product N = n₁n₂…n_(k) is defined.
! 
! Then a solution x can be found as follows:
! 
! For each i, the integers n_(i) and N/n_(i) are co-prime.
! 
! Using the Extended Euclidean algorithm, we can find integers r_(i) and
! s_(i) such that r_(i)n_(i) + s_(i)N/n_(i) = 1.
! 
! Then, one solution to the system of simultaneous congruences is:
! 
!     
! 
!         $x = \sum_{i=1}^k a_i s_i N/n_i$
! 
! and the minimal solution,
! 
!     
! 
!         x (mod  N).

USING: math.algebra prettyprint ;
{ 2 3 2 } { 3 5 7 } chinese-remainder .
