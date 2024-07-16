! Catalan numbers are a sequence of numbers which can be defined directly:
! 
! $$C_n = \frac{1}{n+1}{2n\choose n} = \frac{(2n)!}{(n+1)!\,n!} \qquad\mbox{ for }n\ge 0.$$
! Or recursively:
! 
! $$C_0 = 1 \quad \mbox{and} \quad C_{n+1}=\sum_{i=0}^{n}C_i\,C_{n-i}\quad\text{for }n\ge 0;$$
! Or alternatively (also recursive):
! 
! $$C_0 = 1 \quad \mbox{and} \quad C_n=\frac{2(2n-1)}{n+1}C_{n-1},$$
! 
! Task:
! 
! Implement at least one of these algorithms and print out the first 15
! Catalan numbers with each.
! 
! Memoization is not required, but may be worth the effort when using the
! second method above.
! 
! Related tasks:
! 
! -   Catalan numbers/Pascal's triangle
! -   Evaluate binomial coefficients

USING: kernel math prettyprint sequences ;

: next ( seq -- newseq )
  [ ] [ last ] [ length ] tri
  [ 2 * 1 - 2 * ] [ 1 + ] bi /
  * suffix ;

: Catalan ( n -- seq )  V{ 1 } swap 1 - [ next ] times ;

15 Catalan .
