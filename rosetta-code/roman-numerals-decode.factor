! Task:
! 
! Create a function that takes a Roman numeral as its argument and returns
! its value as a numeric decimal integer.
! 
! You don't need to validate the form of the Roman numeral.
! 
! Modern Roman numerals are written by expressing each decimal digit of
! the number to be encoded separately,
! 
! starting with the leftmost decimal digit and skipping any 0s (zeroes).
! 
! 1990 is rendered as MCMXC (1000 = M, 900 = CM, 90 = XC) and
! 
! 2008 is rendered as MMVIII (2000 = MM, 8 = VIII).
! 
! The Roman numeral for 1666, MDCLXVI, uses each letter in descending
! order.

CONSTANT: roman-digits
    { "m" "cm" "d" "cd" "c" "xc" "l" "xl" "x" "ix" "v" "iv" "i" }

CONSTANT: roman-values
    { 1000 900 500 400 100 90 50 40 10 9 5 4 1 }

: roman> ( str -- n )
  >lower [ roman-digit>= ] monotonic-split
  [ roman-value ] map-sum ;

: roman-digit>= ( ch1 ch2 -- ? ) [ roman-digit-index ] bi@ >= ;

: roman-digit-index ( ch -- n ) 1string roman-digits index ;

: roman-value (seq -- n )
  [ [ roman-digit-value ] map ] [ all-eq? ] bi
  [ sum ] [ first2 swap - ] if ;

: roman-digit-value ( ch -- n )
  roman-digit-index roman-values nth ;
