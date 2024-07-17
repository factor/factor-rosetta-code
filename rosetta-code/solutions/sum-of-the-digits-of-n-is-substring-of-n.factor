! Task:
! 
! Find and show numbers n with property that the sum of the decimal digits
! of n is substring of n, where n < 1,000

USING: grouping kernel math.text.utils present prettyprint
sequences ;

1000 <iota>
[ [ 1 digit-groups sum present ] [ present ] bi subseq? ] filter
8 group simple-table.
