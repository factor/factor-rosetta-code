! Repunit is a portmanteau of the words "repetition" and "unit", with unit
! being "unit value"... or in laymans terms, 1. So 1, 11, 111, 1111 &
! 11111 are all repunits.
! 
! Every standard integer base has repunits since every base has the
! digit 1. This task involves finding the repunits in different bases that
! are prime.
! 
! In base two, the repunits 11, 111, 11111, 1111111, etc. are prime.
! (These correspond to the Mersenne primes.)
! 
! In base three: 111, 1111111, 1111111111111, etc.
! 
! Repunit primes, by definition, are also circular primes.
! 
! Any repunit in any base having a composite number of digits is
! necessarily composite. Only repunits (in any base) having a prime number
! of digits might be prime.
! 
! Rather than expanding the repunit out as a giant list of 1s or
! converting to base 10, it is common to just list the number of 1s in the
! repunit; effectively the digit count. The base two repunit primes listed
! above would be represented as: 2, 3, 5, 7, etc.
! 
! Many of these sequences exist on OEIS, though they aren't specifically
! listed as "repunit prime digits" sequences.
! 
! Some bases have very few repunit primes. Bases 4, 8, and likely 16 have
! only one. Base 9 has none at all. Bases above 16 may have repunit primes
! as well... but this task is getting large enough already.
! 
! Task
! 
! -   For bases 2 through 16, Find and show, here on this page, the
!     repunit primes as digit counts, up to a limit of 1000.
! 
! Stretch
! 
! -   Increase the limit to 2700 (or as high as you have patience for.)
! 
! See also
! 
! * Wikipedia: Repunit primes
! * OEIS:A000043 - Mersenne exponents: primes p such that 2^p - 1 is prime. Then 2^p - 1 is called a Mersenne prime (base 2)
! * OEIS:A028491 - Numbers k such that (3^k - 1)/2 is prime (base 3)
! * OEIS:A004061 - Numbers n such that (5^n - 1)/4 is prime (base 5)
! * OEIS:A004062 - Numbers n such that (6^n - 1)/5 is prime (base 6)
! * OEIS:A004063 - Numbers k such that (7^k - 1)/6 is prime (base 7)
! * OEIS:A004023 - Indices of prime repunits: numbers n such that 11...111 (with n 1's) = (10^n - 1)/9 is prime (base 10)
! * OEIS:A005808 - Numbers k such that (11^k - 1)/10 is prime (base 11)
! * OEIS:A004064 - Numbers n such that (12^n - 1)/11 is prime (base 12)
! * OEIS:A016054 - Numbers n such that (13^n - 1)/12 is prime (base 13)
! * OEIS:A006032 - Numbers k such that (14^k - 1)/13 is prime (base 14)
! * OEIS:A006033 - Numbers n such that (15^n - 1)/14 is prime (base 15)
! * Related task: Circular primes


