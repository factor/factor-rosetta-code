USING: assocs formatting grouping io kernel literals math
math.functions math.functions.integer-logs math.primes
math.statistics sequences sequences.extras sequences.product
sorting tools.memory.private tools.time ;

<<
CONSTANT: d { 0 1 2 3 4 5 6 7 8 9 }  ! digits that can be anywhere
CONSTANT: e { 1 3 7 9 }              ! digits that can be at the end
>>

CONSTANT: digits {
    ${ { 1 } { 2 } { 3 } d d d d d e }
    ${ d { 1 } { 2 } { 3 } d d d d e }
    ${ d d { 1 } { 2 } { 3 } d d d e }
    ${ d d d { 1 } { 2 } { 3 } d d e }
    ${ d d d d { 1 } { 2 } { 3 } d e }
    ${ d d d d d { 1 } { 2 } { 3 } e }
    ${ d d d d d d { 1 } { 2 } { 3 } }
}

: candidates ( -- seq )
    digits [ <product-sequence> ] map-concat
    [ <reversed> 0 [ 10^ * + ] reduce-index ] map ;

: 123primes ( -- assoc )
    candidates [ prime? ] filter
    [ integer-log10 1 + ] collect-by >alist natural-sort ;

[
    "Decimal primes under 100,000 which contain '123':" print
    123primes dup [ 4 of ] [ 5 of append ] bi natural-sort
    10 group [ [ commas "%8s" printf ] each nl ] each nl
    [ [ 10^ commas ] [ length ] bi* ] assoc-map
    unzip cum-sum [ commas ] map swap zip
    [ "Found %7s such primes under %s.\n" printf ] assoc-each
] time
