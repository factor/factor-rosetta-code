! The Dutch national flag is composed of three coloured bands in the
! order:
! 
! -   -   red (top)
!     -   then white, and
!     -   lastly blue (at the bottom).
! 
! The problem posed by Edsger Dijkstra is:
! 
!     Given a number of red, blue and white balls in random order, arrange
!     them in the order of the colours in the Dutch national flag.
! 
! When the problem was first posed, Dijkstra then went on to successively
! refine a solution, minimising the number of swaps and the number of
! times the colour of a ball needed to determined and restricting the
! balls to end in an array, ...
! 
! Task
! 
! 1.  Generate a randomized order of balls ensuring that they are not in
!     the order of the Dutch national flag.
! 2.  Sort the balls in a way idiomatic to your language.
! 3.  Check the sorted balls are in the order of the Dutch national flag.
! 
! C.f.:
! 
! -   Dutch national flag problem
! -   [https://www.google.co.uk/search?rlz=1C1DSGK_enGB472GB472&sugexp=chrome,mod=8&sourceid=chrome&ie=UTF-8&q=Dutch+national+flag+problem#hl=en&rlz=1C1DSGK_enGB472GB472&sclient=psy-ab&q=Probabilistic+analysis+of+algorithms+for+the+Dutch+national+flag+problem&oq=Probabilistic+analysis+of+algorithms+for+the+Dutch+national+flag+problem&gs_l=serp.3...60754.61818.1.62736.1.1.0.0.0.0.72.72.1.1.0...0.0.Pw3RGungndU&psj=1&bav=on.2,or.r_gc.r_pw.r_cp.r_qf.,cf.osb&fp=c33d18147f5082cc&biw=1395&bih=951
!     Probabilistic analysis of algorithms for the Dutch national flag
!     problem] by Wei-Mei Chen. (pdf)

USING: combinators grouping kernel math prettyprint random
sequences ;

: sorted? ( seq -- ? ) [ <= ] monotonic? ;

: random-non-sorted-integers ( length n -- seq )
    2dup random-integers
    [ dup sorted? ] [ drop 2dup random-integers ] while 2nip ;

: dnf-sort! ( seq -- seq' )
    [ 0 0 ] dip [ length 1 - ] [ ] bi
    [ 2over <= ] [
        pick over nth {
            { 0 [ reach reach pick exchange [ [ 1 + ] bi@ ] 2dip ] }
            { 1 [ [ 1 + ] 2dip ] }
            [ drop 3dup exchange [ 1 - ] dip ]
        } case
    ] while 3nip ;

10 3 random-non-sorted-integers dup . dnf-sort! .
