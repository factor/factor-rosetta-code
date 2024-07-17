! A truncatable prime is one where all non-empty substrings that finish at
! the end of the number (right-substrings) are also primes when understood
! as numbers in a particular base. The largest such prime in a given
! (integer) base is therefore computable, provided the base is larger than
! 2.
! 
! Let's consider what happens in base 10. Obviously the right most digit
! must be prime, so in base 10 candidates are 2,3,5,7. Putting a digit in
! the range 1 to base-1 in front of each candidate must result in a prime.
! So 2 and 5, like the whale and the petunias in The Hitchhiker's Guide to
! the Galaxy, come into existence only to be extinguished before they have
! time to realize it, because 2 and 5 preceded by any digit in the range 1
! to base-1 is not prime. Some numbers formed by preceding 3 or 7 by a
! digit in the range 1 to base-1 are prime. So
! 13,17,23,37,43,47,53,67,73,83,97 are candidates. Again, putting a digit
! in the range 1 to base-1 in front of each candidate must be a prime.
! Repeating until there are no larger candidates finds the largest left
! truncatable prime.
! 
! Let's work base 3 by hand:
! 
! 0 and 1 are not prime so the last digit must be 2. 12₃ = 5₁₀ which is
! prime, 22₃ = 8₁₀ which is not so 12₃ is the only candidate. 112₃ = 14₁₀
! which is not prime, 212₃ = 23₁₀ which is, so 212₃ is the only candidate.
! 1212₃ = 50₁₀ which is not prime, 2212₃ = 77₁₀ which also is not prime.
! So there are no more candidates, therefore 23 is the largest left
! truncatable prime in base 3.
! 
! The task is to reconstruct as much, and possibly more, of the table in
! the OEIS as you are able.
! 
! Related Tasks:
! 
! -   Miller-Rabin primality test


