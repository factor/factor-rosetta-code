! Task:
! 
! An animation with the following frames in the following order (if
! certain characters aren't available or can't be used correctly in the
! programming language, alternate characters can replace any of these
! frames) must animate with a delay of 0.25 seconds between each frame,
! with the previous frame being cleared before the next frame appears:
! 
! -   -   |
!     -   /
!     -   - or ─
!     -   \
! 
! A stand-alone version that loops and/or a version that doesn't loop can
! be made. These examples can also be converted into a system used in game
! development which is called on a HUD or GUI element requiring it to be
! called each frame to output the text, and advance the frame when the
! frame delay has passed. You can also use alternate text such as the .
! animation ( . | .. | ... | .. | repeat from . ) or the logic can be
! updated to include a ping/pong style where the frames advance forward,
! reach the end and then play backwards and when they reach the beginning
! they start over ( technically, you'd stop one frame prior to prevent the
! first frame playing twice, or write it another way ).
! There are many different ways you can incorporate text animations. Here
! are a few text ideas - each frame is in quotes. If you can think of any,
! add them to this page! There are 2 examples for several of these; the
! first is the base animation with only unique sets of characters. The
! second consists of the primary set from a - n and doubled, minus the
! first and last element ie: We only want the center. This way an
! animation can play forwards, and then in reverse ( ping ponging )
! without having to code that feature. For the animations with 3 elements,
! we only add 1, the center. with 4, it becomes 6. with 10, it becomes 18.
! We don't need the second option for some of the animations if they
! connect smoothly, when animated, back to the first element. ... doesn't
! connect with . cleanly - there is a large leap. The rotating pipe meets
! the first perfectly so it isn't necessary, etc..
! ** Dots - Option A requires ping / pong enabled script. Option B just
! adds the elements in the center.
! 
! -   -   '.', '..', '...'
!     -   '.', '..', '...', '..'
! -   -   Pipe - This has the uniform sideways pipe instead of a hyphen to
!         prevent non-uniform sizing.
!         -   '|', '/', '─', '\'
!     -   Stars - Option A requires ping / pong enabled script. Option B
!         just adds the elements from the center.
!         -   '⁎', '⁑', '⁂'
!         -   '⁎', '⁑', '⁂', '⁑'
!     -   Clock - These need to be ordered. I haven't done this yet as the
!         application I was testing the system in doesn't support these
!         wingdings / icons. But this would look quite nice and you could
!         set it up to go forward, or backward during an undo process,
!         etc..
!         -   '🕛', '🕧', '🕐', '🕜', '🕑', '🕝', '🕒', '🕞', '🕓', '🕟',
!             '🕔', '🕠', '🕕', '🕖', '🕗', '🕘', '🕙', '🕚', '🕡', '🕢',
!             '🕣', '🕤', '🕥', '🕦'
!     -   Arrows:
!         -   '⬍', '⬈', '➞', '⬊', '⬍', '⬋', '⬅', '⬉'
!     -   Bird - This looks decent but may be missing something.
!         -   '︷', '︵', '︹', '︺', '︶', '︸'
!         -   '︷', '︵', '︹', '︺', '︶', '︸', '︶', '︺', '︹', '︵'
!     -   Plants - This isn't quite complete
!         -   '☘', '❀', '❁'
!         -   '☘', '❀', '❁', '❀'
!     -   Eclipse - From Raku Throbber post author
!         -   '🌑', '🌒', '🌓', '🌔', '🌕', '🌖', '🌗', '🌘'

USING: calendar combinators.extras formatting io sequences
threads ;

[
    "\\|/-" [ "%c\r" printf flush 1/4 seconds sleep ] each
] forever
