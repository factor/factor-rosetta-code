! Apéry's constant is the sum of the reciprocals of the positive cubes.
! 
! That is, it is defined as the number
! $\zeta(3) = \sum_{k=1}^\infty \frac{1}{k^3},$ where ζ is the Riemann
! zeta function.
! 
! Approximately equal to:
! 
!     1.2020569031595942853997381615114499907649862923404988817922715553418382057863130901864558736093352581
! 
! This constant was known and studied by many early mathematicians, but
! was not named until 1978, after Roger Apéry, who was first to prove it
! was an irrational number.
! 
! ζ(3) by summing reciprocal cubes is easy to calculate, but converges
! very slowly. The first 1000 terms are only accurate to 6 decimal places.
! 
! There have been many fast convergence representations developed /
! discovered that generate correct digits much more quickly.
! 
! One of the earliest, discovered in the late 1800s by A. Markov and later
! widely published by Apéry is:
! 
!     $\zeta(3) = \frac{5}{2} \sum_{k=1}^\infty (-1)^{k-1} \frac{k!^2}{(2k)! k^3}.$
! 
! Much better than direct calculation of ζ(3), but still only yielding
! about .63 correct digits per iteration.
! 
! Several even faster converging representions are available. The fastest
! known to date, yielding about 5.04 correct digits per term, is by
! Sebastian Wedeniwski.
! 
!     $\zeta(3) = \frac{1}{24} \sum_{k=0}^\infty (-1)^k \frac{(2k + 1)!^3 (2k)!^3 k!^3 (126392k^5 + 412708k^4 + 531578k^3 + 336367k^2 + 104000k + 12463)}{(3k + 2)! (4k + 3)!^3}.$
! 
! Task
! 
! * Show the value of Apéry's constant calculated at least three different ways.
! :# Show the value of at least the first 1000 terms of ζ(3) by direct summing of reciprocal cubes, truncated to 100 decimal digits.
! :# Show the value of the first 158 terms of Markov / Apéry representation truncated to 100 decimal digits.
! :# Show the value of the first 20 terms of Wedeniwski representation truncated to 100 decimal digits.
! 
! See also
! * Wikipedia: Apéry's constant
! * OEIS:A002117 - Decimal expansion of zeta(3)


