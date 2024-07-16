! Given a random number generator, (rng), generating numbers in the range
! 0.0 .. 1.0 called rgen, for example; and a function modifier(x) taking
! an number in the same range and generating the probability that the
! input should be generated, in the same range 0..1; then implement the
! following algorithm for generating random numbers to the probability
! given by function modifier:
! 
!     while True:
!         random1 = rgen()
!         random2 = rgen()
!         if random2 < modifier(random1):
!             answer = random1
!             break
!         endif
!     endwhile
! 
! Task:
! 
! -   Create a modifier function that generates a 'V' shaped probability
!     of number generation using something like, for example:
! 
!                       modifier(x)  =  2*(0.5 - x)  if x < 0.5  else 2*(x - 0.5) 
! 
! -   Create a generator of random numbers with probabilities modified by
!     the above function.
! -   Generate >= 10,000 random numbers subject to the probability
!     modification.
! -   Output a textual histogram with from 11 to 21 bins showing the
!     distribution of the random numbers generated.
! 
! Show your output here, on this page.

USING: assocs assocs.extras formatting io kernel math
math.functions math.statistics random sequences
tools.memory.private ;

: modifier ( x -- y ) 0.5 over 0.5 < [ swap ] when - dup + ;

: random-unit-by ( quot: ( x -- y ) -- z )
    random-unit dup pick call random-unit 2dup >
    [ 2drop nip ] [ 3drop random-unit-by ] if ; inline recursive

: data ( n quot bins -- histogram )
    '[ _ random-unit-by _ * >integer ] replicate histogram ;
    inline

:: .histogram ( h -- )
    
    h assoc-size :> buckets   ! number of buckets
    h sum-values :> total     ! items in histogram
    h values supremum :> max  ! largest bucket (as in most occurrences)
    40 :> size                ! max size of a bar

    total commas buckets
    "Bin          Histogram (%s items, %d buckets)\n" printf

    h [| k v |
        k buckets / dup buckets recip + "[%.2f, %.2f) " printf
        size v * max / ceiling
        [ "▇" write ] times bl bl v commas print
    ] assoc-each ;

"Modified random distribution of values in [0, 1):" print nl
100,000 [ modifier ] 20 data .histogram
