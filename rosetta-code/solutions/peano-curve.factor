! ;Task
! 
! Produce a graphical or ASCII-art representation of a Peano curve of at
! least order 3.

USING: accessors L-system ui ;

: peano ( L-system -- L-system )
    L-parser-dialect >>commands
    [ 90 >>angle ] >>turtle-values
    "L" >>axiom
    {
        { "L" "LFRFL-F-RFLFR+F+LFRFL" }
        { "R" "RFLFR+F+LFRFL-F-RFLFR" }
    } >>rules ;

[ <L-system> peano "Peano curve" open-window ] with-ui
