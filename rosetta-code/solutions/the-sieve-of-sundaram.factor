! The sieve of Eratosthenes: you've been there; done that; have the
! T-shirt. The sieve of Eratosthenes was ancient history when Euclid was a
! schoolboy. You are ready for something less than 3000 years old. You are
! ready for The sieve of Sundaram.
! 
! Starting with the ordered set of +ve integers, mark every third starting
! at 4 (4;7;10...).
! 
! Step through the set and if the value is not marked output 2*n+1. So
! from 1 to 4 output 3 5 7.
! 
! 4 is marked so skip for 5 and 6 output 11 and 13.
! 
! 7 is marked, so no output but now also mark every fifth starting at 12
! (12;17;22...)
! 
! as per to 10 and now mark every seventh starting at 17 (17;24;31....)
! 
! as per for every further third element (13;16;19...) mark every
! (9th;11th;13th;...) element.
! 
! The output will be the ordered set of odd primes.
! 
! Using your function find and output the first 100 and the millionth
! Sundaram prime.
! 
! The faithless amongst you may compare the results with those generated
! by The sieve of Eratosthenes.
! 
! References:
! 
! -   The article on Wikipedia.
! 
! Comment on the Sundaram Sieve
! 
! In case casual readers and programmers read the above blurb and get the
! impression that something several thousand years newer must needs be
! better than the "old" Sieve of Eratosthenes (SoE), do note the only
! difference between the Sieve of Sundaram (SoS) and the odds-only SoE is
! that the SoS marks as composite/"culls" according to all odd "base"
! numbers as is quite clear in the above description of how to implement
! it and the above linked Wikipedia article (updated), and the SoE marks
! as composite/"culls" according to only the previously determined
! unmarked primes (which are all odd except for two, which is not used for
! the "odds-only" algorithm); the time complexity (which relates to the
! execution time) is therefore O(n log n) for the SoS and O(n log log n)
! for the SoE, which difference can make a huge difference to the time it
! takes to sieve as the ranges get larger. It takes about a billion
! "culls" to sieve odds-only to a billion for the SoE, whereas it takes
! about 2.28 billion "culls" to cull to the same range for the SoS, which
! implies that the SoS must be about this ratio slower for this range with
! the memory usage identical. Why would one choose the SoS over the SoE to
! save a single line of code at the cost of this much extra time? The Wren
! comparison at the bottom of this page makes that clear, as would
! implementing the same in any language.
! 
! Comment on the comment, corrected:
! 
! The Sieve of Sundaram can be enhanced to have vastly fewer culls.
! Improvements include: 1. Limiting the upper limit of the multiplier i to
! the square root of the upper limit of the domain. 2. Correction: Only
! mark with multipliers i which have not themselves already been culled.
! This means that (2*i+1) is prime. 3. Starting from i^2. 4. Conceptually
! arranging the numbers as a 2D array with 15 or 105 columns. About half
! the columns will always be entirely marked. Knowing that, they can be
! ignored at harvest time, and so also can be skipped at culling time.
! 
! In python, when finding primes up to 100 million, using the 105 column
! technique results in about 1.5x the performance rate of not using it.
! See the Alternate Python Procedural implementation. Combined with its
! other optimizations, the alternative python procedural performs about
! 22x the performance of the first implementation when finding all 5764697
! primes up to 100059960.
! 
! Comment on the above comment on the comment:
! 
! Although the naive implementation of the Sieve of Sundaram (SoS) as
! implemented in the first "procedural" Python implementation from below
! can be enhanced by eliminating many redundant operations as in the
! "improved" Python implementation in the (updated) Wikipedia Sieve of
! Sundaram article (https://en.wikipedia.org/wiki/Sieve_of_Sundaram), many
! of the improvements proposed above go beyond the basic premise of the
! SoS to become the Sieve of Eratosthenes (SoE) as explained in the
! updated Wikipedia article. Specifically, culling/sieving using only the
! resulting odd base prime numbers as per point 2 above makes the sieve an
! odds-only SoE and not a SoS, and the further optimization of point 4
! above is essentially adding a factoring wheel to the odds-only SoE sieve
! to eliminate the need to cull/sieve by the base primes of 3, 5, and 7,
! resulting in a further reduction in the number of culling operations by
! a factor of 48/105.
! 
! This is reflected in testing of the "improved" Python code from the
! Wikipedia SoS article (after eliminating/commenting out the number of
! operations counting code): When sieving to a hundred million
! (100,000,000), the odds-only SoE implementation obtained by removing the
! comment to allow filtering for only the resulting base odd primes is
! almost twice as fast as the SoS version without this filter (it might be
! twice as fast but the test has an execution time cost), and the
! "alternate" (wheel factorized) Python version from below is a little
! over twice as fast again, just as predicted by the factor of 48/105.
! Both versions could be further optimized by a constant factor by using
! Python's built-in "slice" operations to cull by a given base prime using
! a constant stride of the base prime, but that optimization could be
! applied to both versions so wouldn't affect the relative execution
! times.
! 
! Comment on the above comment on the comment on the comment: Thank you
! for pointing out the error. The error was in the comments, not in the
! algorithm or code. It is still very much an enhanced Sieve of Sundaram.
! 2. Only mark with multipliers i have not themselves been already culled.
! This means that (2*i+1) is prime.


