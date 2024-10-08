! Introduction
! 
! Define a subsequence to be any output string obtained by deleting zero
! or more symbols from an input string.
! 
! The Longest Common Subsequence (LCS) is a subsequence of maximum length
! common to two or more strings.
! 
! Let A ≡ A[0]… A[m - 1] and B ≡ B[0]… B[n - 1], m < n be strings drawn
! from an alphabet Σ of size s, containing every distinct symbol in A + B.
! 
! An ordered pair (i, j) will be referred to as a match if A[i] = B[j],
! where 0 ≤ i < m and 0 ≤ j < n.
! 
! The set of matches M defines a relation over matches: M[i, j] ⇔ (i, j) ∈
! M.
! 
! Define a non-strict product-order (≤) over ordered pairs, such that (i1,
! j1) ≤ (i2, j2) ⇔ i1 ≤ i2 and j1 ≤ j2. We define (≥) similarly.
! 
! We say ordered pairs p1 and p2 are comparable if either p1 ≤ p2 or p1 ≥
! p2 holds. If i1 < i2 and j2 < j1 (or i2 < i1 and j1 < j2) then neither
! p1 ≤ p2 nor p1 ≥ p2 are possible, and we say p1 and p2 are incomparable.
! 
! Define the strict product-order (<) over ordered pairs, such that (i1,
! j1) < (i2, j2) ⇔ i1 < i2 and j1 < j2. We define (>) similarly.
! 
! A chain C is a subset of M consisting of at least one element m; and
! where either m1 < m2 or m1 > m2 for every pair of distinct elements m1
! and m2. An antichain D is any subset of M in which every pair of
! distinct elements m1 and m2 are incomparable.
! 
! A chain can be visualized as a strictly increasing curve that passes
! through matches (i, j) in the m*n coordinate space of M[i, j].
! 
! Every Common Sequence of length q corresponds to a chain of cardinality
! q, over the set of matches M. Thus, finding an LCS can be restated as
! the problem of finding a chain of maximum cardinality p.
! 
! According to [Dilworth 1950], this cardinality p equals the minimum
! number of disjoint antichains into which M can be decomposed. Note that
! such a decomposition into the minimal number p of disjoint antichains
! may not be unique.
! 
! Background
! 
! Where the number of symbols appearing in matches is small relative to
! the length of the input strings, reuse of the symbols increases; and the
! number of matches will tend towards O(m*n) quadratic growth. This
! occurs, for example, in the Bioinformatics application of nucleotide and
! protein sequencing.
! 
! The divide-and-conquer approach of [Hirschberg 1975] limits the space
! required to O(n). However, this approach requires O(m*n) time even in
! the best case.
! 
! This quadratic time dependency may become prohibitive, given very long
! input strings. Thus, heuristics are often favored over optimal Dynamic
! Programming solutions.
! 
! In the application of comparing file revisions, records from the input
! files form a large symbol space; and the number of symbols approaches
! the length of the LCS. In this case the number of matches reduces to
! linear, O(n) growth.
! 
! A binary search optimization due to [Hunt and Szymanski 1977] can be
! applied to the basic Dynamic Programming approach, resulting in an
! expected performance of O(n log m). Performance can degrade to O(m*n log
! m) time in the worst case, as the number of matches grows to O(m*n).
! 
! Note
! 
! [Rick 2000] describes a linear-space algorithm with a time bound of
! O(n*s + p*min(m, n - p)).
! 
! Legend
! 
! A, B are input strings of lengths m, n respectively
! p is the length of the LCS
! M is the set of matches (i, j) such that A[i] = B[j]
! r is the magnitude of M
! s is the magnitude of the alphabet Σ of distinct symbols in A + B
! 
! References
! 
! [Dilworth 1950] "A decomposition theorem for partially ordered sets" by
! Robert P. Dilworth, published January 1950, Annals of Mathematics
! [Volume 51, Number 1, pp. 161-166]
! 
! [Goeman and Clausen 2002] "A New Practical Linear Space Algorithm for
! the Longest Common Subsequence Problem" by Heiko Goeman and Michael
! Clausen, published 2002, Kybernetika [Volume 38, Issue 1, pp. 45-66]
! 
! [Hirschberg 1975] "A linear space algorithm for computing maximal common
! subsequences" by Daniel S. Hirschberg, published June 1975
! Communications of the ACM [Volume 18, Number 6, pp. 341-343]
! 
! [Hunt and McIlroy 1976] "An Algorithm for Differential File Comparison"
! by James W. Hunt and M. Douglas McIlroy, June 1976 Computing Science
! Technical Report, Bell Laboratories 41
! 
! [Hunt and Szymanski 1977] "A Fast Algorithm for Computing Longest Common
! Subsequences" by James W. Hunt and Thomas G. Szymanski, published May
! 1977 Communications of the ACM [Volume 20, Number 5, pp. 350-353]
! 
! [Rick 2000] "Simple and fast linear space computation of longest common
! subsequences" by Claus Rick, received 17 March 2000, Information
! Processing Letters, Elsevier Science [Volume 75, pp. 275–281]
! Examples
! 
! The sequences "1234" and "1224533324" have an LCS of "1234":
! 
! 1234
! 1224533324
! 
! For a string example, consider the sequences "thisisatest" and
! "testing123testing". An LCS would be "tsitest":
! 
! thisisatest
! testing123testing
! 
! In this puzzle, your code only needs to deal with strings. Write a
! function which returns an LCS of two strings (case-sensitive). You don't
! need to show multiple LCS's.
! 
! For more information on this problem please see Wikipedia.

USE: lcs
"thisisatest" "testing123testing" lcs print
