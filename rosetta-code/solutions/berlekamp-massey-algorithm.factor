! The Berlekamp–Massey algorithm is an efficient algorithm for finding the
! shortest linear feedback shift register (LFSR) that generates a given
! sequence over a finite field. It determines the minimal polynomial of a
! linearly recurrent sequence, which is crucial in applications like
! error-correcting codes, cryptography, and sequence analysis.
! 
! Overview
! 
! Given a sequence of elements s₀, s₁, …, s_(n − 1) from a finite field,
! the Berlekamp–Massey algorithm computes the shortest LFSR, characterized
! by its connection polynomial C(x) = 1 + c₁x + c₂x² + … + c_(L)x^(L),
! such that the sequence satisfies the recurrence relation:
! 
! $$s_{i+L} = -\sum_{k=1}^L c_k s_{i+L-k}$$
! for all valid indices. The degree L of the polynomial is the linear
! complexity of the sequence, representing the length of the shortest
! LFSR.
! 
! History
! 
! The algorithm was independently developed by Elwyn Berlekamp in 1968 for
! decoding BCH codes and by James Massey in 1969 for cryptographic
! applications. It remains a cornerstone in coding theory and sequence
! analysis.
! 
! Algorithm Description
! 
! The Berlekamp–Massey algorithm iteratively constructs the connection
! polynomial by processing the input sequence element by element. It
! maintains a current polynomial C(x) and updates it whenever a
! discrepancy is found between the predicted and actual sequence values.
! The key steps are:
! 
! 1. Initialize C(x) = 1, degree L = 0, and a temporary polynomial
! B(x) = 1.
! 
! 2. For each sequence element s_(i):
! 
!   * Compute the discrepancy $\Delta = s_i + \sum_{k=1}^L c_k s_{i-k}$.
!   * If Δ ≠ 0:
!     * Update C(x) ← C(x) − ΔxB(x).
!     * If the discrepancy indicates a need for a longer LFSR (i.e., 2L ≤ i), update L and adjust B(x).
! 
! 3. Output C(x) and L.
! 
! The algorithm runs in O(n²) time, where n is the sequence length, and
! uses O(n) space.
! 
! Applications
! 
! -   Error Correction: Used in decoding Reed–Solomon codes and BCH codes.
! -   Cryptography: Analyzes the linear complexity of sequences in stream
!     ciphers to assess security.
! -   Sequence Analysis: Identifies patterns in sequences for signal
!     processing and data compression.
! 
! Example
! 
! For the binary sequence 0, 0, 1, 1, 0, 1, 0 over GF(2), the algorithm
! yields the connection polynomial C(x) = 1 + x + x³, indicating a linear
! complexity of 3.


