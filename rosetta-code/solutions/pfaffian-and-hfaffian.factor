! For a given matrix, return the Pfaffian and the hfaffian of the matrix.
! 
! The Pfaffian is given by
! 
!     
! 
!         $\operatorname{Pf}(A) = \frac{1}{2^n n!} \sum_{\sigma \in S_{2n}} \sgn(\sigma) \prod_{i=1}^n A_{\sigma(2i-1), \sigma(2i)}$
! 
! while the hfaffian is given by
! 
!     
! 
!         $\operatorname{hf}(A) = \frac{1}{2^n n!} \sum_{\sigma \in S_{2n}} \prod_{i=1}^n A_{\sigma(2i-1), \sigma(2i)}$
! 
! In both cases the sum is over the permutations σ of the symmetric group
! on 2n elements. (A permutation's sign is 1 if there are an even number
! of inversions and -1 otherwise; see parity of a permutation.)
! 
! Efficient methods for calculating the Pfaffian are known: see for
! example wp:Pfaffian#Efficient computation. However, efficient methods
! for calculating the hfaffian are not known.
! 
! Related task:
! 
! -   Permutations by swapping
! -   Determinant_and_permanent
! 
! FYI: How Many Definitions Does the Pfaffian Have?
! 
! The Pfaffian has multiple definitions depending on the context and
! application. Below are the most common definitions of the Pfaffian:
! 
! 1. Definition via Skew-Symmetric Matrices
! 
! The Pfaffian is often defined as an algebraic object associated with a
! 2n × 2n skew-symmetric matrix. Let A be a 2n × 2n skew-symmetric matrix
! (i.e., A^(T) = −A). The Pfaffian is defined such that:
! 
! det(A) = Pf(A)²
! 
! This means that the determinant of A is the square of its Pfaffian. This
! is one of the most fundamental definitions, as it highlights the
! relationship between the Pfaffian and the determinant.
! 
! 2. Definition via Summation
! 
! The Pfaffian can also be defined explicitly as a summation over
! permutations. Let A = (a_(ij)) be a 2n × 2n skew-symmetric matrix. The
! Pfaffian is then given by:
! 
! $\text{Pf}(A) = \frac{1}{n! 2^n} \sum_{\sigma \in S_{2n}} \text{sgn}(\sigma) \prod_{i=1}^n a_{\sigma(2i-1), \sigma(2i)}$
! 
! Where:
! 
! -   S_(2n) is the symmetric group (the set of all permutations of 2n
!     elements),
! -   sgn(σ) is the sign of the permutation σ,
! -   The product $\prod_{i=1}^n a_{\sigma(2i-1), \sigma(2i)}$ ensures
!     pairwise contributions.
! 
! In practice, the summation is computed over specific subsets of pairings
! to reduce complexity.
! 
! 3. Recursive Definition
! 
! The Pfaffian can also be defined recursively. For a 2n × 2n
! skew-symmetric matrix A, the recursion is as follows:
! 
! -   For n = 1 (A is a 2 × 2 matrix):
! 
!  Pf(A) = a₁₂
! 
! -   For n > 1:
! 
!  $\text{Pf}(A) = \sum_{j=2}^{2n} (-1)^j a_{1j} \cdot \text{Pf}(A_{1j}),$
! 
! where A_(1j) is the submatrix obtained by removing the 1st row and j-th
! column of A.
! 
! This recursive definition is theoretically useful but computationally
! less efficient.
! 
! 4. Definition in Graph Theory
! 
! In graph theory, the Pfaffian is often used to count perfect matchings
! in a graph. For a graph G with 2n vertices, one can define a
! skew-symmetric adjacency matrix A, where the entries of A encode the
! graph's edges and weights. The Pfaffian of A is closely related to the
! number of perfect matchings in G.
! 
! If G is a planar graph, and the weights satisfy specific conditions,
! then:
! 
! Pf(A) = ±Number of Perfect Matchings in G
! 
! This definition is widely used in combinatorics, statistical mechanics,
! and the dimer model.
! 
! 5. Definition via Exterior Algebra
! 
! In the language of exterior algebra, the Pfaffian can be interpreted
! geometrically. Let A be a 2n × 2n skew-symmetric matrix, and define a
! 2-form ω as:
! 
! ω = ∑_(i < j)a_(ij)dx_(i) ∧ dx_(j)
! 
! Then the n-th wedge power of ω satisfies:
! 
! ω^(n) = Pf(A) ⋅ (dx₁ ∧ dx₂ ∧ ⋯ ∧ dx_(2n))
! 
! This interpretation highlights the Pfaffian as a volume form in exterior
! algebra and differential geometry.
! 
! 6. Definition via Block Matrices
! 
! If A is a 2n × 2n skew-symmetric matrix, it can sometimes be expressed
! in terms of block matrices:
! 
! $A = \begin{bmatrix}
! 0 & B \\
! -B^T & 0
! \end{bmatrix}$
! 
! In this case, the Pfaffian can sometimes be defined or computed using
! properties of the block B. This approach is particularly useful in
! physics and statistical mechanics.
! 
! Summary
! 
! The Pfaffian has several equivalent definitions, which can be
! categorized as follows:
! 
! 1.  Algebraic Definition: Defined via the determinant as
!     det(A) = Pf(A)².
! 2.  Combinatorial Definition: Defined as a summation over permutations.
! 3.  Recursive Definition: Defined using submatrices and recursion.
! 4.  Graph Theory Definition: Related to perfect matchings in graphs.
! 5.  Geometric Definition: Defined via exterior algebra and differential
!     forms.
! 6.  Block Matrix Definition: Using the structure of 2n × 2n
!     skew-symmetric matrices.
! 
! Each definition arises naturally in different mathematical and physical
! contexts, and they are all fundamentally equivalent.
! 
! Category:Matrices


