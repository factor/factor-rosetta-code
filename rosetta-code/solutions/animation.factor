! Animation is integral to many parts of GUIs, including both the fancy
! effects when things change used in window managers, and of course games.
! The core of any animation system is a scheme for periodically changing
! the display while still remaining responsive to the user. This task
! demonstrates this.
! 
! Task:
! 
! Create a window containing the string "Hello World!" (the trailing space
! is significant).
! 
! Make the text appear to be rotating right by periodically removing one
! letter from the end of the string and attaching it to the front.
! 
! When the user clicks on the (windowed) text, it should reverse its
! direction.
! 
! Category:GUI Category:Animation

USING: accessors timers calendar kernel models sequences ui
ui.gadgets ui.gadgets.labels ui.gestures ;
FROM: models => change-model ;
IN: rosetta.animation
 
CONSTANT: sentence "Hello World! "
 
TUPLE: animated-label < label-control reversed alarm ;
: <animated-label> ( model -- <animated-model> )
    sentence animated-label new-label swap >>model 
    monospace-font >>font ;
: update-string ( str reverse -- str )
    [ unclip-last prefix ] [ unclip suffix ] if ;
: update-model ( model reversed? -- )
    [ update-string ] curry change-model ;
 
animated-label  
    H{ 
        { T{ button-down } [ [ not ] change-reversed drop ] }
     } set-gestures
 
M: animated-label graft*
  [ [ [ model>> ] [ reversed>> ] bi update-model ] curry 400 milliseconds every ] keep
  alarm<< ;
M: animated-label ungraft*
    alarm>> stop-timer ;
: main ( -- )
   [ sentence <model> <animated-label> "Rosetta" open-window ] with-ui ;
 
MAIN: main
