! The Smith–Waterman algorithm is a dynamic programming algorithm used for
! local sequence alignment. It identifies similar regions between two
! sequences by comparing segments and aligning them to optimize a
! similarity score. This algorithm is widely used in bioinformatics for
! comparing DNA, RNA, or protein sequences.
! 
! Problem Description
! 
! Given two sequences, A = a₁, a₂, ..., a_(m) and B = b₁, b₂, ..., b_(n),
! the goal is to find the optimal local alignment between these sequences.
! A local alignment aligns a substring of A with a substring of B to
! maximize a similarity score.
! 
! Scoring System
! 
! The algorithm uses the following scoring system:
! 
! -   +s for a match between two characters.
! -   −d for a mismatch (substitution).
! -   −g for a gap (insertion or deletion).
! 
! Dynamic Programming Matrix
! 
! The algorithm constructs a dynamic programming matrix H of dimensions
! (m + 1) × (n + 1), where H(i, j) represents the optimal alignment score
! between substrings A[1..i] and B[1..j]. The matrix is initialized as:
! 
! H(i, 0) = 0  for all i ∈ [0, m] H(0, j) = 0  for all j ∈ [0, n]
! 
! The recurrence relation used to compute the score is:
! 
! $H(i, j) = \max \begin{cases} 
!     0, \\
!     H(i-1, j-1) + \text{score}(a_i, b_j), \\
!     H(i-1, j) - g, \\
!     H(i, j-1) - g
! \end{cases}$
! 
! Here, score(a_(i), b_(j)) is +s if a_(i) = b_(j) (match) and −d
! otherwise (mismatch).
! 
! Traceback
! 
! To determine the optimal local alignment, traceback is performed
! starting from the cell in H with the maximum value. The traceback
! continues until a cell with a value of 0 is reached, indicating the end
! of the local alignment.
! 
! Output
! 
! The output of the algorithm includes:
! 
! -   The highest alignment score.
! -   The aligned substrings of A and B.
! -   The alignment path in the dynamic programming matrix.
! 
! Example
! 
! Consider the two sequences A = "ACACACTA" and B = "AGCACACA". Using a
! match score of +2, mismatch penalty of −1, and gap penalty of −2, the
! Smith–Waterman algorithm identifies the optimal local alignment with a
! score of 14, aligning the substrings "ACACACT" from A and "GCACACA" from
! B.


