! An aliquot sequence of a positive integer K is defined recursively as
! the first member being K and subsequent members being the sum of the
! Proper divisors of the previous term.
! 
! -   -   If the terms eventually reach 0 then the series for K is said to
!         terminate.
! 
! There are several classifications for non termination:
! 
! -   -   If the second term is K then all future terms are also K and so
!         the sequence repeats from the first term with period 1 and K is
!         called perfect.
!     -   If the third term would be repeating K then the sequence repeats
!         with period 2 and K is called amicable.
!     -   If the N^(th) term would be repeating K for the first time, with
!         N > 3 then the sequence repeats with period N - 1 and K is
!         called sociable.
! 
! Perfect, amicable and sociable numbers eventually repeat the original
! number K; there are other repetitions...
! 
! -   -   Some K have a sequence that eventually forms a periodic
!         repetition of period 1 but of a number other than K, for example
!         95 which forms the sequence 95, 25, 6, 6, 6, ... such K are
!         called aspiring.
!     -   K that have a sequence that eventually forms a periodic
!         repetition of period >= 2 but of a number other than K, for
!         example 562 which forms the sequence
!         562, 284, 220, 284, 220, ... such K are called cyclic.
! 
! And finally:
! 
! -   -   Some K form aliquot sequences that are not known to be either
!         terminating or periodic; these K are to be called
!         non-terminating.
! 
! For the purposes of this task, K is to be classed as non-terminating if
! it has not been otherwise classed after generating 16 terms or if any
! term of the sequence is greater than 2**47 = 140,737,488,355,328.
! 
! Task:
! 
! 1.  Create routine(s) to generate the aliquot sequence of a positive
!     integer enough to classify it according to the classifications given
!     above.
! 2.  Use it to display the classification and sequences of the numbers
!     one to ten inclusive.
! 3.  Use it to show the classification and sequences of the following
!     integers, in order:
! 
!         11, 12, 28, 496, 220, 1184, 12496, 1264460, 790, 909, 562, 1064,
!         1488, and optionally 15355717786080.
! 
! Show all output on this page.
! 
! Related tasks:
! 
! -   Abundant, deficient and perfect number classifications.
!     (Classifications from only the first two members of the whole
!     sequence).
! -   Proper divisors
! -   Amicable pairs
! 
! External links:
! 
! -   An amazing thing about 276, Numberphile

USING: combinators combinators.short-circuit formatting kernel
literals locals math math.functions math.primes.factors
math.ranges namespaces pair-rocket sequences sets ;
FROM: namespaces => set ;
IN: rosetta-code.aliquot

SYMBOL: terms
CONSTANT: 2^47 $[ 2 47 ^ ]
CONSTANT: test-cases {
    11 12 28 496 220 1184 12496 1264460 790
    909 562 1064 1488 15355717786080
}

: next-term ( n -- m ) dup divisors sum swap - ;

: continue-aliquot? ( hs term -- hs term ? )
    {
        [ terms get 15 < ]
        [ swap in? not   ]
        [ nip zero? not  ]
        [ nip 2^47 <     ]
    } 2&& ;
    
: next-aliquot ( hs term -- hs next-term term )
    [ swap [ adjoin    ] keep ]
    [ dup  [ next-term ] dip  ] bi terms inc ;
    
: aliquot ( k -- seq )
    0 terms set HS{ } clone swap
    [ continue-aliquot? ] [ next-aliquot ] produce
    [ drop ] 2dip swap suffix ;
    
: non-terminating? ( seq -- ? )
    { [ length 15 > ] [ [ 2^47 > ] any? ] } 1|| ;
    
:: classify ( seq -- classification-str )
    {
        [ seq non-terminating? ] => [ "non-terminating" ]
        [ seq last zero?       ] => [ "terminating"     ]
        [ seq length 2 =       ] => [ "perfect"         ]
        [ seq length 3 =       ] => [ "amicable"        ]
        [ seq first seq last = ] => [ "sociable"        ]
        [ seq 2 tail* first2 = ] => [ "aspiring"        ]
        [ "cyclic" ]
    } cond ;
    
: .classify ( k -- )
    dup aliquot [ classify ] keep "%14u: %15s: %[%d, %]\n"
    printf ;
    
: main ( -- )
    10 [1,b] test-cases append [ .classify ] each ;

MAIN: main
