! An equilibrium index of a sequence is an index into the sequence such
! that the sum of elements at lower indices is equal to the sum of
! elements at higher indices.
! 
! For example, in a sequence A:
! 
!         A₀ = −7
!         A₁ = 1
!         A₂ = 5
!         A₃ = 2
!         A₄ = −4
!         A₅ = 3
!         A₆ = 0
! 
! 3 is an equilibrium index, because:
! 
!         A₀ + A₁ + A₂ = A₄ + A₅ + A₆
! 
! 6 is also an equilibrium index, because:
! 
!         A₀ + A₁ + A₂ + A₃ + A₄ + A₅ = 0
! 
! (sum of zero elements is zero)
! 
! 7 is not an equilibrium index, because it is not a valid index of
! sequence A.
! 
! Task;
! 
! Write a function that, given a sequence, returns its equilibrium indices
! (if any).
! 
! Assume that the sequence may be very long.

( scratchpad ) { -7 1 5 2 -4 3 0 } equilibrium-indices .
V{ 3 6 }