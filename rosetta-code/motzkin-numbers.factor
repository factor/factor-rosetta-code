! Definition
! 
! The nth Motzkin number (denoted by M[n]) is the number of different ways
! of drawing non-intersecting chords between n points on a circle (not
! necessarily touching every point by a chord).
! 
! By convention M[0] = 1.
! 
! Task
! 
! Compute and show on this page the first 42 Motzkin numbers or, if your
! language does not support 64 bit integers, as many such numbers as you
! can. Indicate which of these numbers are prime.
! 
! See also
! 
! -   oeis:A001006 Motzkin numbers

USING: combinators formatting io kernel math math.primes
tools.memory.private ;

MEMO: motzkin ( m -- n )
    dup 2 < [
        drop 1
    ] [
        {
            [ 2 * 1 + ]
            [ 1 - motzkin * ]
            [ 3 * 3 - ]
            [ 2 - motzkin * + ]
            [ 2 + /i ]
        } cleave
    ] if ;

" n        motzkin(n)\n" print
42 [
    dup motzkin [ commas ] keep prime? "prime" "" ?
    "%2d %24s  %s\n" printf
] each-integer
