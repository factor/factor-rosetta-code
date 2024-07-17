! Given a positive real number, if we truncate its continued fraction
! representation at a certain depth, we obtain a rational approximation to
! the real number. The sequence of successively better such approximations
! is its convergent sequence.
! 
! Problem:
! 
! -   Given a positive rational number $\frac mn$, specified by two
!     positive integers m, n, output its entire sequence of convergents.
! -   Given a quadratic real number $\frac{b\sqrt{a} + m}{n} > 0$,
!     specified by integers a, b, m, n, where a is not a perfect square,
!     output the first k convergents when given a positive number k.
! 
! The output format can be whatever is necessary to represent rational
! numbers, but it probably should be a 2-tuple of integers.
! 
! For example, given a = 2, b = 1, m = 0, n = 1,
! since$\sqrt{2} = 1 + \cfrac{1}{2 + \cfrac{1}{2 + \cfrac{1}{2 + \ddots}}}$the
! program should output (1, 1), (3, 2), (7, 5), (17/12), (41/29), ….
! 
! A simple check is to do this for the golden ratio
! $\frac{\sqrt{5}+1}{2}$, that is, a = 5, b = 1, m = 1, n = 2, which
! should output (1, 1), (2, 1), (3, 2), (5, 3), (8, 5), ….
! 
! Print the results for 415/93, 649/200, $\sqrt{2}$, $\sqrt{5}$, and the
! golden ratio.
! 
! References and related tasks
! 
! -   Wikipedia: Continued fraction
! -   Continued fraction
! -   Continued fraction/Arithmetic
! -   Continued fraction/Arithmetic/Construct from rational number
! -   Calkin-Wilf sequence


