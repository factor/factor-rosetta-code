! Task:
! 
! Display a series of vertical color bars across the width of the display.
! 
! The color bars should either use:
! 
! -   -   the system palette, or
!     -   the sequence of colors:
!         -   -   black
!             -   red
!             -   green
!             -   blue
!             -   magenta
!             -   cyan
!             -   yellow
!             -   white

USING: accessors colors.constants kernel math sequences ui
ui.gadgets ui.gadgets.tracks ui.pens.solid ;
IN: rosetta-code.colour-bars-display

: colors ( -- ) [
horizontal <track>
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
[ <solid> gadget new swap >>interior ] map
dup length recip
[ track-add ] curry each
{ 640 480 } >>pref-dim
"bars" open-window
] with-ui ;
MAIN: colors
