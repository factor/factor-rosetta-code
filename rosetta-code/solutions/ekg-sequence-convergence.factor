! The sequence is from the natural numbers and is defined by:
! 
! -   a(1) = 1;
! -   a(2) = Start = 2;
! -   for n > 2, a(n) shares at least one prime factor with a(n-1) and is
!     the smallest such natural number not already used.
! 
! The sequence is called the EKG sequence (after its visual similarity to
! an electrocardiogram when graphed).
! 
! Variants of the sequence can be generated starting 1, N where N is any
! natural number larger than one. For the purposes of this task let us
! call:
! 
! -   The sequence described above , starting 1, 2, ... the EKG(2)
!     sequence;
! -   the sequence starting 1, 3, ... the EKG(3) sequence;
! -   ... the sequence starting 1, N, ... the EKG(N) sequence.
! 
! Convergence
! 
! If an algorithm that keeps track of the minimum amount of numbers and
! their corresponding prime factors used to generate the next term is
! used, then this may be known as the generators essential state. Two EKG
! generators with differing starts can converge to produce the same
! sequence after initial differences.
! 
! EKG(N1) and EKG(N2) are said to to have converged at and after
! generation a(c) if state_of(EKG(N1).a(c)) == state_of(EKG(N2).a(c)).
! 
! Task:
! 
! 1.  Calculate and show here the first 10 members of EKG(2).
! 2.  Calculate and show here the first 10 members of EKG(5).
! 3.  Calculate and show here the first 10 members of EKG(7).
! 4.  Calculate and show here the first 10 members of EKG(9).
! 5.  Calculate and show here the first 10 members of EKG(10).
! 6.  Calculate and show here at which term EKG(5) and EKG(7) converge
!     (stretch goal).
! 
! Related Tasks:
! 
! 1.  Greatest common divisor
! 2.  Sieve of Eratosthenes
! 3.  Yellowstone sequence
! 
! Reference:
! 
! -   The EKG Sequence and the Tree of Numbers. (Video).

USING: combinators.short-circuit formatting fry io kernel lists
lists.lazy math math.statistics prettyprint sequences
sequences.generalizations ;

: ekg? ( n seq -- ? )
    { [ member? not ] [ last gcd nip 1 > ] } 2&& ;

: (ekg) ( seq -- seq' )
    2 lfrom over [ ekg? ] curry lfilter car suffix! ;

: ekg ( n limit -- seq )
    [ 1 ] [ V{ } 2sequence ] [ 2 - [ (ekg) ] times ] tri* ;

: show-ekgs ( seq n -- )
    '[ dup _ ekg "EKG(%d) = %[%d, %]\n" printf ] each ;

: converge-at ( n m max -- o )
    tuck [ ekg [ cum-sum ] [ rest-slice ] bi ] 2bi@
    [ swapd [ = ] 2bi@ and ] 4 nfind 4drop dup [ 2 + ] when ;

{ 2 5 7 9 10 } 20 show-ekgs nl
"EKG(5) and EKG(7) converge at term " write
5 7 100 converge-at .
