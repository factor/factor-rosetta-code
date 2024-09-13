! ::# Take an integer n, greater than zero.
! 
! ::# Form the next n of its series by reversing the digits of the current
! n and adding the result to the current n.
! 
! ::# Stop when n becomes palindromic - i.e. the digits of n in reverse
! order == n.
! 
! The above recurrence relation when applied to most starting numbers n =
! 1, 2, ... terminates in a palindrome quite quickly.
! 
! Example:
! 
! If n₀ = 12 we get
! 
!            12
!            12 +  21 =  33,   a palindrome!
! 
! And if n₀ = 55 we get
! 
!            55
!            55 +  55 = 110
!           110 + 011 = 121,   a palindrome!
! 
! Notice that the check for a palindrome happens after an addition.
! 
! Some starting numbers seem to go on forever; the recurrence relation for
! 196 has been calculated for millions of repetitions forming numbers with
! millions of digits, without forming a palindrome.
! 
! These numbers that do not end in a palindrome are called Lychrel
! numbers.
! 
! For the purposes of this task a Lychrel number is any starting number
! that does not form a palindrome within 500 (or more) iterations.
! 
! Seed and related Lychrel numbers:
! 
! Any integer produced in the sequence of a Lychrel number is also a
! Lychrel number.
! 
! In general, any sequence from one Lychrel number might converge to join
! the sequence from a prior Lychrel number candidate; for example the
! sequences for the numbers 196 and then 689 begin:
! 
!             196
!             196 +    691 =   887
!             887 +    788 =  1675
!            1675 +   5761 =  7436
!            7436 +   6347 = 13783
!           13783 +  38731 = 52514
!           52514 +  41525 = 94039
!            ...
! 
! 
!             689
!             689 +    986 =  1675
!            1675 +   5761 =  7436
!            ...
! 
! So we see that the sequence starting with 689 converges to, and
! continues with the same numbers as that for 196.
! 
! Because of this we can further split the Lychrel numbers into true Seed
! Lychrel number candidates, and Related numbers that produce no
! palindromes but have integers in their sequence seen as part of the
! sequence generated from a lower Lychrel number.
! 
! Task:
! 
! -   Find the number of seed Lychrel number candidates and related
!     numbers for n in the range 1..10000 inclusive. (With that iteration
!     limit of 500).
! -   Print the number of seed Lychrels found; the actual seed Lychrels;
!     and just the number of relateds found.
! -   Print any seed Lychrel or related number that is itself a
!     palindrome.
! 
! Show all output here.
! 
! References:
! 
! -   What's special about 196? Numberphile video.
! -   A023108 Positive integers which apparently never result in a
!     palindrome under repeated applications of the function f(x) = x + (x
!     with digits reversed).
! -   Status of the 196 conjecture? Mathoverflow.
! 
! Category:Palindromes


