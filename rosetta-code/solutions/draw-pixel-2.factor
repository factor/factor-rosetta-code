! Task:
! 
! Create a window and draw a pixel in it, subject to the following:
! 
! ::# the window is 640 x 480
! 
! ::# the color of the pixel must be yellow (255,255,0)
! 
! ::# the position of the pixel is random

USING: kernel random raylib.ffi ;

640 480 2dup "random yellow pixel" init-window [ random ] bi@

60 set-target-fps [ window-should-close ] [
    begin-drawing BLACK clear-background 2dup YELLOW draw-pixel
    end-drawing
] until close-window
