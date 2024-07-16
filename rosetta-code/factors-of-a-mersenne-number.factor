! A Mersenne number is a number in the form of 2^(P)-1.
! 
! If P is prime, the Mersenne number may be a Mersenne prime (if P is not
! prime, the Mersenne number is also not prime).
! 
! In the search for Mersenne prime numbers it is advantageous to eliminate
! exponents by finding a small factor before starting a, potentially
! lengthy, Lucas-Lehmer test.
! 
! There are very efficient algorithms for determining if a number divides
! 2^(P)-1 (or equivalently, if 2^(P) mod (the number) = 1). Some languages
! already have built-in implementations of this exponent-and-mod operation
! (called modPow or similar).
! 
! The following is how to implement this modPow yourself:
! 
! For example, let's compute 2²³ mod 47. Convert the exponent 23 to
! binary, you get 10111. Starting with square = 1, repeatedly square it.
! Remove the top bit of the exponent, and if it's 1 multiply square by the
! base of the exponentiation (2), then compute square modulo 47. Use the
! result of the modulo from the last step as the initial value of square
! in the next step:
! 
!                   remove       optional   
!       square      top bit   multiply by 2   mod 47
!    ────────────   ───────   ─────────────   ────── 
!    1*1 = 1        1  0111   1*2 = 2            2
!    2*2 = 4        0   111      no              4
!    4*4 = 16       1    11   16*2 = 32         32
!    32*32 = 1024   1     1   1024*2 = 2048     27
!    27*27 = 729    1         729*2 = 1458       1
! 
! Since 2²³ mod 47 = 1, 47 is a factor of 2^(P)-1. (To see this, subtract
! 1 from both sides: 2²³-1 = 0 mod 47.) Since we've shown that 47 is a
! factor, 2²³-1 is not prime. Further properties of Mersenne numbers allow
! us to refine the process even more. Any factor q of 2^(P)-1 must be of
! the form 2kP+1, k being a positive integer or zero. Furthermore, q must
! be 1 or 7 mod 8. Finally any potential factor q must be prime. As in
! other trial division algorithms, the algorithm stops when 2kP+1 >
! sqrt(N).
! 
! These primality tests only work on Mersenne numbers where P is prime.
! For example, M₄=15 yields no factors using these techniques, but factors
! into 3 and 5, neither of which fit 2kP+1.
! 
! Task:
! 
! Using the above method find a factor of 2⁹²⁹-1 (aka M929)
! 
! Related tasks:
! 
! -   count in factors
! -   prime decomposition
! -   factors of an integer
! -   Sieve of Eratosthenes
! -   primality by trial division
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes
! -   sequence of primes by Trial Division
! 
! See also:
! 
! -   Computers in 1948: 2¹²⁷ - 1
! 
! (Note: This video is no longer available because the YouTube account associated with this video has been terminated.)

USING: combinators.short-circuit interpolate io kernel locals   
math math.bits math.functions math.primes sequences ;
IN: rosetta-code.mersenne-factors

: mod-pow-step ( square bit m -- square' )
    [ [ sq ] [ [ 2 * ] when ] bi* ] dip mod ;

:: mod-pow ( m q -- n )
    1 :> s! m make-bits <reversed>
    [ s swap q mod-pow-step s! ] each s ;

: halt-search? ( m q N -- ? )
    dupd > [
        {
            [ nip 8 mod [ 1 ] [ 7 ] bi [ = ] 2bi@ or ]
            [ mod-pow 1 = ] [ nip prime? ]
        } 2&&
    ] dip or ;

:: find-mersenne-factor ( m -- factor/f )
    1          :> k!
    2 m * 1 +  :> q!                 ! the tentative factor.
    2 m ^ sqrt :> N                  ! upper bound on search.
    [ m q N halt-search? ] [ k 1 + k! 2 k * m * 1 + q! ] until
    q N > f q ? ;

: test-mersenne ( m -- )
    dup find-mersenne-factor
    [ [I M${1} is not prime: factor ${0} found.I] ]
    [ [I No factor found for M${}.I] ] if* nl ;

929 test-mersenne
