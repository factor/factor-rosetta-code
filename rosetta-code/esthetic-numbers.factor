! An esthetic number is a positive integer where every adjacent digit
! differs from its neighbour by 1.
! 
! E.G.
! 
! -   -   12 is an esthetic number. One and two differ by 1.
! 
! -   -   5654 is an esthetic number. Each digit is exactly 1 away from
!         its neighbour.
! 
! -   -   890 is not an esthetic number. Nine and zero differ by 9.
! 
! These examples are nominally in base 10 but the concept extends easily
! to numbers in other bases. Traditionally, single digit numbers are
! included in esthetic numbers; zero may or may not be. For our purposes,
! for this task, do not include zero (0) as an esthetic number. Do not
! include numbers with leading zeros.
! 
! Esthetic numbers are also sometimes referred to as stepping numbers.
! 
! Task
! 
! -   -   Write a routine (function, procedure, whatever) to find esthetic
!         numbers in a given base.
! 
! -   -   Use that routine to find esthetic numbers in bases 2 through 16
!         and display, here on this page, the esthectic numbers from index
!         (base × 4) through index (base × 6), inclusive. (E.G. for base
!         2: 8th through 12th, for base 6: 24th through 36th, etc.)
! 
! -   -   Find and display, here on this page, the base 10 esthetic
!         numbers with a magnitude between 1000 and 9999.
! 
! -   -   Stretch: Find and display, here on this page, the base 10
!         esthetic numbers with a magnitude between 1.0e8 and 1.3e8.
! 
! Related task:
! 
! -   numbers with equal rises and falls
! 
! See also:
! 
! :;*OEIS A033075 - Positive numbers n such that all pairs of consecutive
! decimal digits differ by 1
! 
! :;*Numbers Aplenty - Esthetic numbers
! 
! :;*Geeks for Geeks - Stepping numbers

USING: combinators deques dlists formatting grouping io kernel
locals make math math.order math.parser math.ranges
math.text.english prettyprint sequences sorting strings ;

:: bfs ( from to num base -- )
    DL{ } clone :> q
    base 1 - :> ld
    num q push-front
    [ q deque-empty? ]
    [
        q pop-back :> step-num
        step-num from to between? [ step-num , ] when
        step-num zero? step-num to > or
        [
            step-num base mod :> last-digit
            step-num base * last-digit 1 - + :> a
            step-num base * last-digit 1 + + :> b

            last-digit
            {
                { 0 [ b q push-front ] }
                { ld [ a q push-front ] }
                [ drop a q push-front b q push-front ]
            } case

        ] unless

    ] until ;

:: esthetics ( from to base -- seq )
    [ base <iota> [| num | from to num base bfs ] each ]
    { } make natural-sort ;

: .seq ( seq width -- )
    group [ [ dup string? [ write ] [ pprint ] if bl ] each nl ]
    each nl ;

:: show ( base -- )
    base [ 4 * ] [ 6 * ] bi :> ( from to )
    from to [ dup ordinal-suffix ] bi@ base
    "%d%s through %d%s esthetic numbers in base %d\n" printf
    from to 1 + 0 5000   ! enough for base 16
    base esthetics subseq [ base >base ] map 17 .seq ;

2 16 [a,b] [ show ] each

"Base 10 numbers between 1,000 and 9,999:" print
1,000 9,999 10 esthetics 16 .seq

"Base 10 numbers between 100,000,000 and 130,000,000:" print
100,000,000 130,000,000 10 esthetics 9 .seq

"Count of base 10 esthetic numbers between zero and one quadrillion:"
print 0 1e15 10 esthetics length .
