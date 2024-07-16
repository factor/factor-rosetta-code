! If you add the square of the digits of a Natural number (an integer
! bigger than zero), you always end with either 1 or 89:
! 
!     15 -> 26 -> 40 -> 16 -> 37 -> 58 -> 89
!     7 -> 49 -> 97 -> 130 -> 10 -> 1
! 
! An example in Python:
! 
!     >>> step = lambda x: sum(int(d) ** 2 for d in str(x))
!     >>> iterate = lambda x: x if x in [1, 89] else iterate(step(x))
!     >>> [iterate(x) for x in xrange(1, 20)]
!     [1, 89, 89, 89, 89, 89, 1, 89, 89, 1, 89, 89, 1, 89, 89, 89, 89, 89, 1]
! 
! Task:
!     Count how many number chains for integers 1 <= n < 100_000_000 end
!     with a value 89.
! 
! Or, for much less credit - (showing that your algorithm and/or language
! is slow):
! 
!     Count how many number chains for integers 1 <= n < 1_000_000 end
!     with a value 89.
! 
! This problem derives from the Project Euler problem 92.
! 
! For a quick algorithm for this task see the talk page
! 
! Related tasks:
! 
! -   Combinations with repetitions
! -   Digital root
! -   Digital root/Multiplicative digital root
! -   Happy numbers

USING: kernel math math.ranges math.text.utils memoize
prettyprint sequences tools.time ;
IN: rosetta-code.iterated-digits-squaring

: sum-digit-sq ( n -- m ) 1 digit-groups [ sq ] map-sum ;

MEMO: 1or89 ( n -- m )
    [ dup [ 1 = ] [ 89 = ] bi or ] [ sum-digit-sq ] until ;

[
    0 1
    [
        dup sum-digit-sq 1or89 89 = [ [ 1 + ] dip ] when
        1 + dup 100,000,000 <
    ] loop
    drop .
] time
