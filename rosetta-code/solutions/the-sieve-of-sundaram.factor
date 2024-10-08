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


