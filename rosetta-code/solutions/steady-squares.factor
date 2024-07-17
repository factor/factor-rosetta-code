! Euler Project #284:
! Task:
! 
! The 3-digit number 376 in the decimal numbering system is an example of
! numbers with the special property that its square ends with the same
! digits: 376*376 = 141376. Let's call a number with this property a
! steady square. Find steady squares under 10.000

USING: formatting kernel math math.functions
math.functions.integer-logs prettyprint sequences
tools.memory.private ;

: steady? ( n -- ? )
    [ sq ] [ integer-log10 1 + 10^ mod ] [ = ] tri ;

1000 <iota> { 1 5 6 } [
    [ 10 * ] dip + dup steady?
    [ dup sq commas "%4d^2 = %s\n" printf ] [ drop ] if
] cartesian-each
