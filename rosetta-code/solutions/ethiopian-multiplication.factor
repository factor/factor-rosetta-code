! Ethiopian multiplication is a method of multiplying integers using only
! addition, doubling, and halving.
! 
! Method:
! 
! 1.  Take two numbers to be multiplied and write them down at the top of
!     two columns.
! 2.  In the left-hand column repeatedly halve the last number, discarding
!     any remainders, and write the result below the last in the same
!     column, until you write a value of 1.
! 3.  In the right-hand column repeatedly double the last number and write
!     the result below. stop when you add a result in the same row as
!     where the left hand column shows 1.
! 4.  Examine the table produced and discard any row where the value in
!     the left column is even.
! 5.  Sum the values in the right-hand column that remain to produce the
!     result of multiplying the original two numbers together
! 
! For example: 17 × 34
! 
!        17    34
! 
! Halving the first column:
! 
!        17    34
!         8
!         4
!         2
!         1
! 
! Doubling the second column:
! 
!        17    34
!         8    68
!         4   136 
!         2   272
!         1   544
! 
! Strike-out rows whose first cell is even:
! 
!        17    34
!         8    ~~68~~ 
!         4   ~~136~~ 
!         2   ~~272~~ 
!         1   544
! 
! Sum the remaining numbers in the right-hand column:
! 
!        17    34
!         8    -- 
!         4   --- 
!         2   --- 
!         1   544
!            ====
!             578
! 
! So 17 multiplied by 34, by the Ethiopian method is 578.
! 
! Task:
! 
! The task is to define three named
! functions/methods/procedures/subroutines:
! 
! 1.  one to halve an integer,
! 2.  one to double an integer, and
! 3.  one to state if an integer is even.
! 
! Use these functions to create a function that does Ethiopian
! multiplication.
! 
! Related tasks:
! 
! -   Egyptian division
! 
! References:
! 
! -   Ethiopian multiplication explained (BBC Video clip)
! 
! -   A Night Of Numbers - Go Forth And Multiply (Video)
! 
! -   Russian Peasant Multiplication
! -   Programming Praxis: Russian Peasant Multiplication

USING: arrays kernel math multiline sequences ;
IN: ethiopian-multiplication

/*
This function is built-in
: odd? ( n -- ? ) 1 bitand 1 number= ;
*/

: double ( n -- 2*n ) 2 * ;
: halve ( n -- n/2 ) 2 /i ;

: ethiopian-mult ( a b -- a*b )
    [ 0 ] 2dip
    [ dup 0 > ] [
        [ odd? [ + ] [ drop ] if ] 2keep
        [ double ] [ halve ] bi*
    ] while 2drop ;
