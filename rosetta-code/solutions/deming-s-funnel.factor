! W Edwards Deming was an American statistician and management guru who
! used physical demonstrations to illuminate his teachings. In one
! demonstration Deming repeatedly dropped marbles through a funnel at a
! target, marking where they landed, and observing the resulting pattern.
! He applied a sequence of "rules" to try to improve performance. In each
! case the experiment begins with the funnel positioned directly over the
! target.
! 
! -   Rule 1: The funnel remains directly above the target.
! -   Rule 2: Adjust the funnel position by shifting the target to
!     compensate after each drop. E.g. If the last drop missed 1 cm east,
!     move the funnel 1 cm to the west of its current position.
! -   Rule 3: As rule 2, but first move the funnel back over the target,
!     before making the adjustment. E.g. If the funnel is 2 cm north, and
!     the marble lands 3 cm north, move the funnel 3 cm south of the
!     target.
! -   Rule 4: The funnel is moved directly over the last place a marble
!     landed.
! 
! Apply the four rules to the set of 50 pseudorandom displacements
! provided (e.g in the Racket solution) for the dxs and dys. Output:
! calculate the mean and standard-deviations of the resulting x and y
! values for each rule.
! 
! Note that rules 2, 3, and 4 give successively worse results. Trying to
! deterministically compensate for a random process is counter-productive,
! but -- according to Deming -- quite a popular pastime: see the Further
! Information, below for examples.
! 
! Stretch goal 1: Generate fresh pseudorandom data. The radial
! displacement of the drop from the funnel position is given by a Gaussian
! distribution (standard deviation is 1.0) and the angle of displacement
! is uniformly distributed.
! 
! Stretch goal 2: Show scatter plots of all four results.
! 
! Further information:
! 
! -   Further explanation and interpretation
! -   Video demonstration of the funnel experiment at the Mayo Clinic.

USING: combinators formatting generalizations grouping.extras io
kernel math math.statistics sequences ;

: show ( seq1 seq2 -- )
    [ [ mean ] bi@ ] [ [ population-std ] bi@ ] 2bi
    "Mean    x, y : %.4f, %.4f\nStd dev x, y : %.4f, %.4f\n"
    printf ;

{
    -0.533  0.270  0.859 -0.043 -0.205 -0.127 -0.071  0.275
     1.251 -0.231 -0.401  0.269  0.491  0.951  1.150  0.001
    -0.382  0.161  0.915  2.080 -2.337  0.034 -0.126  0.014
     0.709  0.129 -1.093 -0.483 -1.193  0.020 -0.051  0.047
    -0.095  0.695  0.340 -0.182  0.287  0.213 -0.423 -0.021
    -0.134  1.798  0.021 -1.099 -0.361  1.636 -1.134  1.315
     0.201  0.034  0.097 -0.170  0.054 -0.553 -0.024 -0.181
    -0.700 -0.361 -0.789  0.279 -0.174 -0.009 -0.323 -0.658
     0.348 -0.528  0.881  0.021 -0.853  0.157  0.648  1.774
    -1.043  0.051  0.021  0.247 -0.310  0.171  0.000  0.106
     0.024 -0.386  0.962  0.765 -0.125 -0.289  0.521  0.017
     0.281 -0.749 -0.149 -2.436 -0.909  0.394 -0.113 -0.598
     0.443 -0.521 -0.799  0.087
}
{
     0.136  0.717  0.459 -0.225  1.392  0.385  0.121 -0.395
     0.490 -0.682 -0.065  0.242 -0.288  0.658  0.459  0.000
     0.426  0.205 -0.765 -2.188 -0.742 -0.010  0.089  0.208
     0.585  0.633 -0.444 -0.351 -1.087  0.199  0.701  0.096
    -0.025 -0.868  1.051  0.157  0.216  0.162  0.249 -0.007
     0.009  0.508 -0.790  0.723  0.881 -0.508  0.393 -0.226
     0.710  0.038 -0.217  0.831  0.480  0.407  0.447 -0.295
     1.126  0.380  0.549 -0.445 -0.046  0.428 -0.074  0.217
    -0.822  0.491  1.347 -0.141  1.230 -0.044  0.079  0.219
     0.698  0.275  0.056  0.031  0.421  0.064  0.721  0.104
    -0.729  0.650 -1.103  0.154 -1.720  0.051 -0.385  0.477
     1.537 -0.901  0.939 -0.411  0.341 -0.411  0.106  0.224
    -0.947 -1.424 -0.542 -1.032
}
{
    [ "Rule 1:" print ]
    [ "Rule 2:" print [ [ [ swap neg + ] 2clump-map ] [ first suffix ] bi ] bi@ ]
    [ "Rule 3:" print [ 0 [ - neg ] accumulate* ] bi@ ]
    [ "Rule 4:" print [ cum-sum ] bi@ ]
} [ show ] map-compose 2cleave
