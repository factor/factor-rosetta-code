! MRG32k3a Combined recursive generator (pseudo-code):
! 
!    /* Constants */
!    /* First generator */
!    a1 = [0, 1403580, -810728]
!    m1 = 2**32 - 209
!    /* Second Generator */
!    a2 = [527612, 0, -1370589]
!    m2 = 2**32 - 22853
! 
!    d = m1 + 1
! 
!    class MRG32k3a
!        x1 = [0, 0, 0]  /* list of three last values of gen #1 */
!        x2 = [0, 0, 0]  /* list of three last values of gen #2 */
! 
!        method seed(u64 seed_state)
!            assert seed_state in range >0 and < d 
!            x1 = [seed_state, 0, 0]
!            x2 = [seed_state, 0, 0]
!        end method
! 
!        method next_int()
!            x1i = (a1[0]*x1[0] + a1[1]*x1[1] + a1[2]*x1[2]) mod m1
!            x2i = (a2[0]*x2[0] + a2[1]*x2[1] + a2[2]*x2[2]) mod m2
!            x1 = [x1i, x1[0], x1[1]]    /* Keep last three */
!            x2 = [x2i, x2[0], x2[1]]    /* Keep last three */
!            z = (x1i - x2i) % m1
!            answer = (z + 1)
! 
!            return answer
!        end method
! 
!        method next_float():
!            return float next_int() / d
!        end method
! 
!    end class
! 
!     MRG32k3a Use:
! 
!    random_gen = instance MRG32k3a
!    random_gen.seed(1234567)
!    print(random_gen.next_int())   /* 1459213977 */
!    print(random_gen.next_int())   /* 2827710106 */
!    print(random_gen.next_int())   /* 4245671317 */
!    print(random_gen.next_int())   /* 3877608661 */
!    print(random_gen.next_int())   /* 2595287583 */
! 
! Task
! 
! -   Generate a class/set of functions that generates pseudo-random
! 
! numbers as shown above.
! 
! -   Show that the first five integers generated with the seed `1234567`
! 
! are as shown above
! 
! -   Show that for an initial seed of '987654321' the counts of 100_000
! 
! repetitions of
! 
!    floor(random_gen.next_float() * 5)
! 
! Is as follows:
! 
!    0: 20002, 1: 20060, 2: 19948, 3: 20059, 4: 19931
! 
! -   Show your output here, on this page.

USING: arrays kernel math math.order math.statistics
math.vectors prettyprint sequences ;

CONSTANT: m1 4294967087
CONSTANT: m2 4294944443

: seed ( n -- seq1 seq2 )
    dup 1 m1 between? t assert= 0 0 3array dup ;

: new-state ( seq1 seq2 n -- new-seq )
    [ dup ] [ vdot ] [ rem prefix but-last ] tri* ;

: next-state ( a b -- a' b' )
    [ { 0 1403580 -810728 } m1 new-state ]
    [ { 527612 0 -1370589 } m2 new-state ] bi* ;

: next-int ( a b -- a' b' n )
    next-state 2dup [ first ] bi@ - m1 rem 1 + ;

: next-float ( a b -- a' b' x ) next-int m1 1 + /f ;

! Task
1234567 seed 5 [ next-int . ] times 2drop

987654321 seed 100,000 [ next-float 5 * >integer ] replicate
2nip histogram .
