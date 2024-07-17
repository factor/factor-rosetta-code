! Task details:
! 
! -   Use your language's random number generator to create a
!     function/method/subroutine/... randN that returns a one or a zero,
!     but with one occurring, on average, 1 out of N times, where N is an
!     integer from the range 3 to 6 inclusive.
! -   Create a function unbiased that uses only randN as its source of
!     randomness to become an unbiased generator of random ones and
!     zeroes.
! -   For N over its range, generate and show counts of the outputs of
!     randN and unbiased(randN).
! 
! The actual unbiasing should be done by generating two numbers at a time
! from randN and only returning a 1 or 0 if they are different. As long as
! you always return the first number or always return the second number,
! the probabilities discussed above should take over the biased
! probability of randN.
! 
! This task is an implementation of Von Neumann debiasing, first described
! in a 1951 paper.

USING: formatting kernel math math.ranges random sequences ;
IN: rosetta-code.unbias

: randN ( n -- m ) random zero? 1 0 ? ;

: unbiased ( n -- m )
    dup [ randN ] dup bi 2dup = not
    [ drop nip ] [ 2drop unbiased ] if ;

: test-generator ( quot -- x )
    [ 1,000,000 dup ] dip replicate sum 100 * swap / ; inline

: main ( -- )
    3 6 [a,b] [
        dup [ randN ] [ unbiased ] bi-curry
        [ test-generator ] bi@ "%d: %.2f%%  %.2f%%\n" printf
    ] each ;

MAIN: main
