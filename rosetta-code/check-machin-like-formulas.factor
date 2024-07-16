! Machin-like formulas are useful for efficiently computing numerical
! approximations for π
! 
! Task:
! 
! Verify the following Machin-like formulas are correct by calculating the
! value of tan (right hand side) for each equation using exact arithmetic
! and showing they equal 1:
! 
!     ${\pi\over4} = \arctan{1\over2} + \arctan{1\over3}$
!     ${\pi\over4} = 2 \arctan{1\over3} + \arctan{1\over7}$
!     ${\pi\over4} = 4 \arctan{1\over5} - \arctan{1\over239}$
!     ${\pi\over4} = 5 \arctan{1\over7} + 2 \arctan{3\over79}$
!     ${\pi\over4} = 5 \arctan{29\over278} + 7 \arctan{3\over79}$
!     ${\pi\over4} = \arctan{1\over2} + \arctan{1\over5} + \arctan{1\over8}$
!     ${\pi\over4} = 4 \arctan{1\over5} - \arctan{1\over70} + \arctan{1\over99}$
!     ${\pi\over4} = 5 \arctan{1\over7} + 4 \arctan{1\over53} + 2 \arctan{1\over4443}$
!     ${\pi\over4} = 6 \arctan{1\over8} + 2 \arctan{1\over57} + \arctan{1\over239}$
!     ${\pi\over4} = 8 \arctan{1\over10} - \arctan{1\over239} - 4 \arctan{1\over515}$
!     ${\pi\over4} = 12 \arctan{1\over18} + 8 \arctan{1\over57} - 5 \arctan{1\over239}$
!     ${\pi\over4} = 16 \arctan{1\over21} + 3 \arctan{1\over239} + 4 \arctan{3\over1042}$
!     ${\pi\over4} = 22 \arctan{1\over28} + 2 \arctan{1\over443} - 5 \arctan{1\over1393} - 10 \arctan{1\over11018}$
!     ${\pi\over4} = 22 \arctan{1\over38} + 17 \arctan{7\over601} + 10 \arctan{7\over8149}$
!     ${\pi\over4} = 44 \arctan{1\over57} + 7 \arctan{1\over239} - 12 \arctan{1\over682} + 24 \arctan{1\over12943}$
!     ${\pi\over4} = 88 \arctan{1\over172} + 51 \arctan{1\over239} + 32 \arctan{1\over682} + 44 \arctan{1\over5357} + 68 \arctan{1\over12943}$
! 
! and confirm that the following formula is incorrect by showing tan
! (right hand side) is not 1:
! 
!     ${\pi\over4} = 88 \arctan{1\over172} + 51 \arctan{1\over239} + 32 \arctan{1\over682} + 44 \arctan{1\over5357} + 68 \arctan{1\over12944}$
! 
! These identities are useful in calculating the values:
! 
!     $\tan(a + b) = {\tan(a) + \tan(b) \over 1 - \tan(a) \tan(b)}$
! 
!     $\tan\left(\arctan{a \over b}\right) = {a \over b}$
! 
!     tan (−a) = −tan (a)
! 
! You can store the equations in any convenient data structure, but for
! extra credit parse them from human-readable text input.
! 
! Note: to formally prove the formula correct, it would have to be shown
! that ${-3 pi \over 4}$ < right hand side < ${5 pi \over 4}$ due to
! tan () periodicity.

USING: combinators formatting kernel locals math sequences ;
IN: rosetta-code.machin

: tan+ ( x y -- z ) [ + ] [ * 1 swap - / ] 2bi ;

:: tan-eval ( coef frac -- x )
    {
        { [ coef zero? ] [ 0 ] }
        { [ coef neg? ] [ coef neg frac tan-eval neg ] }
        { [ coef odd? ] [ frac coef 1 - frac tan-eval tan+ ] }
        [ coef 2/ frac tan-eval dup tan+ ]
    } cond ;

: tans ( seq -- x ) [ first2 tan-eval ] [ tan+ ] map-reduce ;

: machin ( -- )
    {
        { { 1 1/2 } { 1 1/3 } }
        { { 2 1/3 } { 1 1/7 } }
        { { 4 1/5 } { -1 1/239 } }
        { { 5 1/7 } { 2 3/79 } }
        { { 5 29/278 } { 7 3/79 } }
        { { 1 1/2 } { 1 1/5 } { 1 1/8 } }
        { { 5 1/7 } { 4 1/53 } { 2 1/4443 } }
        { { 6 1/8 } { 2 1/57 } { 1 1/239 } }
        { { 8 1/10 } { -1 1/239 } { -4 1/515 } }
        { { 12 1/18 } { 8 1/57 } { -5 1/239 } }
        { { 16 1/21 } { 3 1/239 } { 4 3/1042 } }
        { { 22 1/28 } { 2 1/443 }
          { -5 1/1393 } { -10 1/11018 } }
        { { 22 1/38 } { 17 7/601 } { 10 7/8149 } }
        { { 44 1/57 } { 7 1/239 } { -12 1/682 } { 24 1/12943 } }
        { { 88 1/172 } { 51 1/239 } { 32 1/682 }
          { 44 1/5357 } { 68 1/12943 } }
        { { 88 1/172 } { 51 1/239 } { 32 1/682 }
          { 44 1/5357 } { 68 1/12944 } }
    } [ dup tans "tan %u = %u\n" printf ] each ;

MAIN: machin
