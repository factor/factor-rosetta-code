! Task:
! 
! Find and display here on this page the Frobenius numbers that are <
! 10,000.
! 
! The series is defined by:
! 
!      FrobeniusNumber(n)  =  prime(n) * prime(n+1)   -   prime(n)   -   prime(n+1)
! 
! where:
! 
!     
! 
!         prime(1) = 2
!         prime(2) = 3
!         prime(3) = 5
!         prime(4) = 7
! 
!             •
!             •
!             •
! 
! Category:Prime Numbers

USING: io kernel math math.primes prettyprint ;

"Frobenius numbers < 10,000:" print
2 3 [
    [ nip dup next-prime ] [ * ] [ [ - ] dip - ] 2tri
    dup 10,000 <
] [ . ] while 3drop
