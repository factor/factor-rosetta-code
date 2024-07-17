! In computational number theory, the Tonelli–Shanks algorithm is a
! technique for solving for x in a congruence of the form:
! 
!     
! 
!         x² ≡ n (mod p)
! 
! where n is an integer which is a quadratic residue (mod p), p is an odd
! prime, and x,n ∈ F_(p) where F_(p) = {0, 1, ..., p - 1}.
! 
! It is used in cryptography techniques.
! 
! To apply the algorithm, we need the Legendre symbol:
! 
! The Legendre symbol (a | p) denotes the value of a^((p-1)/2) (mod p).
! 
! -   (a | p) ≡ 1 if a is a square (mod p)
! -   (a | p) ≡ -1 if a is not a square (mod p)
! -   (a | p) ≡ 0 if a ≡ 0 (mod p)
! 
! Algorithm pseudo-code:
! 
! All ≡ are taken to mean (mod p) unless stated otherwise.
! 
! -   Input: p an odd prime, and an integer n .
! -   Step 0: Check that n is indeed a square: (n | p) must be ≡ 1 .
! -   Step 1: By factoring out powers of 2 from p - 1, find q and s such
!     that p - 1 = q2^(s) with q odd .
!     -   If p ≡ 3 (mod 4) (i.e. s = 1), output the two solutions r ≡ ±
!         n^((p+1)/4) .
! -   Step 2: Select a non-square z such that (z | p) ≡ -1 and set c ≡
!     z^(q) .
! -   Step 3: Set r ≡ n^((q+1)/2), t ≡ n^(q), m = s .
! -   Step 4: Loop the following:
!     -   If t ≡ 1, output r and p - r .
!     -   Otherwise find, by repeated squaring, the lowest i, 0 < i < m ,
!         such that t^(2^(i)) ≡ 1 .
!     -   Let b ≡ c^(2^((m - i - 1))), and set r ≡ rb, t ≡ tb², c ≡ b² and
!         m = i .
! 
! Task:
! 
! Implement the above algorithm.
! 
! Find solutions (if any) for
! 
! -   n = 10 p = 13
! -   n = 56 p = 101
! -   n = 1030 p = 10009
! -   n = 1032 p = 10009
! -   n = 44402 p = 100049
! 
! Extra credit:
! 
! -   n = 665820697 p = 1000000009
! -   n = 881398088036 p = 1000000000039
! -   n = 41660815127637347468140745042827704103445750172002 p = 10^50 +
!     577
! 
! See also:
! 
! -   Modular exponentiation
! -   Cipolla's algorithm


