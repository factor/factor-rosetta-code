! Albert and Bernard just became friends with Cheryl, and they want to
! know when her birthday is.
! 
! Cheryl gave them a list of ten possible dates:
! 
!      May 15,     May 16,     May 19
!      June 17,    June 18
!      July 14,    July 16
!      August 14,  August 15,  August 17
! 
! Cheryl then tells Albert the month of birth, and Bernard the day (of the
! month) of birth.
! 
!  1)  Albert:   I don't know when Cheryl's birthday is, but I know that Bernard does not know too.
!  2)  Bernard:  At first I don't know when Cheryl's birthday is, but I know now.
!  3)  Albert:   Then I also know when Cheryl's birthday is.
! 
! Task
! 
! Write a computer program to deduce, by successive elimination, Cheryl's
! birthday.
! 
! Related task:
! 
! -   Sum and Product Puzzle
! 
! References
! 
! -   Wikipedia article of the same name.
! -   [https://en.wikipedia.org/wiki/Tuple_relational_calculus, Tuple
!     Relational Calculus]

USING: assocs calendar.english fry io kernel prettyprint
sequences sets.extras ;

: unique-by ( seq quot -- newseq )
    2dup map non-repeating '[ @ _ member? ] filter ; inline

ALIAS: day first
ALIAS: month second

{
    { 15 5 } { 16 5 } { 19 5 } { 17 6 } { 18 6 }
    { 14 7 } { 16 7 } { 14 8 } { 15 8 } { 17 8 }
}

! the month cannot have a unique day
dup [ day ] map non-repeating over extract-keys values
'[ month _ member? ] reject

! of the remaining dates, day must be unique
[ day ] unique-by

! of the remaining dates, month must be unique
[ month ] unique-by

! print a date that looks like { { 16 7 } }
first first2 month-name write bl .
