! Task:
! 
! Provide a function to find the closest two points among a set of given
! points in two dimensions, i.e. to solve the Closest pair of points
! problem in the planar case.
! 
! The straightforward solution is a O(n²) algorithm (which we can call
! brute-force algorithm); the pseudo-code (using indexes) could be simply:
! 
! bruteForceClosestPair of P(1), P(2), ... P(N)
! if N < 2 then
!   return ∞
! else
!   minDistance ← |P(1) - P(2)|
!   minPoints ← { P(1), P(2) }
!   foreach i ∈ [1, N-1]
!     foreach j ∈ [i+1, N]
!       if |P(i) - P(j)| < minDistance then
!         minDistance ← |P(i) - P(j)|
!         minPoints ← { P(i), P(j) } 
!       endif
!     endfor
!   endfor
!   return minDistance, minPoints
!  endif
! 
! A better algorithm is based on the recursive divide&conquer approach, as
! explained also at Wikipedia's Closest pair of points problem, which is
! O(n log n); a pseudo-code could be:
! 
! closestPair of (xP, yP)
!                where xP is P(1) .. P(N) sorted by x coordinate, and
!                      yP is P(1) .. P(N) sorted by y coordinate (ascending order)
! if N ≤ 3 then
!   return closest points of xP using brute-force algorithm
! else
!   xL ← points of xP from 1 to ⌈N/2⌉
!   xR ← points of xP from ⌈N/2⌉+1 to N
!   xm ← xP(⌈N/2⌉)_(x)
!   yL ← { p ∈ yP : p_(x) ≤ xm }
!   yR ← { p ∈ yP : p_(x) > xm }
!   (dL, pairL) ← closestPair of (xL, yL)
!   (dR, pairR) ← closestPair of (xR, yR)
!   (dmin, pairMin) ← (dR, pairR)
!   if dL < dR then
!     (dmin, pairMin) ← (dL, pairL)
!   endif
!   yS ← { p ∈ yP : |xm - p_(x)| < dmin }
!   nS ← number of points in yS
!   (closest, closestPair) ← (dmin, pairMin)
!   for i from 1 to nS - 1
!     k ← i + 1
!     while k ≤ nS and yS(k)_(y) - yS(i)_(y) < dmin
!       if |yS(k) - yS(i)| < closest then
!         (closest, closestPair) ← (|yS(k) - yS(i)|, {yS(k), yS(i)})
!       endif
!       k ← k + 1
!     endwhile
!   endfor
!   return closest, closestPair
! endif
! 
! References and further readings:
! 
! -   Closest pair of points problem
! -   Closest Pair (McGill)
! -   Closest Pair (UCSB)
! -   Closest pair (WUStL)
! -   Closest pair (IUPUI)
! 
! Category:Geometry


