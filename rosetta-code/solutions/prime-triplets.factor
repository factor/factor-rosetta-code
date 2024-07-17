! Task:
! 
! Find and show members of prime triples (p, p+2, p+6), where p < 5500
! 
! See also:
! 
! -   -   The OEIS entry: A022004 - Initial members of prime triples (p,
!         p+2, p+6)
!     -   The Wikipedia entry: Prime triplet
!     -   The MathWorld entry: Prime Triplet
!     -   The RosettaCode task for just (p,p+4): Cousin primes
!     -   The RosettaCode task for other patterns of primes: Successive
!         prime differences

USING: arrays kernel lists lists.lazy math math.primes
math.primes.lists prettyprint sequences ;

lprimes                                ! An infinite lazy list of primes
[ dup 2 + dup 4 + 3array ] lmap-lazy   ! Map primes to their triplets (e.g. 2 -> { 2 4 8 })
[ [ prime? ] all? ] lfilter            ! Select triplets which contain only primes
[ first 5500 < ] lwhile                ! Make the list end eventually...
[ . ] leach                            ! Print each item in the list
