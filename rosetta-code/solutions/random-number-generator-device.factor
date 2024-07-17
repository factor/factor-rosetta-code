! Task:
! 
! If your system has a means to generate random numbers involving not only
! a software algorithm (like the /dev/urandom devices in Unix), then:
! 
! show how to obtain a random 32-bit number from that mechanism.
! 
! Related task
! 
! -   Random_number_generator_(included)
! 
! Category:Input Output

USE: random
[ random-32 ] with-system-random .
