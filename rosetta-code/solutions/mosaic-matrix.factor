! Task:
! 
! Draw a 'mosaic' matrix which, for the purposes of this task, is a square
! matrix which has 1's in alternate cells (both horizontally and
! vertically) starting with a 1 in the top-left hand cell.
! 
! Other cells can either be left blank or filled with some other
! character.
! 
! If you can please use GUI
! 
! Mosaic Matrix - image
! 
! See also
! 
! -   Four sides of square
! -   Matrix with two diagonals

USING: accessors colors kernel math math.matrices ui
ui.gadgets.grid-lines ui.gadgets.grids ui.gadgets.labels
ui.pens.solid ;
IN: mosaic

: <square> ( m n -- gadget )
    + 2 mod 0 = [
        " 1 " <label> COLOR: AntiqueWhite2 <solid> >>interior
        [ 50 >>size ] change-font
    ] [ "" <label> ] if ;

: <checkerboard> ( n -- gadget )
    dup [ <square> ] <matrix-by-indices> <grid>
    COLOR: gray <grid-lines> >>boundary ;

MAIN: [ 8 <checkerboard> "Mosaic" open-window ]
