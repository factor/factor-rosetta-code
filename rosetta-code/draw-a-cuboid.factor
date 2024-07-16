! Task:
! 
! Draw a cuboid with relative dimensions of 2 × 3 × 4.
! 
! The cuboid can be represented graphically, or in ASCII art, depending on
! the language capabilities.
! 
! To fulfill the criteria of being a cuboid, three faces must be visible.
! 
! Either static or rotational projection is acceptable for this task.
! 
! Related tasks
! 
! -   draw a sphere
! -   draw a rotating cube
! -   write language name in 3D ASCII
! -   draw a Deathstar

USING: classes.struct kernel raylib.ffi ;

640 480 "cuboid" init-window

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
            S{ Vector3 f 0 0 0 } 2 3 4 LIME draw-cube-wires
        end-mode-3d
    end-drawing
] until drop close-window
