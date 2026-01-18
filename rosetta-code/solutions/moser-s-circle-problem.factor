! Moser's circle problem investigates the maximum number of distinct
! regions obtained by picking n random points on a circle and drawing
! chords between them. By necessity, to produce the maximum number, the
! points must be chosen so no three chords intersect at the same point.
! 
! A circle with one point, and chords drawn to every other point (none),
! has one region.
! 
! With two points, and chords connecting them, it has two regions.
! 
! With three points, four.
! 
! With four points, eight.
! 
! With five points, sixteen.
! 
! It seems to be following a steady geometric progression, f(n) = 2^(n),
! but the sequence breaks at six. Six points, with chords drawn between
! them yields thirty-one, not thirty-two regions.
! 
! A direct equation for solving Moser's circle problem for any n:
! 
! $f(n) = \frac{1}{24}(n^4 - 6n^3 + 23n^2 - 18n + 24)$
! 
! But there are many other ways to solve for n,
! 
! using binomials, ($f(n)={n \choose 4}+{n \choose 2}+1$),
! 
! binomial transform (binomial transform of 5 1s followed by infinite 0s)
! 
! or Pascals triangle (sum the first five values of row n)
! 
! among others.
! 
! Task
! 
! Find the Moser's circle problem values f(n) for n = 1..20 in at least
! two different ways.
! 
! See also
! *Wikipedia: Dividing a circle into areas
! *Youtube: Moser's circle problem
! *OEIS: A000127 - Maximal number of regions obtained by joining n points around a circle by straight lines
! *Task: Evaluate binomial coefficients
! *Task: Binomial transform
! *Task: Pascal's triangle
! *Task: Bernoulli's triangle


