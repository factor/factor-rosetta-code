! The task is to determine the joystick position and represent this on the
! display via a crosshair. For a centred joystick, the crosshair should
! appear in the centre of the screen. If the joystick is pushed left or
! right, then the cross hair should move left or right according to the
! extent that the joystick is pushed.
! 
! If the joystick is pushed forward or pulled back, then the crosshair
! should move up or down according to the extent that that joystick is
! pushed or pulled. The edges of the display represent maximum extents for
! joystick movement.
! 
! For example, a joystick pushed fully forward would raise the crosshair
! to the top centre of the screen.
! 
! A joystick pulled backwards and to the right would move the crosshair to
! the bottom right of the screen (except for a small area reserved to show
! joystick status). Implementations can use a graphical display method to
! produce the crosshair, or alternatively represent the crosshair using a
! plus symbol on a terminal, and move the plus symbol position according
! to the joystick. The bottom part of the display can hide or show an
! alphanumeric sequence to represent the buttons pressed.
! 
! For example, if pushbuttons 1,4 and 10 are depressed, we could display
! "1 4 A".
! 
! The implemented code should continue to redraw the crosshair according
! to the joystick position and show the current pushbutton statuses until
! the task is terminated. Digital joysticks that produce no extent data,
! should have their position indicated as full extent movement of the
! crosshair.
! 
! For the purpose of this task, we assume that the joystick is calibrated
! and that the first joystick is being used.
! 
! The task implementer could at their option provide a solution that
! includes a joystick selection facility, enabling the user to choose
! which joystick is to be used for this task.


