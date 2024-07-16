! An emirp (prime spelled backwards) are primes that when reversed (in
! their decimal representation) are a different prime.
! 
! (This rules out palindromic primes.)
! 
! Task:
! 
! -   -   show the first twenty emirps
!     -   show all emirps between 7,700 and 8,000
!     -   show the 10,000^(th) emirp
! 
! In each list, the numbers should be in order.
! 
! Invoke the (same) program once per task requirement, this will show what
! limit is used as the upper bound for calculating surplus (regular)
! primes.
! 
! The specific method of how to determine if a range or if specific values
! are to be shown will be left to the programmer.
! 
! See also:
! 
! -   Wikipedia, Emirp.
! -   The Prime Pages, emirp.
! -   Wolfram MathWorld™, Emirp.
! -   The On‑Line Encyclopedia of Integer Sequences, emirps (A6567).

USING: io kernel lists lists.lazy math.extras math.parser
    math.primes sequences ;
FROM: prettyprint => . pprint ;
IN: rosetta-code.emirp

: rev ( n -- n' )
    number>string reverse string>number ;

: emirp? ( n -- ? )
    dup rev [ = not ] [ [ prime? ] bi@ ] 2bi and and ;
    
: nemirps ( n -- seq )
    0 lfrom [ emirp? ] lfilter ltake list>array ;
    
: print-seq ( seq -- )
    [ pprint bl ] each nl ;
    
: part1 ( -- )
    "First 20 emirps:" print 20 nemirps print-seq ;
    
: part2 ( -- )
    "Emirps between 7700 and 8000:" print
    7700 ... 8000 [ emirp? ] filter print-seq ;
    
: part3 ( -- )
    "10,000th emirp:" print 10,000 nemirps last . ;
    
: main ( -- )
    part1 nl part2 nl part3 ;
    
MAIN: main
