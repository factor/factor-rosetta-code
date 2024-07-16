! Task:
! 
! Produce a zig-zag array.
! 
! A zig-zag array is a square arrangement of the first N² natural numbers,
! where the
! 
! numbers increase sequentially as you zig-zag along the array's
! anti-diagonals.
! 
! For a graphical representation, see JPG zigzag (JPG uses such arrays to
! encode images).
! 
! For example, given 5, produce this array:
! 
!      0  1  5  6 14
!      2  4  7 13 15
!      3  8 12 16 21
!      9 11 17 20 22
!     10 18 19 23 24
! 
! Related tasks:
! 
! -   Spiral matrix
! -   Identity matrix
! -   Ulam spiral (for primes)
! 
! See also:
! 
! -   Wiktionary entry: anti-diagonals

USING: assocs assocs.extras grouping io kernel math
math.combinatorics math.matrices prettyprint sequences ;

: <zig-zag-matrix> ( n -- matrix )
    [
        dup [ + ] <matrix-by-indices> concat zip-index
        expand-keys-push-at values [ even? [ reverse ] when ]
        map-index concat inverse-permutation
    ] [ group ] bi ;

5 <zig-zag-matrix> simple-table.
