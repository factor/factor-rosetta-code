! Definitions
! 
! Let n be a positive integer and l(n) be the number of its digits in base
! b.
! 
! Express n as the product of its prime factors raised to the appropriate
! powers. Let D(n) be the total number of its base b digits in all its
! prime factors and in all their exponents that are greater than 1.
! 
! Then n is defined to be:
! 
! 1. a wasteful (or extravagant) number if l(n) < D(n); or
! 
! 2. an equidigital number if l(n) = D(n); or
! 
! 3. a frugal (or economical) number if l(n) > D(n)
! 
! in base b.
! 
! By convention, the number 1 is considered to be an equidigital number in
! any base even though it has no prime factors.
! 
! For the avoidance of any doubt, the number 0 is not a positive integer
! (and arguably not a natural number either) and so is excluded from all 3
! categories.
! 
! An economical number is sometimes defined as being one for which l(n) >=
! D(n) though this usage won't be followed here.
! 
! Examples
! 
! In base 10, the number 30 has a prime factorization of 2 x 3 x 5. The
! total number of digits is 3 (all exponents being 1) which is more than
! the 2 digits 30 has. So 30 is wasteful in base 10.
! 
! In base 10, the number 49 has a prime factorization of 7². The total
! number of digits, including those of the exponent, is 2 which is the
! same as the 2 digits 49 has. So 49 is equidigital in base 10.
! 
! In base 10, the number 125 has a prime factorization of 5³. The total
! number of digits, including those of the exponent, is 2 which is less
! than the 3 digits 125 has. So 125 is frugal in base 10.
! 
! In base 2, the number 100000 (32 decimal) has a prime factorization of
! 10^101 (2^5 decimal). The total number of binary digits, including those
! of the exponent, is 5 which is less than the 6 binary digits 100000 has.
! So 32 is frugal in base 2 (but equidigital in base 10).
! 
! Task
! 
! Compute and show here the first 50 and the 10,000th number in base 10
! for each of the three categories of number defined above.
! 
! Also compute and show how many numbers less than 1,000,000 fall into
! each of the three categories.
! 
! Bonus
! 
! Do the same for base 11, but show the results in base 10.
! 
! References
! 
! -   OEIS: A046760 - Wasteful numbers
! -   OEIS: A046758 - Equidigital numbers
! -   OEIS: A046759 - Economical numbers


