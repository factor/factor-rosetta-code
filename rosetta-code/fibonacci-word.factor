! The Fibonacci Word may be created in a manner analogous to the Fibonacci
! Sequence as described here:
! 
!     Define F_Word¹ as 1
!     Define F_Word² as 0
!     Form F_Word³ as F_Word² concatenated with F_Word¹  i.e.: 01
!     Form F_Word_(n) as F_Word_(n-1) concatenated with F_word_(n-2)
! 
! Task:
! 
! Perform the above steps for n = 37.
! 
! You may display the first few but not the larger values of n.
! 
! {Doing so will get the task's author into trouble with them what be
! (again!).}
! 
! Instead, create a table for F_Words 1 to 37 which shows:
! 
! -   -   The number of characters in the word
!     -   The word's Entropy
! 
! Related tasks:
! 
! -   Fibonacci word/fractal
! -   Entropy
! -   Entropy/Narcissist

USING: assocs combinators formatting kernel math math.functions
math.ranges math.statistics namespaces pair-rocket sequences ;
IN: rosetta-code.fibonacci-word

SYMBOL: 37th-fib-word

: fib ( n -- m )
    {
        1 => [ 1 ]
        2 => [ 1 ]
        [ [ 1 - fib ] [ 2 - fib ] bi + ]
    } case ;

: fib-word ( n -- seq )
    {
        1 => [ "1" ]
        2 => [ "0" ]
        [ [ 1 - fib-word ] [ 2 - fib-word ] bi append ]
    } case ;

: nth-fib-word ( n -- seq )
    dup 1 =
    [ drop "1" ] [ 37th-fib-word get swap fib head ] if ;
    
: entropy ( seq -- entropy )
    [ length ] [ histogram >alist [ second ] map ] bi
    [ swap / ] with map
    [ dup log 2 log / * ] map-sum
    dup 0. = [ neg ] unless ;

37 fib-word 37th-fib-word set
"N" "Length" "Entropy" "%2s  %8s  %10s\n" printf
37 [1,b] [
   dup nth-fib-word [ length ] [ entropy ] bi
   "%2d  %8d  %.8f\n" printf
] each
