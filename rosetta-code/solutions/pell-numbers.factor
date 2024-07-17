! Pell numbers are an infinite sequence of integers that comprise the
! denominators of the closest rational approximations to the square root
! of 2 but have many other interesting uses and relationships.
! 
! The numerators of each term of rational approximations to the square
! root of 2 may also be derived from Pell numbers, or may be found by
! taking half of each term of the related sequence: Pell-Lucas or
! Pell-companion numbers.
! 
! The Pell numbers: 0, 1, 2, 5, 12, 29, 70, etc., are defined by the
! recurrence relation:
! 
! P⁰ = 0;
! P¹ = 1;
! P_(n) = 2 × P_(n-1) + P_(n-2);
! 
! Or, may also be expressed by the closed form formula:
! 
! P_(n) = ((1 + √2)^(n) - (1 - √2)^(n)) / (2 × √2);
! 
! Pell-Lucas or Pell-companion numbers: 2, 2, 6, 14, 34, 82, etc., are
! defined by a very similar recurrence relation, differing only in the
! first two terms:
! 
! Q⁰ = 2;
! Q¹ = 2;
! Q_(n) = 2 × Q_(n-1) + Q_(n-2);
! 
! Or, may also be expressed by the closed form formula:
! 
! Q_(n) = (1 + √2)^(n) + (1 - √2)^(n);
! 
! or
! 
! Q_(n) = P_(2n) / P_(n);
! 
! The sequence of rational approximations to the square root of 2 begins:
! 
! 1/1, 3/2, 7/5, 17/12, 41/29, ...
! 
! Starting from n = 1, for each term, the denominator is P_(n) and the
! numerator is Q_(n) / 2 or P_(n-1) + P_(n).
! 
! Pell primes are Pell numbers that are prime. Pell prime indices are the
! indices of the primes in the Pell numbers sequence. Every Pell prime
! index is prime, though not every prime index corresponds to a prime Pell
! number.
! 
! If you take the sum S of the first 4n + 1 Pell numbers, the sum of the
! terms P_(2n) and P_(2n + 1) will form the square root of S.
! 
! For instance, the sum of the Pell numbers up to P₅; 0 + 1 + 2 + 5 + 12 +
! 29 == 49, is the square of P₂ + P₃ == 2 + 5 == 7. The sequence of
! numbers formed by the sums P_(2n) + P_(2n + 1) are known as
! Newman-Shank-Williams numbers or NSW numbers.
! 
! Pell numbers may also be used to find Pythagorean triple near isosceles
! right triangles; right triangles whose legs differ by exactly 1. E.G.:
! (3,4,5), (20,21,29), (119,120,169), etc.
! 
! For n > 0, each right triangle hypotenuse is P_(2n + 1). The shorter leg
! length is the sum of the terms up to P_(2n + 1). The longer leg length
! is 1 more than that.
! 
! Task
! * Find and show at least the first 10 Pell numbers.
! * Find and show at least the first 10 Pell-Lucas numbers.
! * Use the Pell (and optionally, Pell-Lucas) numbers sequence to find and show at least the first 10 rational approximations to √2 in both rational and decimal representation.
! * Find and show at least the first 10 Pell primes.
! * Find and show at least the first 10 indices of Pell primes.
! * Find and show at least the first 10 Newman-Shank-Williams numbers
! * Find and show at least the first 10 Pythagorean triples corresponding to near isosceles right triangles.
! 
! See also
! * Wikipedia: Pell number
! * OEIS:A000129 - Pell numbers
! * OEIS:A002203 - Companion Pell numbers (Pell-Lucas numbers)
! * OEIS:A001333 - Numerators of continued fraction convergents to sqrt(2) (Companion Pell numbers / 2)
! * OEIS:A086383 - Prime terms in the sequence of Pell numbers
! * OEIS:A096650 - Indices of prime Pell numbers
! * OEIS:A002315 - NSW numbers (Newman-Shank-Williams numbers)
! * Wikipedia: Pythagorean triple
! * Pythagorean triples


