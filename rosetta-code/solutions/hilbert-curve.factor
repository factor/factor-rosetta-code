! ;Task
! 
! Produce a graphical or ASCII-art representation of a Hilbert curve of at
! least order 3.

USING: accessors L-system ui ;

: hilbert ( L-system -- L-system )
    L-parser-dialect >>commands
    [ 90 >>angle ] >>turtle-values
    "A" >>axiom
    {
        { "A" "-BF+AFA+FB-" }
        { "B" "+AF-BFB-FA+" }
    } >>rules ;

[ <L-system> hilbert "Hilbert curve" open-window ] with-ui
