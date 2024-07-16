! Task:
! 
! Show  the ASCII character set  from values 32 to 127 (decimal) in a
! table format.

USING: combinators formatting io kernel math math.ranges
pair-rocket sequences ;
IN: rosetta-code.ascii-table

: main ( -- )
    16 <iota> [
        32 + 127 16 <range> [
            dup {
                32  => [ "Spc" ]
                127 => [ "Del" ]
                [ "" 1sequence ]
            } case
            "%3d : %-3s   " printf
        ] each
        nl
    ] each
;

MAIN: main
