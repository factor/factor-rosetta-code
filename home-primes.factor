! In number theory, the home prime HP(n) of an integer n greater than 1 is
! the prime number obtained by repeatedly factoring the increasing
! concatenation of prime factors including repetitions.
! 
! The traditional notation has the prefix "HP" and a postfix count of the
! number of iterations until the home prime is found (if the count is
! greater than 0), for instance HP4(2) === HP22(1) === 211 is the same as
! saying the home prime of 4 needs 2 iterations and is the same as the
! home prime of 22 which needs 1 iteration, and (both) resolve to 211, a
! prime.
! 
! Prime numbers are their own home prime;
! 
! So:
! 
!    HP2 = 2
!    
!    HP7 = 7
! 
! If the integer obtained by concatenating increasing prime factors is not
! prime, iterate until you reach a prime number; the home prime.
! 
!    HP4(2) = HP22(1) = 211
!    HP4(2) = 2 × 2 => 22; HP22(1) = 2 × 11 => 211; 211 is prime  
!    
!    HP10(4) = HP25(3) = HP55(2) = HP511(1) = 773
!    HP10(4) = 2 × 5 => 25; HP25(3) = 5 × 5 => 55; HP55(2) = 5 × 11 => 511; HP511(1) = 7 × 73 => 773; 773 is prime  
! 
! Task
! 
! -   Find and show here, on this page, the home prime iteration chains
!     for the integers 2 through 20 inclusive.
! 
! Stretch goal
! 
! -   Find and show the iteration chain for 65.
! 
! Impossible goal
! 
! -   Show the the home prime for HP49.
! 
! See also
! 
! * OEIS:A037274 - Home primes for n >= 2
! * OEIS:A056938 - Concatenation chain for HP49

USING: formatting kernel make math math.parser math.primes
math.primes.factors math.ranges present prettyprint sequences
sequences.extras ;

: squish ( seq -- n ) [ present ] map-concat dec> ;

: next ( m -- n ) factors squish ; inline

: (chain) ( n -- ) [ dup prime? ] [ dup , next ] until , ;

: chain ( n -- seq ) [ (chain) ] { } make ;

: prime. ( n -- ) dup "HP%d = %d\n" printf ;

: setup ( seq -- n s r ) unclip-last swap dup length 1 [a,b] ;

: multi. ( n -- ) chain setup [ "HP%d(%d) = " printf ] 2each . ;

: chain. ( n -- ) dup prime? [ prime. ] [ multi. ] if ;

2 20 [a,b] [ chain. ] each
