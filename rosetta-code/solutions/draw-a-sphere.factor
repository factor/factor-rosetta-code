! Task:
! 
! Draw a sphere.
! 
! The sphere can be represented graphically, or in ASCII art, depending on
! the language capabilities.
! 
! Either static or rotational projection is acceptable for this task.
! 
! Related tasks:
! 
! -   draw a cuboid
! -   draw a rotating cube
! -   write language name in 3D ASCII
! -   draw a Deathstar
! 
! Category:3D

USING: classes.struct kernel raylib.ffi ;
 
640 480 "sphere" init-window
 
S{ Camera3D
    { position S{ Vector3 f 4.5 4.5 4.5 } }
    { target S{ Vector3 f 0 0 0 } }
    { up S{ Vector3 f 0 1 0 } }
    { fovy 45.0 }
    { type 0 }
}
 
60 set-target-fps
 
[ window-should-close ] [
    begin-drawing
        BLACK clear-background dup
        begin-mode-3d
            S{ Vector3 f 0 0 0 } 2 20 20 LIME draw-sphere-wires
        end-mode-3d
    end-drawing
] until drop close-window
