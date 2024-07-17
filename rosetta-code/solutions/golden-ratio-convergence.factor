! The golden ratio can be defined as the continued fraction
! 
! $$\phi = 1 + {1\over{1+{1\over{1+{1\over{1 + \cdots}}}}}}$$
! Thus ϕ = 1 + 1/ϕ. Multiplying both sides by ϕ and solving the resulting
! quadratic equation for its positive solution, one gets
! $\phi = (1 + \sqrt{5})/2 \approx 1.61803398875$.
! 
! The golden ratio has the slowest convergence of any continued fraction,
! as one might guess by noting that the denominators are made of the
! smallest positive integer. This task treats the problem of convergence
! in a somewhat backwards fashion: we are going to iterate the recursion
! ϕ_(n + 1) = 1 + 1/ϕ_(n), ϕ₀ = 1, and see how long it takes to get an
! answer.
! 
! Task
! 
! Iterate ϕ_(n + 1) = 1 + 1/ϕ_(n), ϕ₀ = 1, until
! |ϕ_(n + 1) − ϕ_(n)| ≤ 1 × 10⁻⁵. Report the final value of ϕ_(n + 1), the
! number of iterations required, and the error with respect to
! $(1 + \sqrt{5})/2$.
! 
! See also
! 
! -   Metallic ratios


