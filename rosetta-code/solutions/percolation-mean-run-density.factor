! Let v be a vector of n values of either 1 or 0 where the probability of
! any value being 1 is p; the probability of a value being 0 is therefore
! 1 − p. Define a run of 1s as being a group of consecutive 1s in the
! vector bounded either by the limits of the vector or by a 0. Let the
! number of such runs in a given vector of length n be R_(n).
! 
! For example, the following vector has R₁₀ = 3
! 
!     [1 1 0 0 0 1 0 1 1 1]
!      ^^^       ^   ^^^^^
! 
! Percolation theory states that
! 
! K(p) = lim_(n → ∞)R_(n)/n = p(1 − p)
! 
! Task
! 
! Any calculation of R_(n)/n for finite n is subject to randomness so
! should be computed as the average of t runs, where t ≥ 100.
! 
! For values of p of 0.1, 0.3, 0.5, 0.7, and 0.9, show the effect of
! varying n on the accuracy of simulated K(p).
! 
! Show your output here.
! 
! See also
! 
! -   s-Run on Wolfram mathworld.

USING: formatting fry io kernel math math.ranges math.statistics
random sequences ;
IN: rosetta-code.mean-run-density

: rising? ( ? ? -- ? ) [ f = ] [ t = ] bi* and ;

: count-run ( n ? ? -- m ? )
    2dup rising? [ [ 1 + ] 2dip ] when nip ;

: runs ( n p -- n )
    [ 0 f ] 2dip '[ random-unit _ < count-run ] times drop ;

: rn ( n p -- x ) over [ runs ] dip /f ;

: sim ( n p -- avg )
    [ 1000 ] 2dip [ rn ] 2curry replicate mean ;

: theory ( p -- x ) 1 over - * ;

: result ( n p -- )
    [ swap ] [ sim ] [ nip theory ] 2tri 2dup - abs
    "%.1f  %-5d  %.4f  %.4f  %.4f\n" printf ;

: test ( p -- )
    { 100 1,000 10,000 } [ swap result ] with each nl ;

: header ( -- )
    "1000 tests each:\np    n      K       p(1-p)  diff" print ;

: main ( -- ) header .1 .9 .2 <range> [ test ] each ;

MAIN: main
