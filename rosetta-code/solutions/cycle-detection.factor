! Task:
! 
! Detect a cycle in an iterated function using Brent's algorithm.
! 
! Detecting cycles in iterated function sequences is a sub-problem in many
! computer algorithms, such as factoring prime numbers. Some such
! algorithms are highly space efficient, such as Floyd's cycle-finding
! algorithm, also called the "tortoise and the hare algorithm". A more
! time efficient algorithm than "tortoise and hare" is Brent's Cycle
! algorithm. This task will implement Brent's algorithm.
! 
! See https://en.wikipedia.org/wiki/Cycle_detection for a discussion of
! the theory and discussions of other algorithms that are used to solve
! the problem.
! 
! When testing the cycle detecting function, you need two things:
! 
! 1) An iterated function
! 
! 2) A starting value
! 
! The iterated function used in this example is: f(x) = (x*x + 1) modulo
! 255.
! 
! The starting value used is 3.
! 
! With these as inputs, a sample program output would be:
! 
! 3,10,101,2,5,26,167,95,101,2,5,26,167,95,101,2,5,26,167,95,101,2,5,26,167,95,101,2,5,26,167,95,101,2,5,26,167,95,101,2,5
! 
! Cycle length = 6
! 
! Start index = 2
! 
! The output prints the first several items in the number series produced
! by the iterated function, then identifies how long the cycle is (6)
! followed by the zero-based index of the start of the first cycle (2).
! From this you can see that the cycle is:
! 
! 101,2,5,26,167,95

USING: formatting kernel locals make math prettyprint ;

: cyclical-function ( n -- m ) dup * 1 + 255 mod ;

:: brent ( x0 quot -- λ μ )
    1 dup :> ( power! λ! )
    x0 :> tortoise!
    x0 quot call :> hare!
    [ tortoise hare = not ] [
        power λ = [
            hare tortoise!
            power 2 * power!
            0 λ! 
        ] when
        hare quot call hare!
        λ 1 + λ!
    ] while

    0 :> μ!
    x0 dup tortoise! hare!
    λ [ hare quot call hare! ] times
    [ tortoise hare = not ] [
        tortoise quot call tortoise!
        hare quot call hare!
        μ 1 + μ!
    ] while
    λ μ ; inline

3 [ 20 [ dup , cyclical-function ] times ] { } make nip .
3 [ cyclical-function ] brent
"Cycle length: %d\nCycle start: %d\n" printf
