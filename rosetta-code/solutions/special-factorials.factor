! This task is an aggregation of lesser-known factorials that nevertheless
! have some mathematical use.
! 
! +-----------------------+---------+---------------------+------------------+
! | Name                  | Formula | Example calculation | Links            |
! +=======================+=========+=====================+==================+
! | Superfactorial        |         |                     | -   Wikipedia    |
! |                       |         |                     | -   OEIS:A000178 |
! +-----------------------+---------+---------------------+------------------+
! | Hyperfactorial        |         |                     | -   Wikipedia    |
! |                       |         |                     | -   OEIS:A002109 |
! +-----------------------+---------+---------------------+------------------+
! | Alternating factorial |         |                     | -   Wikipedia    |
! |                       |         |                     | -   OEIS:A005165 |
! +-----------------------+---------+---------------------+------------------+
! | Exponential factorial |         |                     | -   Wikipedia    |
! |                       |         |                     | -   OEIS:A049384 |
! +-----------------------+---------+---------------------+------------------+
! 
! : Special factorials
! 
! Task
! 
! -   Write a function/procedure/routine for each of the factorials in the
!     table above.
! -   Show sf(n), H(n), and af(n) where 0 ≤ n ≤ 9. Only show as many
!     numbers as the data types in your language can handle. Bignums are
!     welcome, but not required.
! -   Show 0$, 1$, 2$, 3$, and 4$.
! -   Show the number of digits in 5$. (Optional)
! -   Write a function/procedure/routine to find the inverse factorial
!     (sometimes called reverse factorial). That is, if , then . This
!     function is simply undefined for most inputs.
! -   Use the inverse factorial function to show the inverse factorials of
!     1, 2, 6, 24, 120, 720, 5040, 40320, 362880, and 3628800.
! -   Show rf(119). The result should be undefined.
! 
! Notes
!     Since the factorial inverse of 1 is both 0 and 1, your function
!     should return 0 in this case since it is normal to use the first
!     match found in a series.
! 
! See also
! 
! -   Factorial
! -   Factorions
! -   Left factorials
! -   Multifactorial
! -   Primorial numbers
! -   Stirling numbers of the first kind

USING: formatting io kernel math math.factorials math.functions
math.parser math.ranges prettyprint sequences sequences.extras ;
IN: rosetta-code.special-factorials

: sf ( n -- m ) [1..b] [ n! ] map-product ;
: (H) ( n -- m ) [1..b] [ dup ^ ] map-product ;
: H ( n -- m ) [ 1 ] [ (H) ] if-zero ;
:: af ( n -- m ) n [1..b] [| i | -1 n i - ^ i n! * ] map-sum ;
: $ ( n -- m ) [1..b] [ ] [ swap ^ ] map-reduce ;

: (rf) ( n -- m )
    [ 1 1 ] dip [ dup reach > ]
    [ [ 1 + [ * ] keep ] dip ] while swapd = swap and ;

: rf ( n -- m ) dup 1 = [ drop 0 ] [ (rf) ] if ;

: .show ( n quot -- )
    [ pprint bl ] compose each-integer nl ; inline

"First 10 superfactorials:" print
10 [ sf ] .show nl

"First 10 hyperfactorials:" print
10 [ H ] .show nl

"First 10 alternating factorials:" print
10 [ af ] .show nl

"First 5 exponential factorials:" print
5 [ $ ] .show nl

"Number of digits in 5$:" print
5 $ log10 >integer 1 + . nl

{ 1 2 6 24 120 720 5040 40320 362880 3628800 119 }
[ dup rf "rf(%d) = %u\n" printf ] each nl
