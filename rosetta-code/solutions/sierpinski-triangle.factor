! Task
! 
! Produce an ASCII representation of a Sierpinski triangle of order N.
! 
! Example
! 
! The Sierpinski triangle of order 4 should look like this:
! 
!                            *
!                           * *
!                          *   *
!                         * * * *
!                        *       *
!                       * *     * *
!                      *   *   *   *
!                     * * * * * * * *
!                    *               *
!                   * *             * *
!                  *   *           *   *
!                 * * * *         * * * *
!                *       *       *       *
!               * *     * *     * *     * *
!              *   *   *   *   *   *   *   *
!             * * * * * * * * * * * * * * * *
! 
! Related tasks
! 
! -   Sierpinski triangle/Graphical for graphics images of this pattern.
! -   Sierpinski carpet

USING: io kernel math sequences ;
IN: sierpinski

: iterate-triangle ( triange spaces -- triangle' )
    [ [ dup surround ] curry map ]
    [ drop [ dup " " glue ] map ] 2bi append ;

: (sierpinski) ( triangle spaces n -- triangle' )
    dup 0 = [ 2drop "\n" join ] [
        [
            [ iterate-triangle ]
            [ nip dup append ] 2bi
        ] dip 1 - (sierpinski)
    ] if ;

: sierpinski ( n -- )
    [ { "*" } " " ] dip (sierpinski) print ;
