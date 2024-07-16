! Task:
! 
! Implement the Drossel and Schwabl definition of the forest-fire model.
! 
! It is basically a 2D cellular automaton where each cell can be in three
! distinct states (empty, tree and burning) and evolves according to the
! following rules (as given by Wikipedia)
! 
! 1.  A burning cell turns into an empty cell
! 2.  A tree will burn if at least one neighbor is burning
! 3.  A tree ignites with probability f even if no neighbor is burning
! 4.  An empty space fills with a tree with probability p
! 
! Neighborhood is the Moore neighborhood; boundary conditions are so that
! on the boundary the cells are always empty ("fixed" boundary condition).
! 
! At the beginning, populate the lattice with empty and tree cells
! according to a specific probability (e.g. a cell has the probability 0.5
! to be a tree). Then, let the system evolve.
! 
! Task's requirements do not include graphical display or the ability to
! change parameters (probabilities p and f ) through a graphical or
! command line interface.
! 
! Related tasks:
! 
! -   See Conway's Game of Life
! -   See Wireworld.

USING: combinators grouping kernel literals math math.matrices
math.vectors prettyprint random raylib.ffi sequences ;
IN: rosetta-code.forest-fire

! The following private vocab builds up to a useful combinator,
! matrix-map-neighbors, which takes a matrix, a quotation, and
! inside the quotation makes available each element of the
! matrix as well as its neighbors, mapping the result of the
! quotation to a new matrix.

<PRIVATE

CONSTANT: neighbors {
    { -1 -1 } { -1  0 } { -1  1 }
    {  0 -1 }           {  0  1 }
    {  1 -1 } {  1  0 } {  1  1 }
}

: ?i,j ( i j matrix -- elt/f ) swapd ?nth ?nth ;

: ?i,jths ( seq matrix -- newseq )
    [ [ first2 ] dip ?i,j ] curry map ;

: neighbor-coords ( loc -- seq )
    [ neighbors ] dip [ v+ ] curry map ;

: get-neighbors ( loc matrix -- seq )
    [ neighbor-coords ] dip ?i,jths ;

: matrix>neighbors ( matrix -- seq )
    dup dim matrix-coordinates concat
    [ swap get-neighbors sift ] with map ;

: matrix-map-neighbors ( ... matrix quot: ( ... neighbors elt -- ... newelt ) -- ... newmatrix )
    [ [ dim first ] [ matrix>neighbors ] [ concat ] tri ] dip
    2map swap group ; inline

PRIVATE>


! ##### Simulation code #####

! In our forest,
! 0 = empty
! 1 = tree
! 2 = fire

CONSTANT: ignite-probability 1/12000
CONSTANT: grow-probability 1/100

: make-forest ( m n probability -- matrix )
    [ random-unit > 1 0 ? ] curry make-matrix ;

: ?ignite ( -- 1/2 ) ignite-probability random-unit > 2 1 ? ;
: ?grow ( -- 0/1 ) grow-probability random-unit > 1 0 ? ;

: next-plot ( neighbors elt -- n )
    {
        { [ dup 2 = ] [ 2drop 0 ] }
        { [ 2dup [ [ 2 = ] any? ] [ 1 = ] bi* and ] [ 2drop 2 ] }
        { [ 1 = ] [ drop ?ignite ] }
        [ drop ?grow ]
    } cond ;

: next-forest ( forest -- newforest )
    [ next-plot ] matrix-map-neighbors ;


! ##### Display code #####

CONSTANT: colors ${ GRAY GREEN RED }

: draw-forest ( matrix -- )
    dup dim matrix-coordinates [ concat ] bi@ swap [
        [ first2 [ 5 * ] bi@ 5 5 ] dip colors nth draw-rectangle
    ] 2each ;

500 500 "Forest Fire" init-window 100 100 1/2 make-forest
60 set-target-fps
[ window-should-close ] [    
    begin-drawing
        BLACK clear-background dup draw-forest
    end-drawing
    next-forest
] until drop close-window
