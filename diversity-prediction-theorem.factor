! The wisdom of the crowd is the collective opinion of a group of
! individuals rather than that of a single expert.
! 
! Wisdom-of-the-crowds research routinely attributes the superiority of
! crowd averages over individual judgments to the elimination of
! individual noise, an explanation that assumes independence of the
! individual judgments from each other.
! 
! Thus the crowd tends to make its best decisions if it is made up of
! diverse opinions and ideologies.
! 
! Scott E. Page introduced the diversity prediction theorem:
! 
!     The squared error of the collective prediction equals the average
!     squared error minus the predictive diversity.
! 
! Therefore, when the diversity in a group is large, the error of the
! crowd is small.
! 
! Definitions:
! 
! -   -   Average Individual Error: Average of the individual squared
!         errors
!     -   Collective Error: Squared error of the collective prediction
!     -   Prediction Diversity: Average squared distance from the
!         individual predictions to the collective prediction
!     -   Diversity Prediction Theorem: Given a crowd of predictive
!         models, then
! 
!         Collective Error = Average Individual Error ─ Prediction
!         Diversity
! 
! Task:
! 
! For a given true value and a number of number of estimates (from a
! crowd), show (here on this page):
! 
! -   -   the true value and the crowd estimates
!     -   the average error
!     -   the crowd error
!     -   the prediction diversity
! 
! Use (at least) these two examples:
! 
! -   -   a true value of 49 with crowd estimates of: 48 47 51
!     -   a true value of 49 with crowd estimates of: 48 47 51 42
! 
! Also see:
! 
! -   -   Wikipedia entry: Wisdom of the crowd
!     -   University of Michigan: PDF paper (exists on a web archive, the
!         Wayback Machine).

USING: kernel math math.statistics math.vectors prettyprint ;

TUPLE: div avg-err crowd-err diversity ;

: diversity ( x seq -- obj )
    [ n-v dup v* mean ] [ mean swap - sq ]
    [ nip dup mean v-n dup v* mean ] 2tri div boa ;

49 { 48 47 51 } diversity .
49 { 48 47 51 42 } diversity .
