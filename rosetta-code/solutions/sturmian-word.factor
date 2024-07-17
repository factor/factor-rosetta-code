! A Sturmian word is a binary sequence, finite or infinite, that makes up
! the cutting sequence for a positive real number x, as shown in the
! picture. [Example Sturmian word when x = 0.618..., the golden ratio.]
! The Sturmian word can be computed thus as an algorithm:
! 
! -   If x > 1, then it is the inverse of the Sturmian word for 1/x. So we
!     have reduced to the case of 0 < x ≤ 1.
! -   Iterate over floor(1x), floor(2x), floor(3x), …
! -   If kx is an integer, then the program terminates. Else, if
!     floor((k − 1)x) = floor(kx), then the program outputs 0, else, it
!     outputs 10.
! 
! The problem:
! 
! -   Given a positive rational number $\frac mn$, specified by two
!     positive integers m, n, output its entire Sturmian word.
! -   Given a quadratic real number $\frac{b\sqrt{a} + m}{n} > 0$,
!     specified by integers a, b, m, n, where a is not a perfect square,
!     output the first k letters of Sturmian words when given a positive
!     number k.
! 
! (If the programming language can represent infinite data structures,
! then that works too.)
! 
! A simple check is to do this for the inverse golden ratio
! $\frac{\sqrt{5}-1}{2}$, that is, a = 5, b = 1, m = −1, n = 2, which
! would just output the Fibonacci word.
! 
! Stretch goal: calculate the Sturmian word for other kinds of definable
! real numbers, such as cubic roots.
! 
! The key difficulty is accurately calculating $floor(k\sqrt a)$ for large
! k. Floating point arithmetic would lose precision. One can either do
! this simply by directly searching for some integer a′ such that
! a′² ≤ k²a < (a′ + 1)², or by more trickly methods, such as the continued
! fraction approach.
! 
! First calculate the continued fraction convergents to $\sqrt a$. Let
! $\frac mn$ be a convergent to $\sqrt a$, such that n ≥ k, then since the
! convergent sequence is the best rational approximant for denominators up
! to that point, we know for sure that, if we write out
! $\frac{0}{k}, \frac{1}{k}, \dots$, the sequence would stride right
! across the gap (m/n, 2x − m/n). Thus, we can take the largest l such
! that l/k ≤ m/n, and we would know for sure that $l = floor(k\sqrt a)$.
! 
! In summary, $floor(k\sqrt a) = floor(mk/n)$ where m/n is the first
! continued fraction approximant to $\sqrt a$ with a denominator n ≥ k


