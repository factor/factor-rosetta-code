! Geometric algebra is another name for Clifford algebras and it's
! basically an algebra containing a vector space 𝒱 and obeying the
! following axioms:
! 
! $$\begin{array}{c}
! (ab)c = a(bc)\\
! a(b+c) = ab+ac\\
! (a+b)c = ac+bc\\
! \forall \mathbf{x}\in\mathcal{V},\,\mathbf{x}^2\in\R
! \end{array}$$
! 
! The product operation in such algebra is called the geometric product.
! Elements are called multivectors, while multivectors in 𝒱 are just
! called vectors.
! 
! There are a few simple examples of geometric algebras. A trivial one for
! instance is simply $\R$, where $\mathcal{V} = \R$. The complex numbers
! also form a geometric algebra, where the vector space is the
! one-dimensional space of all purely imaginary numbers. Another example
! is the space of quaternions, where the vector space is the
! three-dimensional space of all linear combinations of (i, j, k).
! 
! The purpose of this task is to implement a geometric algebra with a
! vector space 𝒱 of dimension n of at least five, but for extra-credit you
! can implement a version with n arbitrary large. Using a dimension five
! is useful as it is the dimension required for the so-called conformal
! model which will be the subject of a derived task.
! 
! To ensure the unicity of the solution (that is, up to some isomorphism),
! we will also restrict ourselves to the so-called euclidean case, where
! the square of a non-zero vector is positive:
! 
! ∀x ∈ 𝒱, x ≠ 0 ⟹ x² > 0.
! 
! You can of course, for extra credit, implement the general case. This
! would require the definition of a parameter for the signature of the
! metric.
! 
! In order to show that your solution uses a vector space of dimension at
! least five, you will create a function n -> e(n) such that the vectors
! e(0), e(1), e(2), e(3), e(4) are linearly independent. To do so you will
! make them orthonormal with the following scalar product:
! 
! x ⋅ y = (xy + yx)/2
! 
! The fact that this so-called inner product defines a scalar product is a
! consequence of the fourth axiom. To see it one just needs to notice the
! relation:
! 
! xy + yx = (x + y)² − x² − y²
! 
! Once you'll have shown that your vector space is at least of dimension
! five, you will show that the axioms are satisfied. For this purpose you
! will pick three random multivectors a, b and c, along with a random
! vector x.
! 
! Producing a random vector is easy. Just use a pseudo-random generation
! function rand and create a vector:
! 
! $\mathrm{randomVector}() = \sum_{i=0}^4 \mathrm{rand}() \mathbf{e}_i$
! 
! Producing a random multivector is slightly more involved. It is known
! that when the dimension of 𝒱 is n, then the dimension of the algebra
! (seen as a vector space with its natural scalar multiplication) is
! 2^(n). This means that for n=5 there is a basis of 2⁵ = 32 basis
! multivectors from which any multivector can be written as a linear
! combination. Create such a basis m₀, m₁, …, m₃₁ along with a function
! producting a random multivector:
! 
! $\mathrm{randomMultivector}() = \sum_{i=0}^{31} \mathrm{rand}() m_i$
! 
! To summarize, to solve this task you will:
! 
! -   define the inner product of two vectors : x ⋅ y = (xy + yx)/2.
! -   define the function e
! -   verify the orthonormality e_(i) ⋅ e_(j) = δ_(i, j) for i, j in
!     {0, 1, 2, 3, 4}.
! -   create a function returning a random multivector
! -   create a function returning a random vector
! -   verify the axioms for three rarndom multivectors a, b, c and a
!     random vector x.
! 
! Optionally, you will repeat the last step a large number of times, in
! order to increase confidence in the result.


