! There are several so-called "self-describing" or "self-descriptive"
! integers.
! 
! An integer is said to be "self-describing" if it has the property that,
! when digit positions are labeled 0 to N-1, the digit in each position is
! equal to the number of times that that digit appears in the number.
! 
! For example, 2020 is a four-digit self describing number:
! 
! -   position 0 has value 2 and there are two 0s in the number;
! -   position 1 has value 0 and there are no 1s in the number;
! -   position 2 has value 2 and there are two 2s;
! -   position 3 has value 0 and there are zero 3s.
! 
! Self-describing numbers < 100.000.000 are: 1210, 2020, 21200, 3211000,
! 42101000.
! 
! Task Description
! 
! 1.  Write a function/routine/method/... that will check whether a given
!     positive integer is self-describing.
! 2.  As an optional stretch goal - generate and display the set of
!     self-describing numbers.
! 
! Related tasks:
! 
! -   Fours is the number of letters in the ...
! -   Look-and-say sequence
! -   Number names
! -   Self-referential sequence
! -   Spelling of ordinal numbers

USING: kernel math.parser prettyprint sequences ;
IN: rosetta-code.self-describing-numbers

: digits ( n -- seq ) number>string string>digits ;

: digit-count ( seq n -- m ) [ = ] curry count ;

: self-describing-number? ( n -- ? )
    digits dup [ digit-count = ] with map-index [ t = ] all? ;

100,000,000 <iota> [ self-describing-number? ] filter .
