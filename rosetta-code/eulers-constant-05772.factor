! Task.
! 
! Compute the Euler constant 0.5772...
! 
! Discovered by Leonhard Euler around 1730, it is the most ubiquitous
! mathematical constant after pi and e, but appears more arcane than
! these.
! 
! Denoted gamma (γ), it measures the amount by which the partial sums of
! the harmonic series (the simplest diverging series) differ from the
! logarithmic function (its approximating integral): .
! 
! The definition of γ converges too slowly to be numerically useful, but
! in 1735 Euler himself applied his recently discovered summation formula
! to compute ‘the notable number’ accurate to 15 places. For a
! single-precision implementation this is still the most economic
! algorithm.
! 
! In 1961, the young Donald Knuth used Euler's method to evaluate γ to
! 1271 places. Knuth found that the computation of the Bernoulli numbers
! required in the Euler-Maclaurin formula was the most time-consuming part
! of the procedure.
! 
! The next year Dura Sweeney computed 3566 places, using a formula based
! on the expansion of the exponential integral which didn't need Bernoulli
! numbers. It's a bit-hungry method though: 2d digits of working precision
! obtain d correct places only.
! 
! This was remedied in 1988 by David Bailey; meanwhile Richard Brent and
! Ed McMillan had published an even more efficient algorithm based on
! Bessel function identities and found 30100 places in 20 hours time.
! 
! Nowadays the old records have far been exceeded: over decimal places are
! already known. These massive computations suggest that γ is neither
! rational nor algebraic, but this is yet to be proven.
! 
! References.
! 
! 1 Gourdon and Sebah, The Euler constant γ. (for all formulas)
! 
! 2 Euler's original journal article translated from the latin (p. 9)
! 
! __TOC__

