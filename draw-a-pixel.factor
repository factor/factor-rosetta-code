! Task:
! 
! Create a window and draw a pixel in it, subject to the following:
! 
! ::#  the window is 320 x 240
! 
! ::#  the color of the pixel must be red (255,0,0)
! 
! ::#  the position of the pixel is x = 100, y = 100

USING: accessors arrays images images.testing images.viewer
kernel literals math sequences ;
IN: rosetta-code.draw-pixel

: draw-pixel ( -- )
    B{ 255 0 0 } 100 100 <rgb-image> 320 240 [ 2array >>dim ]
    [ * ] 2bi [ { 0 0 0 } ] replicate B{ } concat-as >>bitmap
    [ set-pixel-at ] keep image-window ;

MAIN: draw-pixel
