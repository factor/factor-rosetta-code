! Benford's law, also called the first-digit law, refers to the frequency
! distribution of digits in many (but not all) real-life sources of data.
! 
! In this distribution, the number 1 occurs as the first digit about 30%
! of the time, while larger numbers occur in that position less
! frequently: 9 as the first digit less than 5% of the time. This
! distribution of first digits is the same as the widths of gridlines on a
! logarithmic scale.
! 
! Benford's law also concerns the expected distribution for digits beyond
! the first, which approach a uniform distribution.
! 
! This result has been found to apply to a wide variety of data sets,
! including electricity bills, street addresses, stock prices, population
! numbers, death rates, lengths of rivers, physical and mathematical
! constants, and processes described by power laws (which are very common
! in nature). It tends to be most accurate when values are distributed
! across multiple orders of magnitude.
! 
! A set of numbers is said to satisfy Benford's law if the leading digit
! d(d ∈ {1, …, 9}) occurs with probability
! 
!     
! 
!         $P(d) = \log_{10}(d+1)-\log_{10}(d) = \log_{10}\left(1+\frac{1}{d}\right)$
! 
! For this task, write (a) routine(s) to calculate the distribution of
! first significant (non-zero) digits in a collection of numbers, then
! display the actual vs. expected distribution in the way most convenient
! for your language (table / graph / histogram / whatever).
! 
! Use the first 1000 numbers from the Fibonacci sequence as your data set.
! No need to show how the Fibonacci numbers are obtained.
! 
! You can generate them or load them from a file; whichever is easiest.
! 
! Display your actual vs expected distribution.
! 
! For extra credit: Show the distribution for one other set of numbers
! from a page on Wikipedia. State which Wikipedia page it can be obtained
! from and what the set enumerates. Again, no need to display the actual
! list of numbers or the code to load them.
! 
! See also:
! 
! -   numberphile.com.
! -   A starting page on Wolfram Mathworld is .

USING: assocs compiler.tree.propagation.call-effect formatting
kernel math math.functions math.statistics math.text.utils
sequences ;
IN: rosetta-code.benfords-law

: expected ( n -- x ) recip 1 + log10 ;

: next-fib ( vec -- vec' )
    [ last2 ] keep [ + ] dip [ push ] keep ;
    
: data ( -- seq ) V{ 1 1 } clone 998 [ next-fib ] times ;

: 1st-digit ( n -- m ) 1 digit-groups last ;

: leading ( -- seq ) data [ 1st-digit ] map ;

: .header ( -- )
    "Digit" "Expected" "Actual" "%-10s%-10s%-10s\n" printf ;
    
: digit-report ( digit digit-count -- digit expected actual )
    dupd [ expected ] dip 1000 /f ;
    
: .digit-report ( digit digit-count -- )
    digit-report "%-10d%-10.4f%-10.4f\n" printf ;

: main ( -- )
    .header leading histogram [ .digit-report ] assoc-each ;
    
MAIN: main
