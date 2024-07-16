! Task:
! 
! Find and display here on this page, the longest sequence of consecutive
! prime numbers where the differences between the primes are strictly
! ascending.
! 
! Do the same for sequences of primes where the differences are strictly
! descending.
! 
! In both cases, show the sequence for primes < 1,000,000.
! 
! If there are multiple sequences of the same length, only the first need
! be shown.

USING: arrays assocs formatting grouping io kernel literals math
math.primes math.statistics sequences sequences.extras
tools.memory.private ;

<< CONSTANT: limit 1,000,000 >>

CONSTANT: primes $[ limit primes-upto ]

: run ( n quot -- seq quot )
    [ primes ] [ <clumps> ] [ ] tri*
    '[ differences _ monotonic? ] ; inline

: max-run ( quot -- n )
    1 swap '[ 1 + dup _ run find drop ] loop 1 - ; inline

: runs ( quot -- seq )
    [ max-run ] keep run filter ; inline

: .run ( seq -- )
    dup differences [ [ commas ] map ] bi@
    [ "(" ")" surround ] map 2array round-robin " " join print ;

: .runs ( quot -- )
    [ runs ] keep [ < ] = "rising" "falling" ? limit commas
    "Largest run(s) of %s gaps between primes less than %s:\n"
    printf [ .run ] each ; inline

[ < ] [ > ] [ .runs nl ] bi@
