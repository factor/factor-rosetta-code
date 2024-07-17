! A Munchausen number is a natural number n the sum of whose digits (in
! base 10), each raised to the power of itself, equals n.
! 
! (Munchausen is also spelled: Münchhausen.)
! 
! For instance: 3435 = 3³ + 4⁴ + 3³ + 5⁵
! 
! Task
! 
! Find all Munchausen numbers between 1 and 5000.
! 
! Also see:
! 
! -   -   The OEIS entry: A046253
!     -   The Wikipedia entry: Perfect digit-to-digit invariant,
!         redirected from Munchausen Number

USING: kernel math.functions math.ranges math.text.utils
prettyprint sequences ;

: munchausen? ( n -- ? )
    dup 1 digit-groups dup [ ^ ] 2map sum = ;

5000 [1,b] [ munchausen? ] filter .
