! Bernoulli's triangle is an arithmetic and geometric figure quite similar
! to the closely related Pascal's triangle.
! 
! Both start with a single value of 1 in the first row, (row 0). Rather
! than every new row getting a 1 added to the left and right ends of the
! row, every new row n gets a 1 added to the left and 2^(n) added to the
! right.
! 
! Its first few rows look like this:
! 
!     1
!    1 2
!   1 3 4
!  1 4 7 8  
! 
! where each element of each row is either 1, 2^(n), or the sum of the two
! elements right above it.
! 
! Bernoulli's triangle may also be generated using binomials. For any
! non-negative integer n and for any integer k included between 0 and n,
! the component in row n and column k is given by:
! 
! $\sum_{p=0}^k {n \choose p}$
! 
! Many different integer sequences appear in Bernoulli's triangle.
! 
! Task
! 
! -   Generate the first 15 rows of Bernoulli's triangle using whatever
!     method is most convenient in your language.
! 
! See also
! 
! -   Wikipedia: Bernoulli's triangle
! -   Related task: Pascal's_triangle

USING: kernel math math.combinatorics namespaces prettyprint
prettyprint.config ranges sequences ;

100 margin set

15 [
    dup [0..b] [ [0..b] [ nCk ] with map-sum ] with map .
] each-integer
