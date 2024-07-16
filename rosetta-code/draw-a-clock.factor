! Task:
! 
! Draw a clock.
! 
! More specific:
! 
! 1.  Draw a time keeping device. It can be a stopwatch, hourglass,
!     sundial, a mouth counting "one thousand and one", anything. Only
!     showing the seconds is required, e.g.: a watch with just a second
!     hand will suffice. However, it must clearly change every second, and
!     the change must cycle every so often (one minute, 30 seconds, etc.)
!     It must be drawn; printing a string of numbers to your terminal
!     doesn't qualify. Both text-based and graphical drawing are OK.
! 2.  The clock is unlikely to be used to control space flights, so it
!     needs not be hyper-accurate, but it should be usable, meaning if one
!     can read the seconds off the clock, it must agree with the system
!     clock.
! 3.  A clock is rarely (never?) a major application: don't be a CPU hog
!     and poll the system timer every microsecond, use a proper
!     timer/signal/event from your system or language instead. For a bad
!     example, many OpenGL programs update the frame-buffer in a busy loop
!     even if no redraw is needed, which is very undesirable for this
!     task.
! 4.  A clock is rarely (never?) a major application: try to keep your
!     code simple and to the point. Don't write something too elaborate or
!     convoluted, instead do whatever is natural, concise and clear in
!     your language.
! 
! Key points
! 
! -   animate simple object
! -   timed event
! -   polling system resources
! -   code clarity

