! The arithmetic derivative of an integer (more specifically, the Lagarias
! arithmetic derivative) is a function defined for integers, based on
! prime factorization, by analogy with the product rule for the derivative
! of a function that is used in mathematical analysis. Accordingly, for
! natural numbers n, the arithmetic derivative D(n) is defined as follows:
! 
! *D(0) = D(1) = 0.
! *D(p) = 1 for any prime p.
! *D(mn) = D(m)n + mD(n) for any m, n ∈ N. (Leibniz rule for derivatives).
! 
! Additionally, for negative integers the arithmetic derivative may be
! defined as −D(−n) for (n < 0).
! 
! Examples
! 
! D(2) = 1 and D(3) = 1 (both are prime) so if mn = 2 ⋅ 3, then
! D(6) = D(2 ⋅ 3) = D(2) ⋅ 3 + 2 ⋅ D(3) = 1 ⋅ 3 + 2 ⋅ 1 = 5.
! 
! D(9) = D(3) ⋅ 3 + 3 ⋅ D(3) = 1 ⋅ 3 + 3 ⋅ 1 = 6
! 
! D(27) = D(3) ⋅ 9 + 3 ⋅ D(9) = 1 ⋅ 9 + 3 ⋅ 6 = 27
! 
! D(30) = D(5) ⋅ 6 + 5 ⋅ D(6) = 1 ⋅ 6 + 5 ⋅ 5 = 31.
! 
! Task
! 
! Find and show the arithmetic derivatives for -99 through 100.
! 
! Stretch task
! 
! Find (the arithmetic derivative of 10^(m)) then divided by 7, where m is
! from 1 to 20.
! 
! See also
! 
! * OEIS:A003415 - a(n) = n' = arithmetic derivative of n.
! *Wikipedia: Arithmetic Derivative


