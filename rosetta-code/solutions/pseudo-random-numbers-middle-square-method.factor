! The Method:
! 
! To generate a sequence of n-digit pseudorandom numbers, an n-digit
! starting value is created and squared, producing a 2n-digit number. If
! the result has fewer than 2n digits, leading zeroes are added to
! compensate. The middle n digits of the result would be the next number
! in the sequence and returned as the result. This process is then
! repeated to generate more numbers.
! 
! Pseudo code:
! 
!     var seed = 675248
!     function random()
!         var s = str(seed * seed) 'str: turn a number into string
!         do while not len(s) = 12
!             s = "0" + s          'add zeroes before the string
!         end do
!         seed = val(mid(s, 4, 6)) 'mid: string variable, start, length
!                                  'val: turn a string into number
!         return seed
!     end function
! 
! Middle-square method use:
! 
!     for i = 1 to 5
!         print random()
!     end for
! 
! Task:
! 
! -   Generate a class/set of functions that generates pseudo-random
! 
! numbers (6 digits) as shown above.
! 
! -   Show the first five integers generated with the seed 675248 as shown
!     above.
! 
! -   Show your output here, on this page.

USING: kernel math namespaces prettyprint ;

SYMBOL: seed
675248 seed set-global

: rand ( -- n ) seed get sq 1000 /i 1000000 mod dup seed set ;

5 [ rand . ] times
