! Create and display a dragon curve fractal.
! 
! (You may either display the curve directly or write it to an image
! file.)
! 
! Algorithms
! 
! Here are some brief notes the algorithms used and how they might suit
! various languages.
! 
! -   Recursively a right curling dragon is a right dragon followed by a
!     left dragon, at 90-degree angle. And a left dragon is a left
!     followed by a right.
! 
!     *---R----*     expands to     *       *
!                                    \     /
!                                     R   L
!                                      \ /
!                                       *
! 
!                                       *
!                                      / \
!                                     L   R
!                                    /     \
!     *---L---*      expands to     *       *
! 
!     The co-routines dcl and dcr in various examples do this recursively
!     to a desired expansion level.
! 
! -   The curl direction right or left can be a parameter instead of two
!     separate routines.
! 
! -   Recursively, a curl direction can be eliminated by noting the dragon
!     consists of two copies of itself drawn towards a central point at
!     45-degrees.
! 
!     *------->*   becomes    *       *     Recursive copies drawn
!                              \     /      from the ends towards
!                               \   /       the centre.
!                                v v
!                                 *
! 
!     This can be seen in the SVG example. This is best suited to off-line
!     drawing since the reversal in the second half means the drawing
!     jumps backward and forward (in binary reflected Gray code order)
!     which is not very good for a plotter or for drawing progressively on
!     screen.
! 
! -   Successive approximation repeatedly re-writes each straight line as
!     two new segments at a right angle,
! 
!                            *       
!     *-----*   becomes     / \      bend to left
!                          /   \     if N odd
!                         *     *
! 
!                         *     *   
!     *-----*   becomes    \   /     bend to right  
!                           \ /      if N even 
!                            *
! 
!     Numbering from the start of the curve built so far, if the segment
!     is at an odd position then the bend introduced is on the right side.
!     If the segment is an even position then on the left. The process is
!     then repeated on the new doubled list of segments. This constructs a
!     full set of line segments before any drawing.
! 
!     The effect of the splitting is a kind of bottom-up version of the
!     recursions. See the Asymptote example for code doing this.
! 
! -   Iteratively the curve always turns 90-degrees left or right at each
!     point. The direction of the turn is given by the bit above the
!     lowest 1-bit of n. Some bit-twiddling can extract that efficiently.
! 
!     n = 1010110000
!             ^
!             bit above lowest 1-bit, turn left or right as 0 or 1
! 
!     LowMask = n BITXOR (n-1)   # eg. giving 0000011111
!     AboveMask = LowMask + 1    # eg. giving 0000100000
!     BitAboveLowestOne = n BITAND AboveMask
! 
!     The first turn is at n=1, so reckon the curve starting at the origin
!     as n=0 then a straight line segment to position n=1 and turn there.
! 
!     If you prefer to reckon the first turn as n=0 then take the bit
!     above the lowest 0-bit instead. This works because "...10000" minus
!     1 is "...01111" so the lowest 0 in n-1 is where the lowest 1 in n
!     is.
! 
!     Going by turns suits turtle graphics such as Logo or a plotter
!     drawing with a pen and current direction.
! 
! -   If a language doesn't maintain a "current direction" for drawing
!     then you can always keep that separately and apply turns by
!     bit-above-lowest-1.
! 
! -   Absolute direction to move at point n can be calculated by the
!     number of bit-transitions in n.
! 
!     n = 11 00 1111 0 1
!           ^  ^    ^ ^     4 places where change bit value
!                           so direction=4*90degrees=East
! 
!     This can be calculated by counting the number of 1 bits in "n XOR (n
!     RIGHTSHIFT 1)" since such a shift and xor leaves a single 1 bit at
!     each position where two adjacent bits differ.
! 
! -   Absolute X,Y coordinates of a point n can be calculated in complex
!     numbers by some powers (i+1)^k and add/subtract/rotate. This is done
!     in the gnuplot code. This might suit things similar to Gnuplot which
!     want to calculate each point independently.
! 
! -   Predicate test for whether a given X,Y point or segment is on the
!     curve can be done. This might suit line-by-line output rather than
!     building an entire image before printing. See M4 for an example of
!     this.
! 
!     A predicate works by dividing out complex number i+1 until reaching
!     the origin, so it takes roughly a bit at a time from X and Y is thus
!     quite efficient. Why it works is slightly subtle but the calculation
!     is not difficult. (Check segment by applying an offset to move X,Y
!     to an "even" position before dividing i+1. Check vertex by whether
!     the segment either East or West is on the curve.)
! 
!     The number of steps in the predicate corresponds to doublings of the
!     curve, so stopping the check at say 8 steps can limit the curve
!     drawn to 2^8=256 points. The offsets arising in the predicate are
!     bits of n the segment number, so can note those bits to calculate n
!     and limit to an arbitrary desired length or sub-section.
! 
! -   As a Lindenmayer system of expansions. The simplest is two symbols F
!     and S both straight lines, as used by the PGF code.
! 
!     Axiom F, angle 90 degrees
!     F -> F+S
!     S -> F-S
! 
! This always has F at even positions and S at odd. Eg. after 3 levels
! F_S_F_S_F_S_F_S. The +/- turns in between bend to the left or right the
! same as the "successive approximation" method above. Read more at for
! instance Joel Castellanos' L-system page.
! 
! Variations are possible if you have only a single symbol for line draw,
! for example the Icon and Unicon and Xfractint code. The angles can also
! be broken into 45-degree parts to keep the expansion in a single
! direction rather than the endpoint rotating around.
! 
! The string rewrites can be done recursively without building the whole
! string, just follow its instructions at the target level. See for
! example C by IFS Drawing code. The effect is the same as "recursive with
! parameter" above but can draw other curves defined by L-systems.

USING: accessors colors colors.hsv fry kernel locals math
math.constants math.functions opengl.gl typed ui ui.gadgets
ui.gadgets.canvas ui.render ;

IN: dragon

CONSTANT: depth 12

TUPLE: turtle
    { angle fixnum }
    { color float }
    { x float }
    { y float } ;

TYPED: nxt-color ( turtle: turtle -- turtle )
    [ [ 360 2 depth ^ /f + ] keep
      1.0 1.0 1.0 <hsva> >rgba-components glColor4d
    ] change-color ; inline

TYPED: draw-fwd ( x1: float y1: float x2: float y2: float -- )
    GL_LINES glBegin glVertex2d glVertex2d glEnd ; inline

TYPED:: fwd ( turtle: turtle l: float -- )
    turtle x>>
    turtle y>>
    turtle angle>> pi * 180 / :> ( x y angle )
    l angle [ cos * x + ] [ sin * y + ] 2bi :> ( dx dy )
    turtle x y dx dy [ draw-fwd ] 2keep [ >>x ] [ >>y ] bi* drop ; inline

TYPED: trn ( turtle: turtle d: fixnum -- turtle )
    '[ _ + ] change-angle ; inline

TYPED:: dragon' ( turtle: turtle l: float s: fixnum d: fixnum -- )
    s zero? [
        turtle nxt-color l fwd ! don't like this drop
    ] [
        turtle d  45 * trn l 2 sqrt / s 1 -  1 dragon'
        turtle d -90 * trn l 2 sqrt / s 1 - -1 dragon'
        turtle d  45 * trn drop
    ] if ;

: dragon ( -- )
    0 0 150 180 turtle boa 400 depth 1 dragon' ;

TUPLE: dragon-canvas < canvas ;

M: dragon-canvas draw-gadget* [ drop dragon ] draw-canvas ;
M: dragon-canvas pref-dim* drop { 640 480 } ;

MAIN-WINDOW: dragon-window { { title "Dragon Curve" } }
    dragon-canvas new-canvas >>gadgets ;

MAIN: dragon-window
