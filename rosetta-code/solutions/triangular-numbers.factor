! A triangular number is a count of objects arranged into an equilateral
! triangle. Much like how a square number is a count of objects arranged
! into a square.
! 
! The nth triangular number is the sum of the first n non-negative
! integers. $T_n= \sum_{k=1}^n k = 1+2+3+ \dotsb +n$
! 
! Triangular numbers may be calculated by the explicit formulas:
! $T_n = \frac{n(n+1)}{2} = {n+1 \choose 2}$
! 
! where $\textstyle {n+1 \choose 2}$ is the binomial coefficient "n plus
! one choose two".
! 
! Analogous to square roots, we may also calculate a triangular root.
! Numbers that have an integer triangular root are triangular numbers.
! 
! The real triangular root of a number x may be found using:
! $n = \frac{\sqrt{8x+1}-1}{2}$
! 
! Similar to how cubic numbers are square numbers extended into a third
! dimension, triangular numbers extended into a third dimension are known
! as tetrahedral numbers.
! 
! The nth tetrahedral number is the sum of the first n triangular numbers.
! $Te_n= \sum_{k=1}^n T_k$
! 
! Or, may be calculated directly:
! $Te_n = \frac{n(n+1)(n+2)}{6} = \frac{n^{\overline 3}}{3!} = \binom{n+2}{3}$
! (Binomial "n plus two choose three".)
! 
! One may find the real tetrahedral root of x using the formula:
! $n = \sqrt[3]{3x+\sqrt{9{x^2}-\frac{1}{27}}} +\sqrt[3]{3x-\sqrt{9{x^2}-\frac{1}{27}}} -1$
! 
! Depending on the math precision of your particular language, may need to
! be rounded to the nearest 1e-16 or so.
! 
! Extending into a fourth dimension we get pentatopic numbers.
! 
! Again, the nth pentatope is the sum of the first n tetrahedral numbers,
! $P_n = \sum_{k=1}^n Te_k$
! 
! or explicitly: $P_n = \frac{n(n+1)(n+2)(n+3)}{24} = \binom{n + 3}{4}$
! (Binomial "n plus three choose four".)
! 
! The pentatopic real root of x may be found using:
! $n = \frac{\sqrt{5+4\sqrt{24x+1}} - 3}{2}.$
! 
! In general, these all belong to the class figurate numbers as they are
! based on r dimensional geometric figures. Sometimes they are referred to
! as r-simplex numbers. In geometry a simplex is the simplest possible
! r-dimensional object.
! 
! You may easily extend to an arbitrary dimension r using binomials. Each
! term n in dimension r is $r_n = \binom{n + r - 1}{r}$
! 
! There is no known general formula to find higher r-simplex roots.
! 
! Task
! 
! -   Find and display the first 30 triangular numbers (r = 2).
! -   Find and display the first 30 tetrahedral numbers (r = 3).
! -   Find and display the first 30 pentatopic numbers (r = 4).
! -   Find and display the first 30 12-simplex numbers (r = 12).
! -   Find and display the triangular root, the tetrahedral root, and the
!     pentatopic root for the integers:
!     -   7140
!     -   21408696
!     -   26728085384
!     -   14545501785001
! 
! See also
! * Wikipedia: Triangular numbers
! * Wikipedia: Tetrahedral numbers
! * Wikipedia: Pentatopic numbers
! * Wikipedia: Figurate numbers
! * Wikipedia: Simplex(geometry)
! * OEIS:A000217 - Triangular numbers: a(n) = binomial(n+1,2)
! * OEIS:A000292 - Tetrahedral numbers: a(n) = binomial(n+2,3)
! * OEIS:A000332 - Pentatope numbers: a(n) = binomial(n+3,4)
! * Related task: Evaluate binomial coefficients
! * Related task: Pascal's triangle


