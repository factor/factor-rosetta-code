! Two integers N and M are said to be amicable pairs if N ≠ M and the sum
! of the proper divisors of N (sum(propDivs(N)))  = M as well as
! sum(propDivs(M)) = N.
! 
! Example:
! 
! 1184 and 1210 are an amicable pair, with proper divisors:
! 
! -   1, 2, 4, 8, 16, 32, 37, 74, 148, 296, 592 and
! -   1, 2, 5, 10, 11, 22, 55, 110, 121, 242, 605 respectively.
! 
! Task:
! 
! Calculate and show here the Amicable pairs below 20,000; (there are
! eight).
! 
! Related tasks
! 
! -   Proper divisors
! -   Abundant, deficient and perfect number classifications
! -   Aliquot sequence classifications and its amicable classification.

USING: grouping math.primes.factors math.ranges ;

: pdivs      ( n -- seq )   divisors but-last ;
: dsum       ( n -- sum )   pdivs sum ;
: dsum=      ( n m -- ? )   dsum = ;
: both-dsum= ( n m -- ? )   [ dsum= ] [ swap dsum= ] 2bi and ;
: amicable?  ( n m -- ? )   [ both-dsum= ] [ = not ] 2bi and ;
: drange     ( -- seq )     2 20000 [a,b) ;
: dsums      ( -- seq )     drange [ dsum ] map ;
: is-am?-seq ( -- seq )     dsums drange [ amicable? ] 2map ;
: am-nums    ( -- seq )     t is-am?-seq indices ;
: am-nums-c  ( -- seq )     am-nums [ 2 + ] map ;
: am-pairs   ( -- seq )     am-nums-c 2 group ;
: print-am   ( -- )         am-pairs [ >array . ] each ;

print-am
