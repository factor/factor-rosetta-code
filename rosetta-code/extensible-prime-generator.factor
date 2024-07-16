! Task:
! 
! Write a generator of prime numbers, in order, that will automatically
! adjust to accommodate the generation of any reasonably high prime.
! 
! The routine should demonstrably rely on either:
! 
! 1.  Being based on an open-ended counter set to count without upper
!     limit other than system or programming language limits. In this
!     case, explain where this counter is in the code.
! 2.  Being based on a limit that is extended automatically. In this case,
!     choose a small limit that ensures the limit will be passed when
!     generating some of the values to be asked for below.
! 3.  If other methods of creating an extensible prime generator are used,
!     the algorithm's means of extensibility/lack of limits should be
!     stated.
! 
! The routine should be used to:
! 
! -   Show the first twenty primes.
! -   Show the primes between 100 and 150.
! -   Show the number of primes between 7,700 and 8,000.
! -   Show the 10,000th prime.
! 
! Show output on this page.
! 
! Note: You may reference code already on this site if it is written to be
! imported/included, then only the code necessary for import and the
! performance of this task need be shown. (It is also important to leave a
! forward link on the referenced tasks entry so that later editors know
! that the code is used for multiple tasks).
! 
! Note 2: If a languages in-built prime generator is extensible or is
! guaranteed to generate primes up to a system limit, (2³¹ or memory
! overflow for example), then this may be used as long as an explanation
! of the limits of the prime generator is also given. (Which may include a
! link to/excerpt from, language documentation).
! 
! Note 3:The task is written so it may be useful in solving the task Emirp
! primes as well as others (depending on its efficiency).
! 
! Reference:
! 
! -   Prime Numbers. Website with large count of primes.

USING: io math.primes prettyprint sequences ;

"First 20 primes: " write
20 nprimes .

"Primes between 100 and 150: " write
100 150 primes-between .

"Number of primes between 7,700 and 8,000: " write
7,700 8,000 primes-between length .

"10,000th prime: " write
10,000 nprimes last .
