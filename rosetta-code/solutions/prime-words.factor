! A word is a prime word if all its individual letters (expressed as an
! ASCII decimal code) are primes.
! 
!         A  ASCII decimal code is:  65 
!         B  ASCII decimal code is:  66 
!         C  ASCII decimal code is:  67 
! 
!         X  ASCII decimal code is:  88 
!         Y  ASCII decimal code is:  89 
!         Z  ASCII decimal code is:  90 
! 
!         a  ASCII decimal code is:  97 
!         b  ASCII decimal code is:  98 
!         c  ASCII decimal code is:  99 
! 
!         x  ASCII decimal code is:  120 
!         y  ASCII decimal code is:  121 
!         z  ASCII decimal code is:  122 
! 
! Task:
! 
! Show here on this page every prime word in unixdict.txt.

USING: io.encodings.ascii io.files math.primes prettyprint sequences ;

"unixdict.txt" ascii file-lines [ [ prime? ] all? ] filter .
