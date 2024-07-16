! Task:
! 
! Write a player of the Bulls and Cows game, rather than a scorer. The
! player should give intermediate answers that respect the scores to
! previous attempts.
! 
! One method is to generate a list of all possible numbers that could be
! the answer, then to prune the list by keeping only those numbers that
! would give an equivalent score to how your last guess was scored. Your
! next guess can be any number from the pruned list.
! 
! Either you guess correctly or run out of numbers to guess, which
! indicates a problem with the scoring.
! 
! Related tasks:
! 
! -   Bulls and cows
! -   Guess the number
! -   Guess the number/With Feedback (Player)

USING: arrays combinators.short-circuit formatting fry io kernel
math math.combinatorics math.functions math.order math.parser
math.ranges random regexp sequences sets splitting ;

: bulls ( seq1 seq2 -- n ) [ = 1 0 ? ] 2map sum ;
: cows ( seq1 seq2 -- n ) [ intersect length ] [ bulls - ] 2bi ;
: score ( seq1 seq2 -- pair ) [ bulls ] [ cows 2array ] 2bi ;
: possibilities ( -- seq ) 9 [1,b] 4 <k-permutations> ;
: pare ( seq guess score -- new-seq ) '[ _ score _ = ] filter ;
: >number ( seq -- n ) reverse [ 10^ * ] map-index sum ;
: >score ( str -- pair ) "," split [ string>number ] map ;
: ask ( n -- ) "My guess is %d. How many bulls, cows? " printf ;

: valid-input? ( str -- ? )
    { [ R/ \d,\d/ matches? ] [ >score sum 0 4 between? ] } 1&& ;

: get-score ( n -- pair )
    [ ask ] keep flush readln dup valid-input?
    [ nip >score ] [ drop get-score ] if ;

: game ( seq -- )
    dup random [
        dup >number get-score dup first 4 =
        [ 3drop "Success!" print ] [ pare game ] if
    ] [ drop "Scoring inconsistency." print ] if* ;

possibilities game
