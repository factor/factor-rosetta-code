! A prime p is in category 1 if the prime factors of p+1 are 2 and or 3. p
! is in category 2 if all the prime factors of p+1 are in category 1. p is
! in category g if all the prime factors of p+1 are in categories 1 to
! g-1.
! 
! The task is first to display the first 200 primes allocated to their
! category, then assign the first million primes to their category,
! displaying the smallest prime, the largest prime, and the count of
! primes allocated to each category.

USING: assocs combinators formatting grouping grouping.extras io
kernel math math.primes math.primes.factors math.statistics
prettyprint sequences sequences.deep ;

PREDICATE: >3 < integer 3 > ;

GENERIC: depth ( seq -- n )

M: sequence depth
    0 swap [ flatten1 [ 1 + ] dip ] to-fixed-point drop ;

M: integer depth drop 1 ;

MEMO: pfactors ( n -- seq ) 1 + factors ;

: category ( m -- n )
    [ dup >3? [ pfactors ] when ] deep-map depth ;

: categories ( n -- assoc ) nprimes [ category ] collect-by ;

: table. ( seq n -- )
    [ "" pad-groups ] keep group simple-table. ;

: categories... ( assoc -- )
    [ [ "Category %d:\n" printf ] dip 15 table. ] assoc-each ;

: row. ( category first last count -- )
    "Category %d: first->%d last->%d count->%d\n" printf ;

: categories. ( assoc -- )
    [ [ minmax ] keep length row. ] assoc-each ;

200 categories categories... nl
1,000,000 categories categories.
