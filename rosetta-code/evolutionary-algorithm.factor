! Starting with:
! 
! -   The target string: "METHINKS IT IS LIKE A WEASEL".
! -   An array of random characters chosen from the set of upper-case
!     letters together with the space, and of the same length as the
!     target string. (Call it the parent).
! -   A fitness function that computes the ‘closeness’ of its argument to
!     the target string.
! -   A mutate function that given a string and a mutation rate returns a
!     copy of the string, with some characters probably mutated.
! -   While the parent is not yet the target:
!     -   copy the parent C times, each time allowing some random
!         probability that another character might be substituted using
!         mutate.
!     -   Assess the fitness of the parent and all the copies to the
!         target and make the most fit string the new parent, discarding
!         the others.
!     -   repeat until the parent converges, (hopefully), to the target.
! 
! See also:
! 
! -   Wikipedia entry: Weasel algorithm.
! -   Wikipedia entry: Evolutionary algorithm.
! 
! Note: to aid comparison, try and ensure the variables and functions
! mentioned in the task description appear in solutions
! 
! A cursory examination of a few of the solutions reveals that the
! instructions have not been followed rigorously in some solutions.
! Specifically,
! 
! -   While the parent is not yet the target:
!     -   copy the parent C times, each time allowing some random
!         probability that another character might be substituted using
!         mutate.
! 
! Note that some of the the solutions given retain characters in the
! mutated string that are correct in the target string. However, the
! instruction above does not state to retain any of the characters while
! performing the mutation. Although some may believe to do so is implied
! from the use of "converges"
! 
! (:* repeat until the parent converges, (hopefully), to the target.
! 
! Strictly speaking, the new parent should be selected from the new pool
! of mutations, and then the new parent used to generate the next set of
! mutations with parent characters getting retained only by not being
! mutated. It then becomes possible that the new set of mutations has no
! member that is fitter than the parent!
! 
! As illustration of this error, the code for 8th has the following
! remark.
! 
! Create a new string based on the TOS, '''changing randomly any characters which
! don't already match the target''':
! 
! NOTE: this has been changed, the 8th version is completely random now
! 
! Clearly, this algo will be applying the mutation function only to the
! parent characters that don't match to the target characters!
! 
! To ensure that the new parent is never less fit than the prior parent,
! both the parent and all of the latest mutations are subjected to the
! fitness test to select the next parent.

USING: arrays formatting io kernel literals math prettyprint
random sequences strings ;
FROM: math.extras => ... ;
IN: rosetta-code.evolutionary-algorithm

CONSTANT: target "METHINKS IT IS LIKE A WEASEL"
CONSTANT: mutation-rate 0.1
CONSTANT: num-children 25
CONSTANT: valid-chars
    $[ CHAR: A ... CHAR: Z >array { 32 } append ]
    
: rand-char ( -- n )
    valid-chars random ;

: new-parent ( -- str )
    target length [ rand-char ] replicate >string ;
    
: fitness ( str -- n )
    target [ = ] { } 2map-as sift length ;
    
: mutate ( str rate -- str/str' )
    [ random-unit > [ drop rand-char ] when ] curry map ;
    
: next-parent ( str -- str/str' )
    dup [ mutation-rate mutate ] curry num-children 1 - swap
    replicate [ 1array ] dip append [ fitness ] supremum-by ;
    
: print-parent ( str -- )
    [ fitness pprint bl ] [ print ] bi ;
    
: main ( -- )
    0 new-parent
    [ dup target = ]
    [ next-parent dup print-parent [ 1 + ] dip ] until drop
    "Finished in %d generations." printf ;
    
MAIN: main
