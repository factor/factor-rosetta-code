! Let c be a 2D boolean square matrix of n × n values of either 1 or 0
! where the probability of any value being 1 is p, (and of 0 is therefore
! 1 − p). We define a cluster of 1's as being a group of 1's connected
! vertically or horizontally (i.e., using the Von Neumann neighborhood
! rule) and bounded by either 0 or by the limits of the matrix. Let the
! number of such clusters in such a randomly constructed matrix be C_(n).
! 
! Percolation theory states that K(p) (the mean cluster density) will
! satisfy K(p) = C_(n)/n² as n tends to infinity. For p = 0.5, K(p) is
! found numerically to approximate 0.065770...
! 
! Task
! 
! Show the effect of varying n on the accuracy of simulated K(p) for
! p = 0.5 and for values of n up to at least 1000. Any calculation of
! C_(n) for finite n is subject to randomness, so an approximation should
! be computed as the average of t runs, where t ≥ 5.
! 
! For extra credit, graphically show clusters in a 15 × 15, p = 0.5 grid.
! 
! Show your output here.
! 
! See also
! 
! -   s-Cluster on Wolfram mathworld.

USING: combinators formatting generalizations kernel math
math.matrices random sequences ;
IN: rosetta-code.mean-cluster-density

CONSTANT: p 0.5
CONSTANT: iterations 5

: rand-bit-matrix ( n probability -- matrix )
    dupd [ random-unit > 1 0 ? ] curry make-matrix ;

: flood-fill ( x y matrix -- )
    3dup ?nth ?nth 1 = [
        [ [ -1 ] 3dip nth set-nth ] [
            {
                [ [ 1 + ] 2dip ]
                [ [ 1 - ] 2dip ]
                [ [ 1 + ] dip ]
                [ [ 1 - ] dip ]
            } [ flood-fill ] map-compose 3cleave
        ] 3bi
    ] [ 3drop ] if ;

: count-clusters ( matrix -- Cn )
    0 swap dup dim matrix-coordinates flip concat [
        first2 rot 3dup ?nth ?nth 1 = [ flood-fill 1 + ]
        [ 3drop ] if
    ] with each ;

: mean-cluster-density ( matrix -- mcd )
    [ count-clusters ] [ dim first sq / ] bi ;

: simulate ( n -- avg-mcd )
    iterations swap [ p rand-bit-matrix mean-cluster-density ]
    curry replicate sum iterations / ;

: main ( -- )
    { 4 64 256 1024 4096 } [
        [ iterations p ] dip dup simulate
        "iterations = %d p = %.1f n = %4d sim = %.5f\n" printf
    ] each ;

MAIN: main
