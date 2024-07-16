! In mathematics, sexy primes are prime numbers that differ from each
! other by six.
! 
! For example, the numbers 5 and 11 are both sexy primes, because 11 minus
! 6 is 5.
! 
! The term "sexy prime" is a pun stemming from the Latin word for six:
! sex.
! 
! Sexy prime pairs: Sexy prime pairs are groups of two primes that differ
! by 6. e.g. (5 11), (7 13), (11 17)
! 
! See sequences: OEIS:A023201 and OEIS:A046117
! 
! Sexy prime triplets: Sexy prime triplets are groups of three primes
! where each differs from the next by 6. e.g. (5 11 17), (7 13 19), (17 23
! 29)
! 
! See sequences: OEIS:A046118, OEIS:A046119 and OEIS:A046120
! 
! Sexy prime quadruplets: Sexy prime quadruplets are groups of four primes
! where each differs from the next by 6. e.g. (5 11 17 23), (11 17 23 29)
! 
! See sequences: OEIS:A023271, OEIS:A046122, OEIS:A046123 and OEIS:A046124
! 
! Sexy prime quintuplets: Sexy prime quintuplets are groups of five primes
! with a common difference of 6. One of the terms must be divisible by 5,
! because 5 and 6 are relatively prime. Thus, the only possible sexy prime
! quintuplet is (5 11 17 23 29)
! 
! Task:
! 
! -   -   For each of pairs, triplets, quadruplets and quintuplets, Find
!         and display the count of each group type of sexy primes less
!         than one million thirty-five (1,000,035).
!     -   Display at most the last 5, less than one million thirty-five,
!         of each sexy prime group type.
!     -   Find and display the count of the unsexy primes less than one
!         million thirty-five.
!     -   Find and display the last 10 unsexy primes less than one million
!         thirty-five.
!     -   Note that 1000033 SHOULD NOT be counted in the pair count. It is
!         sexy, but not in a pair within the limit. However, it also
!         SHOULD NOT be listed in the unsexy primes since it is sexy.

USING: combinators.short-circuit fry interpolate io kernel
literals locals make math math.primes math.ranges prettyprint qw
sequences tools.memory.private ;
IN: rosetta-code.sexy-primes

CONSTANT: limit 1,000,035
CONSTANT: primes $[ limit primes-upto ]
CONSTANT: tuplet-names qw{ pair triplet quadruplet quintuplet }

: tuplet ( m n -- seq ) dupd 1 - 6 * + 6 <range> ;

: viable-tuplet? ( seq -- ? )
    [ [ prime? ] [ limit < ] bi and ] all? ;

: sexy-tuplets ( n -- seq ) [ primes ] dip '[
        [ _ tuplet dup viable-tuplet? [ , ] [ drop ] if ] each
    ] { } make ;

: ?last5 ( seq -- seq' ) 5 short tail* ;

: last5 ( seq -- str )
    ?last5 [ { } like unparse ] map " " join ;

:: tuplet-info ( n -- last5 l5-len num-tup limit tuplet-name )
    n sexy-tuplets :> tup tup last5 tup ?last5 length tup length
    commas limit commas n 2 - tuplet-names nth ;

: show-tuplets ( n -- )
    tuplet-info
    [I Number of sexy prime ${0}s < ${1}: ${2}I] nl
    [I Last ${0}: ${1}I] nl nl ;

: unsexy-primes ( -- seq ) primes [
        { [ 6 + prime? not ] [ 6 - prime? not ] } 1&&
    ] filter ;

: show-unsexy ( -- )
    unsexy-primes dup length commas limit commas
    [I Number of unsexy primes < ${0}: ${1}I] nl
    "Last 10: " write 10 short tail* [ pprint bl ] each nl ; 

: main ( -- ) 2 5 [a,b] [ show-tuplets ] each show-unsexy ;

MAIN: main
