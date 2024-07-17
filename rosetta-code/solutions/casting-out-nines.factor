! Task (in three parts):
! 
! Part 1
! 
! Write a procedure (say co9(x)) which implements Casting Out Nines as
! described by returning the checksum for x. Demonstrate the procedure
! using the examples given there, or others you may consider lucky.
! 
! Note that this function does nothing more than calculate the least
! positive residue, modulo 9. Many of the solutions omit Part 1 for this
! reason. Many languages have a modulo operator, of which this is a
! trivial application.
! 
! With that understanding, solutions to Part 1, if given, are encouraged
! to follow the naive pencil-and-paper or mental arithmetic of repeated
! digit addition understood to be "casting out nines", or some approach
! other than just reducing modulo 9 using a built-in operator. Solutions
! for part 2 and 3 are not required to make use of the function presented
! in part 1.
! 
! Part 2
! 
! Notwithstanding past Intel microcode errors, checking computer
! calculations like this would not be sensible. To find a computer use for
! your procedure:
! 
!     Consider the statement "318682 is 101558 + 217124 and squared is
!     101558217124" (see: Kaprekar numbers#Casting Out Nines (fast)).
!     note that 318682 has the same checksum as (101558 + 217124);
!     note that 101558217124 has the same checksum as (101558 + 217124)
!     because for a Kaprekar they are made up of the same digits
!     (sometimes with extra zeroes);
!     note that this implies that for Kaprekar numbers the checksum of k
!     equals the checksum of k².
! 
! Demonstrate that your procedure can be used to generate or filter a
! range of numbers with the property co9(k) = co9(k²) and show that this
! subset is a small proportion of the range and contains all the Kaprekar
! in the range.
! 
! Part 3
! 
! Considering this MathWorld page, produce a efficient algorithm based on
! the more mathematical treatment of Casting Out Nines, and realizing:
! 
!     co9(x) is the residual of x mod 9;
!     the procedure can be extended to bases other than 9.
! 
! Demonstrate your algorithm by generating or filtering a range of numbers
! with the property k and show that this subset is a small proportion of
! the range and contains all the Kaprekar in the range.
! 
! related tasks
! 
! -   First perfect square in base N with N unique digits
! -   Kaprekar numbers


