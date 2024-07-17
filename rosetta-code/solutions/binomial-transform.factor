! The binomial transform is a bijective sequence transform based on
! convolution with binomial coefficients.
! 
! It may be thought of as an nth forward difference with odd differences
! carrying a negative sign.
! 
! There are two common variants of binomial transforms, one of which is
! self-inverting; reapplying the transform to a transformed sequence
! returns the original sequence, and one which has separate "forward" and
! "inverse" transform operations.
! 
! The two variants only differ in placement and quantity of signs. The
! variant standardized on by OEIS, with the 'forward' and 'inverse'
! complementary operations, will be used here.
! 
! In this variant, to transform the sequence a to sequence b and back:
! 
! the forward binomial transform is defined as:
! $b_n=\sum_{k=0}^n {n\choose k} a_k.$
! 
! and the inverse binomial transform is defined as:
! $a_n = \sum_{k=0}^n (-1)^{n-k} {n\choose k} b_k$
! 
! where ${n\choose k}$ is the binomial operator 'n choose k'
! 
! For reference, the self inverting binomial transform is defined as:
! $b_n = \sum_{k=0}^n (-1)^{k} {n\choose k} a_k$
! 
! Task
! 
! -   Implement both a forward, and inverse binomial transform routine.
! -   Use those routines to compute the forward binomial transform, the
!     inverse binomial transform, and the inverse of the forward transform
!     (should return original sequence) of a few representative sequences.
! -   Show at least the first 15 values in each sequence.
! 
!     You may generate the sequences, or may choose to just hard code the
!     values.
! 
!     Use the following sequences for testing:
! 
!         Catalan numbers:
!         1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440
!         Prime flip flop sequence: (for a_(n): 1 if prime, 0 otherwise):
!         0 1 1 0 1 0 1 0 0 0 1 0 1 0 0
!         Fibonacci sequence: 0 1 1 2 3 5 8 13 21 34 55 89 144 233 377
!         Padovan sequence: (starting with values 1,0,0):
!         1 0 0 1 0 1 1 1 2 2 3 4 5 7 9
! 
! See also
! * Wikipedia: Binomial transform
! * OEIS wiki: Binomial transform
! * Related task: Evaluate binomial coefficients
! * Related task: Catalan numbers
! * Related task: Riordan numbers
! * Related task: Fibonacci sequence
! * Related task: Padovan sequence
! 
!     first sequence
! 
! * OEIS:A007317 - Binomial transform of Catalan numbers
! * OEIS:A005043 - Riordan numbers (Inverse binomial transform of Catalan numbers)
! 
!     second sequence
! 
! * OEIS:A052467 - Binomial transform of {b(n)}, where b(n)=1 for prime n and b(n)=0 otherwise (Binomial transform of Prime flip-flop sequence 
! 
!     third sequence
! 
! * OEIS:A001906 - F(2n) = bisection of Fibonacci sequence (Binomial transform of Fibonacci sequence)
! * OEIS:A039834 - a(n+2) = -a(n+1) + a(n) (signed Fibonacci numbers) with a(-2) = a(-1) = 1 (Inverse binomial transform of Fibonacci sequence)
! 
!     fourth sequence
! 
! * OEIS:A034943 - Binomial transform of Padovan sequence
! * OEIS:A144413 - a(n) = Sum_{k=0..n} (-1)^k * binomial(n, k) * A000931(n-k+4) (Inverse binomial transform of Padovan sequence)


