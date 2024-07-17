! In cases of special objects (such as with matrices) the operation of
! multiplication can be excessively expensive. In these cases the
! operation of multiplication should be avoided or reduced to a minimum.
! 
! In mathematics and computer science, optimal addition-chain
! exponentiation is a method of exponentiation by positive integer powers
! that requires a minimal number of multiplications. It works by creating
! a shortest addition chain that generates the desired exponent. Each
! exponentiation in the chain can be evaluated by multiplying two of the
! earlier exponentiation results. More generally, addition-chain
! exponentiation may also refer to exponentiation by non-minimal addition
! chains constructed by a variety of algorithms (since a shortest addition
! chain is very difficult to find).
! 
! The shortest addition-chain algorithm requires no more multiplications
! than binary exponentiation and usually less. The first example of where
! it does better is for a¹⁵, where the binary method needs six multiplies
! but a shortest addition chain requires only five:
! 
! a¹⁵ = a × (a × [a × a²]²)² 
! (binary, 6 multiplications)
! 
! a¹⁵ = a³ × ([a³]²)² 
! (shortest addition chain, 5 multiplications) On the other hand, the
! addition-chain method is much more complicated, since the determination
! of a shortest addition chain seems quite difficult: no efficient optimal
! methods are currently known for arbitrary exponents, and the related
! problem of finding a shortest addition chain for a given set of
! exponents has been proven NP-complete.
! 
!   Number of Multiplications   Actual Exponentiation   Specific implementation of Addition Chains to do Exponentiation
!   --------------------------- ----------------------- -----------------------------------------------------------------
!   0                           a¹                      a
!   1                           a²                      a × a
!   2                           a³                      a × a × a
!   2                           a⁴                      (a × a→b) × b
!   3                           a⁵                      (a × a→b) × b × a
!   3                           a⁶                      (a × a→b) × b × b
!   4                           a⁷                      (a × a→b) × b × b × a
!   3                           a⁸                      ((a × a→b) × b→d) × d
!   4                           a⁹                      (a × a × a→c) × c × c
!   4                           a¹⁰                     ((a × a→b) × b→d) × d × b
!   5                           a¹¹                     ((a × a→b) × b→d) × d × b × a
!   4                           a¹²                     ((a × a→b) × b→d) × d × d
!   5                           a¹³                     ((a × a→b) × b→d) × d × d × a
!   5                           a¹⁴                     ((a × a→b) × b→d) × d × d × b
!   5                           a¹⁵                     ((a × a→b) × b × a→e) × e × e
!   4                           a¹⁶                     (((a × a→b) × b→d) × d→h) × h
! 
!   : Table demonstrating how to do Exponentiation using Addition Chains
! 
! The number of multiplications required follows this sequence: 0, 1, 2,
! 2, 3, 3, 4, 3, 4, 4, 5, 4, 5, 5, 5, 4, 5, 5, 6, 5, 6, 6, 6, 5, 6, 6, 6,
! 6, 7, 6, 7, 5, 6, 6, 7, 6, 7, 7, 7, 6, 7, 7, 7, 7, 7, 7, 8, 6, 7, 7, 7,
! 7, 8, 7, 8, 7, 8, 8, 8, 7, 8, 8, 8, 6, 7, 7, 8, 7, 8, 8, 9, 7, 8, 8, 8,
! 8, 8, 8, 9, 7, 8, 8, 8, 8, 8, 8, 9, 8, 9, 8, 9, 8, 9, 9, 9, 7, 8, 8, 8,
! 8...
! 
! This sequence can be found at: http://oeis.org/A003313
! 
! Task requirements:
! 
! Using the following values: $A=\begin{bmatrix}
!   \sqrt{\frac{1}{2}} & 0          &\sqrt{\frac{1}{2}} & 0          & 0 & 0 &\\
!    0          &\sqrt{\frac{1}{2}} & 0          &\sqrt{\frac{1}{2}} & 0 & 0 &\\
!    0          &\sqrt{\frac{1}{2}} & 0          &-\sqrt{\frac{1}{2}} & 0 & 0 &\\
!   -\sqrt{\frac{1}{2}} & 0          &\sqrt{\frac{1}{2}} & 0          & 0 & 0 &\\
!    0          & 0          & 0          & 0          & 0 & 1 &\\
!    0          & 0          & 0          & 0          & 1 & 0 &\\
! \end{bmatrix}$ m = 31415 and n = 27182
! 
! Repeat task Matrix-exponentiation operator, except use addition-chain
! exponentiation to better calculate:
! 
! A^(m)
! , A^(n) and A^(n × m).
! 
! As an easier alternative to doing the matrix manipulation above,
! generate the addition-chains for 12509, 31415 and 27182 and use
! addition-chain exponentiation to calculate these two equations:
! 
! -   1.00002206445416³¹⁴¹⁵
! -   1.00002550055251²⁷¹⁸²
! 
! Also: Display a count of how many multiplications were done in each
! case.
! 
! Note: There are two ways to approach this task:
! 
! -   Brute force - try every permutation possible and pick one with the
!     least number of multiplications. If the brute force is a simpler
!     algorithm, then present it as a subtask under the subtitle "Brute
!     force", eg ===Brute Force===.
! -   Some clever algorithm - the wikipedia page has some hints, subtitle
!     the code with the name of algorithm.
! 
! Note: Binary exponentiation does not usually produce the best solution.
! Provide only optimal solutions.
! 
! Kudos (κῦδος) for providing a routine that generate sequence A003313 in
! the output.
! 
! Also, see the Rosetta Code task:
! [http://rosettacode.org/wiki/Knuth%27s_power_tree Knuth's power tree].
! 
! Category:Matrices


