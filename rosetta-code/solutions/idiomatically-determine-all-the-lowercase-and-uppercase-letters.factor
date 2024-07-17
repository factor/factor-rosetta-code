! []
! 
! Idiomatically determine all the lowercase and uppercase letters (of the
! Latin [English] alphabet) being used currently by a computer programming
! language. The method should find the letters regardless of the hardware
! architecture that is being used (ASCII, EBCDIC, or other).
! 
! Task requirements
! 
! Display the set of all:
! 
! -   -   lowercase letters
!     -   uppercase letters
! 
! that can be used (allowed) by the computer program,
! 
! where letter is a member of the Latin (English) alphabet: a ──► z and A
! ──► Z.
! 
! You may want to mention what hardware architecture is being used, and if
! applicable, the operating system.
! 
! See also
! 
! -   Idiomatically determine all the characters that can be used for
!     symbols.


USE: math.ranges
CHAR: A CHAR: Z [a,b] >string print
CHAR: a CHAR: z [a,b] >string print

