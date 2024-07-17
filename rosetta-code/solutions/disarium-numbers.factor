! A Disarium number is an integer where the sum of each digit raised to
! the power of its position in the number, is equal to the number.
! 
! E.G.
! 
! 135 is a Disarium number:
! 
! 1¹ + 3² + 5³ == 1 + 9 + 125 == 135
! 
! There are a finite number of Disarium numbers.
! 
! Task
! 
! -   Find and display the first 18 Disarium numbers.
! 
! Stretch
! 
! -   Find and display all 20 Disarium numbers.
! 
! See also
! 
! * Geeks for Geeks - Disarium numbers
! * OEIS:A032799 - Numbers n such that n equals the sum of its digits raised to the consecutive powers (1,2,3,...)
! * Related task: Narcissistic decimal number
! * Related task: Own digits power sum Which seems to be the same task as Narcissistic decimal number...

USING: io kernel lists lists.lazy math.ranges math.text.utils
math.vectors prettyprint sequences ;

: disarium? ( n -- ? )
    dup 1 digit-groups dup length 1 [a,b] v^ sum = ;

: disarium ( -- list ) 0 lfrom [ disarium? ] lfilter ;

19 disarium ltake [ pprint bl ] leach nl
