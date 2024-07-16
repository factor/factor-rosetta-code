! Two players have a set of dice each. The first player has nine dice with
! four faces each, with numbers one to four. The second player has six
! normal dice with six faces each, each face has the usual numbers from
! one to six.
! 
! They roll their dice and sum the totals of the faces. The player with
! the highest total wins (it's a draw if the totals are the same). What's
! the probability of the first player beating the second player?
! 
! Later the two players use a different set of dice each. Now the first
! player has five dice with ten faces each, and the second player has six
! dice with seven faces each. Now what's the probability of the first
! player beating the second player?
! 
! This task was adapted from the Project Euler Problem n.205:
! https://projecteuler.net/problem=205

USING: dice generalizations kernel math prettyprint sequences ;
IN: rosetta-code.dice-probabilities

: winning-prob ( a b c d -- p )
    [ [ random-roll ] 2bi@ > ] 4 ncurry [ 100000 ] dip replicate
    [ [ t = ] count ] [ length ] bi /f ;

9 4 6 6 winning-prob
5 10 6 7 winning-prob [ . ] bi@
