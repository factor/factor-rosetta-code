! A Duffinian number is a composite number k that is relatively prime to
! its sigma sum σ.
! 
! The sigma sum of k is the sum of the divisors of k.
! 
! E.G.
! 
! 161 is a Duffinian number.
! 
! -   It is composite. (7 × 23)
! -   The sigma sum 192 (1 + 7 + 23 + 161) is relatively prime to 161.
! 
! Duffinian numbers are very common.
! 
! It is not uncommon for two consecutive integers to be Duffinian (a
! Duffinian twin) (8, 9), (35, 36), (49, 50), etc.
! 
! Less common are Duffinian triplets; three consecutive Duffinian numbers.
! (63, 64, 65), (323, 324, 325), etc.
! 
! Much, much less common are Duffinian quadruplets and quintuplets. The
! first Duffinian quintuplet is (202605639573839041, 202605639573839042,
! 202605639573839043, 202605639573839044, 202605639573839045).
! 
! It is not possible to have six consecutive Duffinian numbers
! 
! Task
! 
! -   Find and show the first 50 Duffinian numbers.
! -   Find and show at least the first 15 Duffinian triplets.
! 
! See also
! * Numbers Aplenty - Duffinian numbers
! * OEIS:A003624 - Duffinian numbers: composite numbers k relatively prime to sigma(k)

USING: combinators.short-circuit.smart grouping io kernel lists
lists.lazy math math.primes math.primes.factors math.statistics
prettyprint sequences sequences.deep ;

: duffinian? ( n -- ? )
    { [ prime? not ] [ dup divisors sum simple-gcd 1 = ] } && ;

: duffinians ( -- list ) 3 lfrom [ duffinian? ] lfilter ;

: triples ( -- list )
    duffinians dup cdr dup cdr lzip lzip [ flatten ] lmap-lazy
    [ differences { 1 1 } = ] lfilter ;

"First 50 Duffinian numbers:" print
50 duffinians ltake list>array 10 group simple-table. nl

"First 15 Duffinian triplets:" print
15 triples ltake list>array simple-table.
