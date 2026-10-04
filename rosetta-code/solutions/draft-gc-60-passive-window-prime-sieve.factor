! The GC-60 Passive Window Prime Sieve is a divisor-centric algorithm
! designed to isolate prime numbers within a passive search window
! [A, A + W] for arbitrary magnitudes A (supporting ranges well beyond
! 10¹⁹ via 128-bit arithmetic).
! 
! Instead of verifying candidate numbers in the target window directly,
! the GC-60 model treats the window as a passive receiver. The underlying
! infrastructure relies on Module 60 mapped into 16 independent, parallel
! rail tracks based on the coprime residues modulo 60:
! {1, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 49, 53, 59}
! 
! Numbers progress exclusively along their dedicated rail without
! intersecting other tracks. Known divisors translate along these rails
! and project information onto the passive window using an inverse modulo
! relative to the upper margin M = A + W. Divisors whose translation range
! does not hit the window are informationally irrelevant and are filtered
! out beforehand during Phase B.
! 
! Task Requirements
! 
! 1.  CLI Input: Accept magnitude A and window size W directly from
!     command-line arguments (supporting exponential notation such as
!     10^19 10^8 or higher via 128-bit integers).
! 2.  16-Track Parallel Architecture: Partition the candidate search space
!     into the 16 coprime rails of Module 60 using multithreading.
! 3.  Zero-Modulo Phase C: Clear/sieve the target window without
!     performing per-element division or modulo operations.
! 4.  Output File: Write the relative prime offsets (suffixes) in
!     ascending order with respect to base A into a file named
!     finestra_1.txt.


