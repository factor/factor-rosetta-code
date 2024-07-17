! The Farey sequence F_(n) of order n is the sequence of completely
! reduced fractions between 0 and 1 which, when in lowest terms, have
! denominators less than or equal to n, arranged in order of increasing
! size.
! 
! The Farey sequence is sometimes incorrectly called a Farey series.
! 
! Each Farey sequence:
! 
! -   -   starts with the value 0 (zero), denoted by the fraction
!         $\frac{0}{1}$
!     -   ends with the value 1 (unity), denoted by the fraction
!         $\frac{1}{1}$.
! 
! The Farey sequences of orders 1 to 5 are:
! 
!     
! 
!         ${\bf\it{F}}_1 = \frac{0}{1}, \frac{1}{1}$
! 
!     
! 
!     
! 
!         ${\bf\it{F}}_2 = \frac{0}{1}, \frac{1}{2}, \frac{1}{1}$
! 
!     
! 
!     
! 
!         ${\bf\it{F}}_3 = \frac{0}{1}, \frac{1}{3}, \frac{1}{2}, \frac{2}{3}, \frac{1}{1}$
! 
!     
! 
!     
! 
!         ${\bf\it{F}}_4 = \frac{0}{1}, \frac{1}{4}, \frac{1}{3}, \frac{1}{2}, \frac{2}{3}, \frac{3}{4}, \frac{1}{1}$
! 
!     
! 
!     
! 
!         ${\bf\it{F}}_5 = \frac{0}{1}, \frac{1}{5}, \frac{1}{4}, \frac{1}{3}, \frac{2}{5}, \frac{1}{2}, \frac{3}{5}, \frac{2}{3}, \frac{3}{4}, \frac{4}{5}, \frac{1}{1}$
! 
! Task
! 
! -   Compute and show the Farey sequence for orders 1 through 11
!     (inclusive).
! -   Compute and display the number of fractions in the Farey sequence
!     for order 100 through 1,000 (inclusive) by hundreds.
! -   Show the fractions as n/d (using the solidus [or slash] to separate
!     the numerator from the denominator).
! 
! The length (the number of fractions) of a Farey sequence asymptotically
! approaches:
! 
!     
! 
!          3 × n² ÷ π²
! 
! See also:
! 
! -   OEIS sequence A006842 numerators of Farey series of order 1, 2, ···
! -   OEIS sequence A006843 denominators of Farey series of order 1, 2,
!     ···
! -   OEIS sequence A005728 number of fractions in Farey series of order n
! -   MathWorld entry Farey sequence
! -   Wikipedia entry Farey sequence

USING: formatting io kernel math math.primes.factors math.ranges
locals prettyprint sequences sequences.extras sets tools.time ;
IN: rosetta-code.farey-sequence

! Given the order n and a farey pair, calculate the next member
! of the sequence.
:: p/q ( n a/b c/d -- p/q )
    a/b c/d [ >fraction ] bi@ :> ( a b c d )
    n b + d / >integer [ c * a - ] [ d * b - ] bi / ;
    
: print-farey ( order -- )
    [ "F(%-2d): " printf ] [ 0 1 pick / ] bi "0/1 " write
    [ dup 1 = ] [ dup pprint bl 3dup p/q [ nip ] dip ] until
    3drop "1/1" print ;
    
: φ ( n -- m ) ! Euler's totient function
    [ factors members [ 1 swap recip - ] map-product ] [ * ] bi ;
    
: farey-length ( order -- length )
   dup 1 = [ drop 2 ]
   [ [ 1 - farey-length ] [ φ ] bi + ] if ;
   
: part1 ( -- ) 11 [1,b] [ print-farey ] each nl ;

: part2 ( -- )
    100 1,000 100 <range>
    [ dup farey-length "F(%-4d): %-6d members.\n" printf ] each ;
    
: main ( -- ) [ part1 part2 nl ] time ;

MAIN: main
