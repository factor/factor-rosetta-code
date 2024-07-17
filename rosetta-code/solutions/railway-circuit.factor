! Railway circuit:
! 
! Given n sections of curve tracks, each one being an arc of 30° of radius
! R.
! 
! The goal is to build and count all possible different railway circuits.
! 
! Constraints:
! 
! -   n = 12 + k*4 (k = 0, 1, ...)
! -   The circuit must be a closed, connected graph, and the last arc must
!     join the first one
! -   Duplicates, either by symmetry, translation, reflexion, or rotation
!     must be eliminated.
! -   Paths may overlap or cross each other.
! -   All tracks must be used.
! 
! Illustrations:
! 
! http://www.echolalie.org/echolisp/duplo.html
! 
! Task:
! 
! Write a function which counts and displays all possible circuits Cn for
! n = 12, 16, 20.
! 
! Extra credit for n = 24, 28, ... 48 (no display, only counts).
! 
! A circuit Cn will be displayed as a list, or sequence of n
! Right=1/Left=-1 turns.
! 
! Examples:
! 
!     
! 
!         C12 = (1,1,1,1,1,1,1,1,1,1,1,1) and
!         C12 = (-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)
! 
! Straight tracks (extra-extra credit):
! 
! Suppose we have m = k*2 sections of straight tracks, each of length L.
! 
! Such a circuit is denoted Cn,m
! 
! A circuit is a sequence of +1, -1, or 0 = straight move.
! 
! Count the number of circuits Cn,m with n same as above and m = 2 to 8


