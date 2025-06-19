! Wavelet Matrix Problem
! 
! The Wavelet Matrix is a compact data structure that operates on a
! sequence of integers S = S₀, S₁, …, S_(N − 1). Each integer S_(i) is
! typically drawn from an alphabet of size σ, often represented as
! integers in the range [0, σ − 1]. The structure is particularly
! efficient for answering various types of queries on the sequence, such
! as rank, select, and range queries.
! 
! Your task is to implement a data structure (or use a conceptual Wavelet
! Matrix) that, after processing an initial sequence S, can efficiently
! answer a series of queries.
! 
! Sequence and Construction Context
! 
! The Wavelet Matrix is conceptually built by considering the binary
! representations of the numbers in the sequence S. It consists of
! L = ⌈log₂σ⌉ levels, one for each bit position from the most significant
! bit (MSB) to the least significant bit (LSB). At each level j (from 0 to
! L − 1, corresponding to the (L − 1 − j)-th bit from MSB):
! 
! 1.  A bitvector B_(j) is constructed. For each number in the current
!     (possibly permuted) sequence, if its (L − 1 − j)-th bit is 1, a 1 is
!     appended to B_(j); otherwise, a 0 is appended.
! 2.  The numbers are then stably reordered for the next level: all
!     numbers for which the (L − 1 − j)-th bit was 0 appear first (in
!     their original relative order), followed by all numbers for which
!     the bit was 1 (also in their original relative order).
! 
! Each bitvector B_(j) is typically augmented to support fast rank
! operations (counting 0s or 1s up to a certain position).


