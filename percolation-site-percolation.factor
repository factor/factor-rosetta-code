! Given an M × N rectangular array of cells numbered
! cell[0..M − 1, 0..N − 1]assume M is horizontal and N is downwards.
! 
! Assume that the probability of any cell being filled is a constant p
! where
! 
!     0.0 ≤ p ≤ 1.0
! 
! The task:
! 
! Simulate creating the array of cells with probability p and then testing
! if there is a route through adjacent filled cells from any on row 0 to
! any on row N, i.e. testing for site percolation.
! 
! Given p repeat the percolation t times to estimate the proportion of
! times that the fluid can percolate to the bottom for any given p.
! 
! Show how the probability of percolating through the random grid changes
! with p going from 0.0 to 1.0 in 0.1 increments and with the number of
! repetitions to estimate the fraction at any given p as t >  = 100.
! 
! Use an M = 15, N = 15 grid of cells for all cases.
! 
! Optionally depict a percolation through a cell grid graphically.
! 
! Show all output on this page.

USING: arrays combinators combinators.short-circuit formatting
fry generalizations io kernel math math.matrices math.order
math.ranges math.vectors prettyprint random sequences ;
IN: rosetta-code.site-percolation

SYMBOLS: ▓ . v ;

: randomly-filled-matrix ( m n probability -- matrix )
    [ random-unit > ▓ . ? ] curry make-matrix ;

: in-bounds? ( matrix loc -- ? )
    [ dim { 1 1 } v- ] dip [ 0 rot between? ] 2map [ t = ] all? ;

: set-coord ( obj loc matrix -- ) [ reverse ] dip set-index ;
: get-coord ( matrix loc -- elt ) swap [ first2 ] dip nth nth ;

: (can-percolate?) ( matrix loc -- ? )
    {
        { [ 2dup in-bounds? not ] [ 2drop f ] }
        { [ 2dup get-coord { v ▓ } member? ] [ 2drop f ] }
        {
            [ 2dup second [ dim second 1 - ] dip = ]
            [ [ v ] 2dip swap set-coord t ]
        }
        [
            2dup get-coord . =
            [ [ v ] 2dip swap [ set-coord ] 2keep swap ] when
            {
                [ { 1 0 } v+ ] [ { 1 0 } v- ]
                [ { 0 1 } v+ ] [ { 0 1 } v- ]
            } [ (can-percolate?) ] map-compose 2||
        ]
    } cond ;

: can-percolate? ( matrix -- ? )
    dup dim first <iota> [ 0 2array (can-percolate?) ] with find
    drop >boolean ;

: show-sample ( -- )
    f [ [ can-percolate? ] keep swap ]
    [ drop 15 15 0.6 randomly-filled-matrix ] do until
    "Sample percolation, p = 0.6" print simple-table. ;

: percolation-rate ( p -- rate )
    [ 500 1 ] dip -
    '[ 15 15 _ randomly-filled-matrix can-percolate? ] replicate
    [ t = ] count 500 / ;

: site-percolation ( -- )
    show-sample nl "Running 500 trials at each porosity:" print
    10 [1,b] [
        10 / dup percolation-rate "p = %.1f: %.3f\n" printf
    ] each ;

MAIN: site-percolation
