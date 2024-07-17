! Task:
! 
! In a two-dimensional world, we begin with any bar-chart (or row of
! close-packed 'towers', each of unit width), and then it rains,
! completely filling all convex enclosures in the chart with water.
! 
!     9               ██           9               ██    
!     8               ██           8               ██    
!     7     ██        ██           7     ██≈≈≈≈≈≈≈≈██    
!     6     ██  ██    ██           6     ██≈≈██≈≈≈≈██    
!     5 ██  ██  ██  ████           5 ██≈≈██≈≈██≈≈████    
!     4 ██  ██  ████████           4 ██≈≈██≈≈████████    
!     3 ██████  ████████           3 ██████≈≈████████    
!     2 ████████████████  ██       2 ████████████████≈≈██
!     1 ████████████████████       1 ████████████████████
! 
! In the example above, a bar chart representing the values [5, 3, 7, 2,
! 6, 4, 5, 9, 1, 2] has filled, collecting 14 units of water.
! 
! Write a function, in your language, from a given array of heights, to
! the number of water units that can be held in this way, by a
! corresponding bar chart.
! 
! Calculate the number of water units that could be collected by bar
! charts representing each of the following seven series:
! 
!        [[1, 5, 3, 7, 2],
!         [5, 3, 7, 2, 6, 4, 5, 9, 1, 2],
!         [2, 6, 3, 5, 2, 8, 1, 4, 2, 2, 5, 3, 5, 7, 4, 1],
!         [5, 5, 5, 5],
!         [5, 6, 7, 8],
!         [8, 7, 7, 6],
!         [6, 7, 10, 7, 6]]
! 
! See, also:
! 
! -   Four Solutions to a Trivial Problem – a Google Tech Talk by Guy
!     Steele
! -   Water collected between towers on Stack Overflow, from which the
!     example above is taken)
! -   An interesting Haskell solution, using the Tardis monad, by Phil
!     Freeman in a Github gist.

USING: formatting kernel math.statistics math.vectors sequences ;

: area ( seq -- n )
    [ cum-max ] [ <reversed> cum-max reverse vmin ] [ v- sum ] tri ;

{
    { 1 5 3 7 2 }
    { 5 3 7 2 6 4 5 9 1 2 }
    { 2 6 3 5 2 8 1 4 2 2 5 3 5 7 4 1 }
    { 5 5 5 5 }
    { 5 6 7 8 }
    { 8 7 7 6 }
    { 6 7 10 7 6 }
} [ dup area "%[%d, %] -> %d\n" printf ] each
