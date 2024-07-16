! Many big data or scientific programs use boxplots to show distributions
! of data. In addition, sometimes saving large arrays for boxplots can be
! impractical and use extreme amounts of RAM. It can be useful to save
! large arrays as arrays with five numbers to save memory.
! 
! For example, the R programming language implements Tukey's five-number
! summary as the fivenum function.
! 
! Task:
! 
! Given an array of numbers, compute the five-number summary.
! 
! Note:
! 
! While these five numbers can be used to draw a boxplot, statistical
! packages will typically need extra data.
! 
! Moreover, while there is a consensus about the "box" of the boxplot,
! there are variations among statistical packages for the whiskers.

USING: combinators combinators.smart kernel math
math.statistics prettyprint sequences sorting ;
IN: rosetta-code.five-number

<PRIVATE

: bisect ( seq -- lower upper )
    dup length even? [ halves ]
    [ dup midpoint@ 1 + [ head ] [ tail* ] 2bi ] if ;

: (fivenum) ( seq -- summary )
    natural-sort {
        [ infimum ]
        [ bisect drop median ]
        [ median ]
        [ bisect nip median ]
        [ supremum ]
    } cleave>array ;

PRIVATE>

ERROR: fivenum-empty data ;
ERROR: fivenum-nan data ;

: fivenum ( seq -- summary )
    {
        { [ dup empty? ] [ fivenum-empty ] }
        { [ dup [ fp-nan? ] any? ] [ fivenum-nan ] }
        [ (fivenum) ]
    } cond ;

: fivenum-demo ( -- )
    { 15 6 42 41 7 36 49 40 39 47 43 }
    { 36 40 7 39 41 15 }
    {  0.14082834  0.09748790  1.73131507  0.87636009
      -1.95059594  0.73438555 -0.03035726  1.46675970
      -0.74621349 -0.72588772  0.63905160  0.61501527
      -0.98983780 -1.00447874 -0.62759469  0.66206163
       1.04312009 -0.10305385  0.75775634  0.32566578 }
    [ fivenum . ] tri@ ;

MAIN: fivenum-demo
