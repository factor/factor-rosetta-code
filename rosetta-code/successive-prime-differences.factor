! The series of increasing prime numbers begins:
! 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, ...
! 
! The task applies a filter to the series returning groups of successive
! primes, (s'primes), that differ from the next by a given value or
! values.
! 
! Example 1: Specifying that the difference between s'primes be 2 leads to
! the groups:
! 
!     (3, 5), (5, 7), (11, 13), (17, 19), (29, 31), ...
! 
! (Known as Twin primes or Prime pairs)
! 
! Example 2: Specifying more than one difference between s'primes leads to
! groups of size one greater than the number of differences. Differences
! of 2, 4 leads to the groups:
! 
!     (5, 7, 11), (11, 13, 17), (17, 19, 23), (41, 43, 47), ....
! 
! In the first group 7 is two more than 5 and 11 is four more than 7; as
! well as 5, 7, and 11 being successive primes. Differences are checked in
! the order of the values given, (differences of 4, 2 would give different
! groups entirely).
! 
! Task:
! 
! -   In each case use a list of primes less than 1_000_000
! -   For the following Differences show the first and last group, as well
!     as the number of groups found:
! 
! :# Differences of 2.
! 
! :# Differences of 1.
! 
! :# Differences of 2, 2.
! 
! :# Differences of 2, 4.
! 
! :# Differences of 4, 2.
! 
! :# Differences of 6, 4, 2.
! 
! -   Show output here.
! 
! Note: Generation of a list of primes is a secondary aspect of the task.
! Use of a built in function, well known library, or importing/use of
! prime generators from other Rosetta Code tasks is encouraged.
! 
! references
! 
! :#https://pdfs.semanticscholar.org/78a1/7349819304863ae061df88dbcb26b4908f03.pdf
! 
! :#https://www.primepuzzles.net/puzzles/puzz_011.htm
! 
! :#https://matheplanet.de/matheplanet/nuke/html/viewtopic.php?topic=232720&start=0

USING: formatting fry grouping kernel math math.primes
math.statistics sequences ;
IN: rosetta-code.successive-prime-differences

: seq-diff ( seq diffs -- seq' quot )
    dup [ length 1 + <clumps> ] dip '[ differences _ sequence= ]
    ; inline

: show ( seq diffs -- )
    [ "...for differences %u:\n" printf ] keep seq-diff
    [ find nip { } like ]
    [ find-last nip { } like ]
    [ count ] 2tri
    "First group: %u\nLast group: %u\nCount: %d\n\n" printf ;

: successive-prime-differences ( -- )
    "Groups of successive primes up to one million...\n" printf
    1,000,000 primes-upto {
        { 2 }
        { 1 }
        { 2 2 }
        { 2 4 }
        { 4 2 }
        { 6 4 2 }
    } [ show ] with each ;
    
MAIN: successive-prime-differences
