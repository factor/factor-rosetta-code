! Task:
! 
! Demonstrate a method of deriving the Cyclic Redundancy Check from within
! the language.
! 
! The result should be in accordance with ISO 3309, ITU-T V.42, Gzip and
! PNG.
! 
! Algorithms are described on Computation of CRC in Wikipedia. This
! variant of CRC-32 uses LSB-first order, sets the initial CRC to
! FFFFFFFF₁₆, and complements the final CRC.
! 
! For the purpose of this task, generate a CRC-32 checksum for the ASCII
! encoded string:
! 
!         The quick brown fox jumps over the lazy dog

