! The task is to determine the maximum height and width of a window that
! can fit within the physical display area of the screen without
! scrolling.
! 
! This is effectively the screen size (not the total desktop area, which
! could be bigger than the screen display area) in pixels minus any
! adjustments for window decorations and menubars.
! 
! The idea is to determine the physical display parameters for the maximum
! height and width of the usable display area in pixels (without
! scrolling).
! 
! The values calculated should represent the usable desktop area of a
! window maximized to fit the the screen.
! 
! Considerations:
! 
! --- Multiple Monitors:
! 
! For multiple monitors, the values calculated should represent the size
! of the usable display area on the monitor which is related to the task
! (i.e.: the monitor which would display a window if such instructions
! were given).
! 
! --- Tiling Window Managers
! 
! For a tiling window manager, the values calculated should represent the
! maximum height and width of the display area of the maximum size a
! window can be created (without scrolling). This would typically be a
! full screen window (minus any areas occupied by desktop bars), unless
! the window manager has restrictions that prevents the creation of a full
! screen window, in which case the values represent the usable area of the
! desktop that occupies the maximum permissible window size (without
! scrolling).


