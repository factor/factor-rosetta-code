! Jacobsthal numbers are an integer sequence related to Fibonacci numbers.
! Similar to Fibonacci, where each term is the sum of the previous two
! terms, each term is the sum of the previous, plus twice the one before
! that. Traditionally the sequence starts with the given terms 0, 1.
! 
!    J⁰ = 0
!    J¹ = 1
!    J_(n) = J_(n-1) + 2 × J_(n-2)
! 
! Terms may be calculated directly using one of several possible formulas:
! 
!    J_(n) = ( 2^(n) - (-1)^(n) ) / 3
! 
! Jacobsthal-Lucas numbers are very similar. They have the same recurrence
! relationship, the only difference is an initial starting value J₀ = 2
! rather than J₀ = 0.
! 
! Terms may be calculated directly using one of several possible formulas:
! 
!    
!    JL_(n) = 2^(n) + (-1)^(n)
!    
! 
! Jacobsthal oblong numbers is the sequence obtained from multiplying each
! Jacobsthal number J_(n) by its direct successor J_(n+1).
! 
! Jacobsthal primes are Jacobsthal numbers that are prime.
! 
! Task
! 
! -   Find and display the first 30 Jacobsthal numbers
! -   Find and display the first 30 Jacobsthal-Lucas numbers
! -   Find and display the first 20 Jacobsthal oblong numbers
! -   Find and display at least the first 10 Jacobsthal primes
! 
! See also
! * Wikipedia: Jacobsthal number
! * Numbers Aplenty - Jacobsthal number
! * OEIS:A001045 - Jacobsthal sequence (or Jacobsthal numbers)
! * OEIS:A014551 - Jacobsthal-Lucas numbers.
! * OEIS:A084175 - Jacobsthal oblong numbers
! * OEIS:A049883 - Primes in the Jacobsthal sequence
! * Related task: Fibonacci sequence
! * Related task: Leonardo numbers

USING: grouping io kernel lists lists.lazy math math.functions
math.primes prettyprint sequences ;

: 2^-1^ ( n -- 2^n -1^n ) dup 2^ -1 rot ^ ;
: jacobsthal ( m -- n ) 2^-1^ - 3 / ;
: jacobsthal-lucas ( m -- n ) 2^-1^ + ;
: as-list ( quot -- list ) 0 lfrom swap lmap-lazy ; inline
: jacobsthals ( -- list ) [ jacobsthal ] as-list ;
: lucas-jacobthals ( -- list ) [ jacobsthal-lucas ] as-list ;
: prime-jacobsthals ( -- list ) jacobsthals [ prime? ] lfilter ;
: show ( n list -- ) ltake list>array 5 group simple-table. nl ;

: oblong ( -- list )
    jacobsthals dup cdr lzip [ product ] lmap-lazy ;

"First 30 Jacobsthal numbers:" print
30 jacobsthals show

"First 30 Jacobsthal-Lucas numbers:" print
30 lucas-jacobthals show

"First 20 Jacobsthal oblong numbers:" print
20 oblong show

"First 20 Jacobsthal primes:" print
20 prime-jacobsthals ltake [ . ] leach
