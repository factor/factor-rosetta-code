! The discrete Fourier transform is a linear, invertible transformation
! which transforms an arbitrary sequence of complex numbers to another
! sequence of complex numbers of the same length. The Fast Fourier
! transform (FFT) is an efficient implementation of this mechanism, but
! one which only works for sequences which have a length which is a power
! of 2.
! 
! The discrete Fourier transform is a useful testing mechanism to verify
! the correctness of code bases which use or implement the FFT.
! 
! For this task:
! 
! 1.  Implement the discrete fourier transform
! 2.  Implement the inverse fourier transform
! 3.  (optional) implement a cleaning mechanism to remove small errors
!     introduced by floating point representation.
! 4.  Verify the correctness of your implementation using a small sequence
!     of integers, such as 2 3 5 7 11
! 
! The fourier transform of a sequence x_(n) of length N is given by:
! 
! $X_{n} = \sum_{k=0}^{N-1} x_{k}\cdot e^{-i \frac{2 \pi}{N} k n}$
! 
! The inverse transform is given by:
! $x_{n} = \frac{1}{N} \sum_{k=0}^{N-1} X_{k}\cdot e^{i \frac{2 \pi}{N} k n}$


