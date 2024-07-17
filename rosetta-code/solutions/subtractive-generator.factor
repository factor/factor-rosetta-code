! A subtractive generator calculates a sequence of random numbers, where
! each number is congruent to the subtraction of two previous numbers from
! the sequence.
! 
! The formula is
! 
! -   r_(n) = r_((n − i)) − r_((n − j)) (mod  m)
! 
! for some fixed values of i, j and m, all positive integers. Supposing
! that i > j, then the state of this generator is the list of the previous
! numbers from r_(n − i) to r_(n − 1). Many states generate uniform random
! integers from 0 to m − 1, but some states are bad. A state, filled with
! zeros, generates only zeros. If m is even, then a state, filled with
! even numbers, generates only even numbers. More generally, if f is a
! factor of m, then a state, filled with multiples of f, generates only
! multiples of f.
! 
! All subtractive generators have some weaknesses. The formula correlates
! r_(n), r_((n − i)) and r_((n − j)); these three numbers are not
! independent, as true random numbers would be. Anyone who observes i
! consecutive numbers can predict the next numbers, so the generator is
! not cryptographically secure. The authors of Freeciv (utility/rand.c)
! and xpat2 (src/testit2.c) knew another problem: the low bits are less
! random than the high bits.
! 
! The subtractive generator has a better reputation than the linear
! congruential generator, perhaps because it holds more state. A
! subtractive generator might never multiply numbers: this helps where
! multiplication is slow. A subtractive generator might also avoid
! division: the value of r_((n − i)) − r_((n − j)) is always between −m
! and m, so a program only needs to add m to negative numbers.
! 
! The choice of i and j affects the period of the generator. A popular
! choice is i = 55 and j = 24, so the formula is
! 
! -   r_(n) = r_((n − 55)) − r_((n − 24)) (mod  m)
! 
! The subtractive generator from xpat2 uses
! 
! -   r_(n) = r_((n − 55)) − r_((n − 24)) (mod  10⁹)
! 
! The implementation is by J. Bentley and comes from
! program_tools/universal.c of the DIMACS (netflow) archive at Rutgers
! University. It credits Knuth, TAOCP, Volume 2, Section 3.2.2 (Algorithm
! A).
! 
! Bentley uses this clever algorithm to seed the generator.
! 
! 1.  Start with a single seed in range 0 to 10⁹ − 1.
! 2.  Set s₀ = seed and s₁ = 1. The inclusion of s₁ = 1 avoids some bad
!     states (like all zeros, or all multiples of 10).
! 3.  Compute s₂, s₃, ..., s₅₄ using the subtractive formula
!     s_(n) = s_((n − 2)) − s_((n − 1)) (mod  10⁹).
! 4.  Reorder these 55 values so r₀ = s₃₄, r₁ = s₁₃, r₂ = s₄₇, ...,
!     r_(n) = s_((34 * (n + 1) (mod  55))).
!     -   This is the same order as s₀ = r₅₄, s₁ = r₃₃, s₂ = r₁₂, ...,
!         s_(n) = r_(((34 * n) − 1 (mod  55))).
!     -   This rearrangement exploits how 34 and 55 are relatively prime.
! 5.  Compute the next 165 values r₅₅ to r₂₁₉. Store the last 55 values.
! 
! This generator yields the sequence r₂₂₀, r₂₂₁, r₂₂₂ and so on. For
! example, if the seed is 292929, then the sequence begins with
! r₂₂₀ = 467478574, r₂₂₁ = 512932792, r₂₂₂ = 539453717. By starting at
! r₂₂₀, this generator avoids a bias from the first numbers of the
! sequence. This generator must store the last 55 numbers of the sequence,
! so to compute the next r_(n). Any array or list would work; a ring
! buffer is ideal but not necessary.
! 
! Implement a subtractive generator that replicates the sequences from
! xpat2.


