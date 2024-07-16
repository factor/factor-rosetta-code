! The task is to:
! 
!     State the type of random number generator algorithm used in a
!     language's built-in random number generator. If the language or its
!     immediate libraries don't provide a random number generator, skip
!     this task.
!     If possible, give a link to a wider explanation of the algorithm
!     used.
! 
! Note: the task is not to create an RNG, but to report on the languages
! in-built RNG that would be the most likely RNG used.
! 
! The main types of pseudo-random number generator (PRNG) that are in use
! are the Linear Congruential Generator (LCG), and the Generalized
! Feedback Shift Register (GFSR), (of which the Mersenne twister generator
! is a subclass). The last main type is where the output of one of the
! previous ones (typically a Mersenne twister) is fed through a
! cryptographic hash function to maximize unpredictability of individual
! bits.
! 
! Note that neither LCGs nor GFSRs should be used for the most demanding
! applications (cryptography) without additional steps.

