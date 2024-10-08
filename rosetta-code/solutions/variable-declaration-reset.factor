! A decidely non-challenging task to highlight a potential difference
! between programming languages.
! 
! Using a straightforward longhand loop as in the JavaScript and Phix
! examples below, show the locations of elements which are identical to
! the immediately preceding element in {1,2,2,3,4,4,5}. The (non-blank)
! results may be 2,5 for zero-based or 3,6 if one-based.
! 
! The purpose is to determine whether variable declaration (in block
! scope) resets the contents on every iteration.
! 
! There is no particular judgement of right or wrong here, just a
! plain-speaking statement of subtle differences.
! 
! Should your first attempt bomb with "unassigned variable" exceptions,
! feel free to code it as (say)
! 
!  // int prev // crashes with unassigned variable
!     int prev = -1 // predictably no output
! 
! If your programming language does not support block scope (eg assembly)
! it should be omitted from this task.

USING: kernel math prettyprint sequences ;

[let
    { 1 2 2 3 4 4 5 } :> s
    s length <iota> [| i |
        i s nth -1 :> ( curr prev! )    
        i 0 > curr prev = and
        [ i . ] when
        curr prev!
    ] each
]
