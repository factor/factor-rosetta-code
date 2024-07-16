! Statistics is all about large groups of numbers. When talking about a
! set of sampled data, most frequently used is their mean value and
! standard deviation (stddev). If you have set of data x_(i) where
! i = 1, 2, …, n  , the mean is $\bar{x}\equiv {1\over n}\sum_i x_i$,
! while the stddev is
! $\sigma\equiv\sqrt{{1\over n}\sum_i \left(x_i - \bar x \right)^2}$.
! 
! When examining a large quantity of data, one often uses a histogram,
! which shows the counts of data samples falling into a prechosen set of
! intervals (or bins). When plotted, often as bar graphs, it visually
! indicates how often each data value occurs.
! 
! Task Using your language's random number routine, generate real numbers
! in the range of [0, 1]. It doesn't matter if you chose to use open or
! closed range. Create 100 of such numbers (i.e. sample size 100) and
! calculate their mean and stddev. Do so for sample size of 1,000 and
! 10,000, maybe even higher if you feel like. Show a histogram of any of
! these sets. Do you notice some patterns about the standard deviation?
! 
! Extra Sometimes so much data need to be processed that it's impossible
! to keep all of them at once. Can you calculate the mean, stddev and
! histogram of a trillion numbers? (You don't really need to do a trillion
! numbers, just show how it can be done.)
! 
! Hint:
! 
! For a finite population with equal probabilities at all points, one can
! derive:
! 
! $$\overline{(x - \overline{x})^2} = \overline{x^2} - \overline{x}^2$$
! 
! Or, more verbosely:
! 
! $$\frac{1}{N}\sum_{i=1}^N(x_i-\overline{x})^2 = \frac{1}{N} \left(\sum_{i=1}^N x_i^2\right) - \overline{x}^2.$$
! 
! -   Statistics/Normal distribution

USING: assocs formatting grouping io kernel literals math
math.functions math.order math.statistics prettyprint random
sequences sequences.deep sequences.repeating ;
IN: rosetta-code.statistics-basic

CONSTANT: granularity
    $[ 11 iota [ 10 /f ] map 2 clump ]

: mean/std ( seq -- a b )
    [ mean ] [ population-std ] bi ;

: .mean/std ( seq -- )
    mean/std [ "Mean: " write . ] [ "STD:  " write . ] bi* ;
    
: count-between ( seq a b -- n )
    [ between? ] 2curry count ;
    
: histo ( seq -- seq )
    granularity [ first2 count-between ] with map ;
    
: bar ( n -- str )
    [ dup 50 < ] [ 10 / ] until 2 * >integer "*" swap repeat ;
    
: (.histo) ( seq -- seq' )
    [ bar ] map granularity swap zip flatten 3 group ;
    
: .histo ( seq -- )
    (.histo) [ "%.1f - %.1f %s\n" vprintf ] each ;
    
: stats ( n -- )
    dup "Statistics %d:\n" printf
    random-units [ histo .histo ] [ .mean/std nl ] bi ;
    
: main ( -- )
    { 100 1,000 10,000 } [ stats ] each ;
    
MAIN: main
