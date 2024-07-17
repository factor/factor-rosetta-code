! A lot of composite numbers can be separated from primes by Fermat's
! Little Theorem, but there are some that completely confound it.
! 
! The Miller Rabin Test uses a combination of Fermat's Little Theorem and
! Chinese Division Theorem to overcome this.
! 
! The purpose of this task is to investigate such numbers using a method
! based on Carmichael numbers, as suggested in Notes by G.J.O Jameson
! March 2010.
! 
! Task:
! 
! Find Carmichael numbers of the form:
! 
!     
! 
!          Prime₁ × Prime₂ × Prime₃
! 
! where (Prime₁ < Prime₂ < Prime₃) for all Prime₁ up to 61.
! 
! (See page 7 of Notes by G.J.O Jameson March 2010 for solutions.)
! 
! Pseudocode:
! 
! For a given Prime₁
! 
! for 1 < h3 < Prime¹
!     for 0 < d < h3+Prime¹
!          if (h3+Prime¹)*(Prime¹-1) mod d == 0 and -Prime¹ squared mod h3 == d mod h3
!          then
!                Prime² = 1 + ((Prime¹-1) * (h3+Prime¹)/d)
!                next d if Prime² is not prime
!                Prime³ = 1 + (Prime¹*Prime²/h3)
!                next d if Prime³ is not prime
!                next d if (Prime²*Prime³) mod (Prime¹-1) not equal 1
!                Prime¹ * Prime² * Prime³ is a Carmichael Number
! 
! related task
! 
! Chernick's Carmichael numbers

USING: formatting kernel locals math math.primes math.ranges
sequences ;
IN: rosetta-code.carmichael

:: carmichael ( p1 -- )
    1 p1 (a,b) [| h3 |
        h3 p1 + [1,b) [| d |
            h3 p1 + p1 1 - * d mod zero?
            p1 neg p1 * h3 rem d h3 mod = and
            [
                p1 1 - h3 p1 + * d /i 1 +  :> p2
                p1 p2 * h3 /i 1 +          :> p3
                p2 p3 [ prime? ] both?
                p2 p3 * p1 1 - mod 1 = and
                [ p1 p2 p3 "%d %d %d\n" printf ] when
            ] when
        ] each
    ] each
;

: carmichael-demo ( -- ) 61 primes-upto [ carmichael ] each ;

MAIN: carmichael-demo
