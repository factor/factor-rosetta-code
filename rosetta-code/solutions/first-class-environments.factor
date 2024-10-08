! According to Wikipedia, "In computing, a first-class object ... is an
! entity that can be constructed at run-time, passed as a parameter,
! returned from a subroutine, or assigned into a variable".
! 
! Often this term is used in the context of "first class functions". In an
! analogous way, a programming language may support "first class
! environments".
! 
! The environment is minimally, the set of variables accessible to a
! statement being executed. Change the environments and the same statement
! could produce different results when executed.
! 
! Often an environment is captured in a closure, which encapsulates a
! function together with an environment. That environment, however, is not
! first-class, as it cannot be created, passed etc. independently from the
! function's code.
! 
! Therefore, a first class environment is a set of variable bindings which
! can be constructed at run-time, passed as a parameter, returned from a
! subroutine, or assigned into a variable. It is like a closure without
! code. A statement must be able to be executed within a stored first
! class environment and act according to the environment variable values
! stored within.
! 
! Task:
! 
! Build a dozen environments, and a single piece of code to be run
! repeatedly in each of these environments.
! 
! Each environment contains the bindings for two variables:
! 
! -   -   a value in the Hailstone sequence, and
!     -   a count which is incremented until the value drops to 1.
! 
! The initial hailstone values are 1 through 12, and the count in each
! environment is zero.
! 
! When the code runs, it calculates the next hailstone step in the current
! environment (unless the value is already 1) and counts the steps. Then
! it prints the current value in a tabular form.
! 
! When all hailstone values dropped to 1, processing stops, and the total
! number of hailstone steps for each environment is printed.

USING: assocs continuations formatting io kernel math
math.ranges sequences ;

: (next-hailstone) ( count value -- count' value' )
    [ 1 + ] [ dup even? [ 2/ ] [ 3 * 1 + ] if ] bi* ;

: next-hailstone ( count value -- count' value' )
    dup 1 = [ (next-hailstone) ] unless ;

: make-environments ( -- seq ) 12 [ 0 ] replicate 12 [1,b] zip ;

: step ( seq -- new-seq )
    [ [ dup "%4d " printf next-hailstone ] with-datastack ] map
    nl ;

: done? ( seq -- ? ) [ second 1 = ] all? ;

make-environments
[ dup done? ] [ step ] until nl
"Counts:" print
[ [ drop "%4d " printf ] with-datastack drop ] each nl
