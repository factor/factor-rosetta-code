! Let our dice select numbers on their faces with equal probability, i.e.
! fair dice. Dice may have more or less than six faces. (The possibility
! of there being a 3D physical shape that has that many "faces" that allow
! them to be fair dice, is ignored for this task - a die with 3 or 33
! defined sides is defined by the number of faces and the numbers on each
! face).
! 
! Throwing dice will randomly select a face on each die with equal
! probability. To show which die of dice thrown multiple times is more
! likely to win over the others:
! 
! 1.  calculate all possible combinations of different faces from each die
! 2.  Count how many times each die wins a combination
! 3.  Each combination is equally likely so the die with more winning face
!     combinations is statistically more likely to win against the other
!     dice.
! 
! If two dice X and Y are thrown against each other then X likely to: win,
! lose, or break-even against Y can be shown as: X > Y, X < Y, or X = Y
! respectively.
! 
! Example 1:
! 
! If X is the three sided die with 1, 3, 6 on its faces and Y has 2, 3, 4
! on its faces then the equal possibility outcomes from throwing both, and
! the winners is:
! 
!    X   Y   Winner
!    =   =   ======
!    1   2   Y
!    1   3   Y
!    1   4   Y
!    3   2   X
!    3   3   -
!    3   4   Y
!    6   2   X
!    6   3   X
!    6   4   X
! 
!    TOTAL WINS: X=4, Y=4
! 
! Both die will have the same statistical probability of winning,
! i.e.their comparison can be written as X = Y
! 
! Transitivity:
! 
! In mathematics transitivity are rules like:
! 
!    if a op b and b op c then a op c
! 
! If, for example, the op, (for operator), is the familiar less than, <,
! and it's applied to integers we get the familiar
! if a < b and b < c then a < c
! 
! Non-transitive dice
! 
! These are an ordered list of dice where the '>' operation between
! successive dice pairs applies but a comparison between the first and
! last of the list yields the opposite result, '<'.
! 
! (Similarly '<' successive list comparisons with a final '>' between
! first and last is also non-transitive).
! 
! Three dice S, T, U with appropriate face values could satisfy
! 
!    S < T, T < U and yet S > U
! 
! To be non-transitive.
! 
! Notes:
! 
! -   The order of numbers on the faces of a die is not relevant. For
!     example, three faced die described with face numbers of 1, 2, 3 or
!     2, 1, 3 or any other permutation are equivalent. For the purposes of
!     the task show only the permutation in lowest-first sorted order i.e.
!     1, 2, 3 (and remove any of its perms).
! -   A die can have more than one instance of the same number on its
!     faces, e.g. 2, 3, 3, 4
! -   Rotations: Any rotation of non-transitive dice from an answer is
!     also an answer. You may optionally compute and show only one of each
!     such rotation sets, ideally the first when sorted in a natural way.
!     If this option is used then prominently state in the output that
!     rotations of results are also solutions.
! 
! Task:
! ====
! 
! Find all the ordered lists of three non-transitive dice S, T, U of the
! form S < T, T < U and yet S > U; where the dice are selected from all
! four-faced die , (unique w.r.t the notes), possible by having selections
! from the integers one to four on any dies face.
! 
! Solution can be found by generating all possble individual die then
! testing all possible permutations, (permutations are ordered), of three
! dice for non-transitivity.
! 
! Optional stretch goal:
! 
! Find lists of four non-transitive dice selected from the same possible
! dice from the non-stretch goal.
! 
! Show the results here, on this page.
! 
! References:
! 
! -   The Most Powerful Dice - Numberphile Video.
! -   Nontransitive dice - Wikipedia.

USING: grouping io kernel math math.combinatorics math.ranges
prettyprint sequences ;

: possible-dice ( n -- seq )
    [ [1,b] ] [ selections ] bi [ [ <= ] monotonic? ] filter ;

: cmp ( seq seq -- n ) [ - sgn ] cartesian-map concat sum ;

: non-transitive? ( seq -- ? )
   [ 2 clump [ first2 cmp neg? ] all? ]
   [ [ last ] [ first ] bi cmp neg? and ] bi ;

: find-non-transitive ( #sides #dice -- seq )
    [ possible-dice ] [ <k-permutations> ] bi*
    [ non-transitive? ] filter ;

! Task
"Number of eligible 4-sided dice: " write
4 possible-dice length . nl

"All ordered lists of 3 non-transitive dice with 4 sides:" print
4 3 find-non-transitive . nl

"All ordered lists of 4 non-transitive dice with 4 sides:" print
4 4 find-non-transitive .
