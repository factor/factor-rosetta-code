! FRACTRAN is a Turing-complete esoteric programming language invented by
! the mathematician John Horton Conway.
! 
! A FRACTRAN program is an ordered list of positive fractions
! P = (f₁, f₂, …, f_(m)), together with an initial positive integer input
! n.
! 
! The program is run by updating the integer n as follows:
! 
! -   for the first fraction, f_(i), in the list for which nf_(i) is an
!     integer, replace n with nf_(i) ;
! -   repeat this rule until no fraction in the list produces an integer
!     when multiplied by n, then halt.
! 
! Conway gave a program for primes in FRACTRAN:
! 
!     17/91, 78/85, 19/51, 23/38, 29/33, 77/29, 95/23, 77/19, 1/17, 11/13,
!     13/11, 15/14, 15/2, 55/1
! 
! Starting with n = 2, this FRACTRAN program will change n to
! 15 = 2 × (15/2), then 825 = 15 × (55/1), generating the following
! sequence of integers:
! 
!     2, 15, 825, 725, 1925, 2275, 425, 390, 330, 290, 770, …
! 
! After 2, this sequence contains the following powers of 2:
! 
! 2² = 4
! , 2³ = 8, 2⁵ = 32, 2⁷ = 128, 2¹¹ = 2048, 2¹³ = 8192, 2¹⁷ = 131072,
! 2¹⁹ = 524288, …
! 
! which are the prime powers of 2.
! 
! Task:
! 
! Write a program that reads a list of fractions in a natural format from
! the keyboard or from a string, to parse it into a sequence of fractions
! (i.e. two integers), and runs the FRACTRAN starting from a provided
! integer, writing the result at each step. It is also required that the
! number of steps is limited (by a parameter easy to find).
! 
! Extra credit:
! 
! Use this program to derive the first 20 or so prime numbers.
! 
! See also:
! 
! For more on how to program FRACTRAN as a universal programming language,
! see:
! 
! -   J. H. Conway (1987). Fractran: A Simple Universal Programming
!     Language for Arithmetic. In: Open Problems in Communication and
!     Computation, pages 4–26. Springer.
! 
! -   J. H. Conway (2010). "FRACTRAN: A simple universal programming
!     language for arithmetic". In Jeffrey C. Lagarias. The Ultimate
!     Challenge: the 3x+1 problem. American Mathematical Society. pp.
!     249–264. ISBN 978-0-8218-4940-8. Zbl 1216.68068.
! 
! -   Number Pathology: Fractran by Mark C. Chu-Carroll; October 27, 2006.

USING: io kernel math math.functions math.parser multiline
prettyprint sequences splitting ;
IN: rosetta-code.fractran

STRING: fractran-string
17/91 78/85 19/51 23/38 29/33 77/29 95/23
77/19 1/17 11/13 13/11 15/14 15/2 55/1
;

: fractran-parse ( str -- seq )
    " \n" split [ string>number ] map ;
    
: fractran-step ( seq n -- seq n'/f )
    2dup [ * integer? ] curry find nip dup [ * ] [ nip ] if ;
    
: fractran-run-full ( seq n -- )
    [ dup ] [ dup . fractran-step ] while 2drop ;
    
: fractran-run-limited ( seq n steps -- )
    [ dup pprint bl fractran-step ] times 2drop nl ;
    
: fractran-primes ( #primes seq n -- )
    [ pick zero? ] [
        dup 2 logn dup [ floor 1e-9 ~ ] [ 1. = not ] bi and [
            dup 2 logn >integer pprint bl [ 1 - ] 2dip
        ] when fractran-step
    ] until 3drop nl ;
    
: main ( -- )
    fractran-string fractran-parse 2
    [ "First 20 numbers: " print 20 fractran-run-limited nl ]
    [ "First 20 primes: " print [ 20 ] 2dip fractran-primes ]
    2bi ;
    
MAIN: main
