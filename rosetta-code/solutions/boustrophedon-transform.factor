! A boustrophedon transform is a procedure which maps one sequence to
! another using a series of integer additions.
! 
! Generally speaking, given a sequence: (a₀, a₁, a₂, …), the boustrophedon
! transform yields another sequence: (b₀, b₁, b₂, …), where b₀ is likely
! defined equivalent to a₀.
! 
! There are a few different ways to effect the transform. You may
! construct a boustrophedon triangle and read off the edge values, or, may
! use the recurrence relationship:
! 
! T_(k, 0) = a_(k)
! 
! T_(k, n) = T_(k, n − 1) + T_(k − 1, k − n)
! 
! with 
! 
!   k, n ∈ ℕ
! 
!   k ≥ n > 0
! .
! 
! The transformed sequence is defined by b_(n) = T_(n, n) (for T_(2, 2)
! and greater indices).
! 
! You are free to use a method most convenient for your language. If the
! boustrophedon transform is provided by a built-in, or easily and freely
! available library, it is acceptable to use that (with a pointer to where
! it may be obtained).
! 
! Task
! 
! -   Write a procedure (routine, function, subroutine, whatever it may be
!     called in your language) to perform a boustrophedon transform to a
!     given sequence.
! -   Use that routine to perform a boustrophedon transform on a few
!     representative sequences. Show the first fifteen values from the
!     transformed sequence.
! 
!     Use the following sequences for demonstration:
! 
! -   -   (1, 0, 0, 0, …) ( one followed by an infinite series of zeros )
!     -   (1, 1, 1, 1, …) ( an infinite series of ones )
!     -   (1, −1, 1, −1, …) ( (-1)^n: alternating 1, -1, 1, -1 )
!     -   (2, 3, 5, 7, 11, …) ( sequence of prime numbers )
!     -   (1, 1, 2, 3, 5, …) ( sequence of Fibonacci numbers )
!     -   (1, 1, 2, 6, 24, …) ( sequence of factorial numbers )
! 
! Stretch
! 
! If your language supports big integers, show the first and last 20
! digits, and the digit count of the 1000th element of each sequence.
! 
! See also
! * Wikipedia - Boustrophedon transform
! * OEIS:A000111 - Euler, or up/down numbers
! * OEIS:A000667 - Boustrophedon transform of all-1's sequence
! * OEIS:A062162 - Boustrophedon transform of (-1)^n
! * OEIS:A000747 - Boustrophedon transform of primes
! * OEIS:A000744 - Boustrophedon transform of Fibonacci numbers
! * OEIS:A230960 - Boustrophedon transform of factorials


