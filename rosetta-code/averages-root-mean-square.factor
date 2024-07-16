! Task
! 
! Compute the Root mean square of the numbers 1..10.
! 
! The root mean square is also known by its initials RMS (or rms), and as
! the quadratic mean.
! 
! The RMS is calculated as the mean of the squares of the numbers,
! square-rooted:
! 
!         $x_{\mathrm{rms}} = \sqrt {{{x_1}^2 + {x_2}^2 + \cdots + {x_n}^2} \over n}.$
! 
! See also

: root-mean-square ( seq -- mean )
    [ [ sq ] map-sum ] [ length ] bi / sqrt ;
