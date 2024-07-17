! GOST 28147-89 is a standard symmetric encryption based on a Feistel
! network.
! 
! The structure of the algorithm consists of three levels:
! 
! 1.  encryption modes - simple replacement, application range, imposing a
!     range of feedback and authentication code generation;
! 2.  cycles - 32-З, 32-Р and 16-З, is a repetition of the main step;
! 3.  main step, a function that takes a 64-bit block of text and one of
!     the eight 32-bit encryption key elements, and uses the replacement
!     table (8x16 matrix of 4-bit values), and returns encrypted block.
! 
! Task:
! 
! Implement the main step of this encryption algorithm.


