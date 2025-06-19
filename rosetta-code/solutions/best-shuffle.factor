! Task:
! 
! Shuffle the characters of a string in such a way that as many of the
! character values are in a different position as possible.
! 
! A shuffle that produces a randomized result among the best choices is to
! be preferred. A deterministic approach that produces the same sequence
! every time is acceptable as an alternative.
! 
! Display the result as follows:
! 
! original string, shuffled string, (score) 
! 
! The score gives the number of positions whose character value did not
! change.
! 
! Example:
! 
! tree, eetr, (0)
! 
! Test cases:
! 
! abracadabra
! seesaw
! elk
! grrrrrr
! up
! a
! 
! Related tasks
! 
! -   Anagrams/Deranged anagrams
! -   Permutations/Derangements


:: best-shuffle ( str -- str' )
    str clone :> new-str
    str length :> n
    n <iota> >array randomize :> range1
    n <iota> >array randomize :> range2

    range1 [| i |
        range2 [| j |
            {
                [ i j = ]
                [ i new-str nth j new-str nth = ]
                [ i str nth j new-str nth = ]
                [ i new-str nth j str nth = ]
            } 0|| [
                 i j new-str exchange
            ] unless
        ] each
    ] each

    new-str ;

: best-shuffle. ( str -- )
    dup best-shuffle 2dup [ = ] 2count "%s, %s, (%d)\n" printf ;

