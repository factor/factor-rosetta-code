! Task
! 
! Produce a graphical or ASCII-art representation of a Sierpinski
! arrowhead curve of at least order 3.

USING: accessors L-system ui ;

: arrowhead ( L-system -- L-system )
    L-parser-dialect >>commands
    [ 60 >>angle ] >>turtle-values
    "XF" >>axiom
    {
        { "X" "YF+XF+Y" }
        { "Y" "XF-YF-X" }
    } >>rules ;

[ <L-system> arrowhead "Arrowhead" open-window ] with-ui
