! Task:
! 
! Write a program that takes in a user inputted word and prints out
! possible words that are valid in the English dictionary. Please state
! any dictionaries or files/binaries/dependencies used in your program. Do
! show the similarity of the inputted word and outcome as a percentage.
! Any algorithm can be used to accomplish this task.
! 
! Resources:
! 
! Github Repo
! 
! Raw Text, Save as .txt file
! 
! Hamming Distance
! 
! Jaro-Winkler Distance
! 
! SoundEx Algorithm
! 
! SoundEx Algorithm Wiki
! 
! Dice's Coefficient
! 
! Dice Coefficient Wiki
! 
! Possible Output:
! 
!     Input word: 
!     complition
! 
!     compaction : 80.00% similar.
!     completion : 90.00% similar.
!     completions : 81.82% similar.
!     complexion : 80.00% similar.
! 
! Extension
! 
! 1.  How can you make the accuracy of your program higher?

USING: formatting fry http.client io kernel lcs literals math
math.ranges namespaces prettyprint.config sequences splitting ;

CONSTANT: words $[
    "https://www.mit.edu/~ecprice/wordlist.10000" http-get nip
    "\n" split harvest
]
CONSTANT: word "complition"

: lev-dist-of ( str n -- n )
    [ words ] 2dip '[ _ levenshtein _ = ] filter ;

: similarity ( n -- x ) word length / 100 * 100 swap - ;

10000 margin set ! Prevent prettyprinter from wrapping sequences
4 [1,b] [
    dup [ similarity ] [ drop word ] [ word swap lev-dist-of ] tri
    "Words at Levenshtein distance of %d (%.1f%% similarity) from %u:\n%u\n\n" printf
] each
