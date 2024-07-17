! The task is to create 1 pixel wide coloured vertical pinstripes with a
! sufficient number of pinstripes to span the entire width of the graphics
! display.
! 
! The pinstripes should either follow the system palette sequence, or a
! sequence that includes:
! 
! black, red, green, blue, magenta, cyan, yellow, and white:
! 
! -   -   after filling the top quarter, switch to a wider 2 pixel wide
!         vertical pinstripe pattern,
!     -   halfway down the display, switch to 3 pixel wide vertical
!         pinstripe,
!     -   finally to a 4 pixels wide vertical pinstripe for the last
!         quarter of the display.
! 
! See also:
! 
! -   display black and white
! -   print colour

USING: accessors arrays colors.constants kernel locals math
math.ranges opengl sequences ui ui.gadgets ui.render ;

CONSTANT: palette
{
    COLOR: black
    COLOR: red
    COLOR: green
    COLOR: blue
    COLOR: magenta
    COLOR: cyan
    COLOR: yellow
    COLOR: white
}

CONSTANT: bands 4

TUPLE: pinstripe < gadget ;

: <pinstripe> ( -- pinstripe ) pinstripe new ;

M: pinstripe pref-dim* drop { 400 400 } ;

: set-color ( n -- ) palette length mod palette nth gl-color ;

:: draw-pinstripe ( pinstripe n -- )
    pinstripe dim>> first2 :> ( w h )
    h 4 /i :> quarter
    quarter n * :> y2
    y2 quarter - :> y1
    0 w n <range> [| x |
        x n / set-color x y1 2array x n + y2 2array gl-fill-rect
    ] each ;

M: pinstripe draw-gadget*
    bands [1,b] [ draw-pinstripe ] with each ;

<pinstripe> "Color pinstripe" open-window
