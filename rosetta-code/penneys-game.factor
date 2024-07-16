! Penney's game is a game where two players bet on being the first to see
! a particular sequence of heads or tails in consecutive tosses of a fair
! coin.
! 
! It is common to agree on a sequence length of three then one player will
! openly choose a sequence, for example:
! 
!  Heads,  Tails,  Heads, or HTH for short.
! 
! The other player on seeing the first players choice will choose his
! sequence. The coin is tossed and the first player to see his sequence in
! the sequence of coin tosses wins.
! 
! Example:
! 
! One player might choose the sequence HHT and the other THT.
! 
! Successive coin tosses of HTTHT gives the win to the second player as
! the last three coin tosses are his sequence.
! 
! Task
! 
! Create a program that tosses the coin, keeps score and plays Penney's
! game against a human opponent.
! 
! -   Who chooses and shows their sequence of three should be chosen
!     randomly.
! -   If going first, the computer should randomly choose its sequence of
!     three.
! -   If going second, the computer should automatically play the optimum
!     sequence.
! -   Successive coin tosses should be shown.
! 
! Show output of a game where the computer chooses first and a game where
! the user goes first here on this page.
! 
! See also
! 
! -   The Penney Ante Part 1 (Video).
! -   The Penney Ante Part 2 (Video).

USING: arrays ascii io kernel math prettyprint random sequences
strings ;
IN: rosetta-code.penneys-game

! Generate a random boolean.
: t|f ( -- t/f )
    1 random-bits 0 = ;

! Checks whether the sequence chosen by the human is valid.
: valid-input? ( seq -- ? )
    [ [ CHAR: H = ] [ CHAR: T = ] bi or ] filter length 3 = ;

! Prompt the human player for a sequence.
: input-seq ( -- seq )
    "Please input a 3-long sequence of H or T (heads or tails)."
    print "Example: HTH" print "> " write readln >upper >array ;

! Get the human player's input sequence with error checking.    
: get-input ( -- seq )
    t [ drop input-seq dup valid-input? not ] loop ;
    
! Add a random coin flip to a vector.
: flip-coin ( vector -- vector' )
    t|f CHAR: H CHAR: T ? over push ;

! Generate a random 3-long sequence of coin flips.
: rand-seq ( -- seq )
    V{ } clone 3 [ flip-coin ] times ;
    
! Generate the optimal sequence response to a given sequence.
: optimal ( seq1 -- seq2 )
    [ second dup CHAR: H = [ CHAR: T ] [ CHAR: H ] if ]
    [ first ] [ second ] tri 3array nip dup
    "The computer chose " write >string write "." print ;

! Choose a random sequence for the computer and report what
! was chosen.
: computer-first ( -- seq )
    "The computer picks a sequence first and chooses " write
    rand-seq dup >string write "." print >array ;

! The human is prompted to choose any sequence with no
! restrictions.
: human-first ( -- seq )
    "You get to go first." print get-input ;

! Forbid the player from choosing the same sequence as the
! computer.
: human-second ( cseq -- cseq hseq )
    get-input [ 2dup = not ]
    [ drop
        "You may not choose the same sequence as the computer."
        print get-input
    ] until ;

! Display a message introducing the game.
: welcome ( -- )
    "Welcome to Penney's Game. The computer or the player" print
    "will be randomly selected to choose a sequence of"    print
    "three coin tosses. The sequence will be shown to the" print
    "opponent, and then he will choose a sequence."   print nl
    "Then, a coin will be flipped until the sequence" print
    "matches the last three coin flips, and a winner" print
    "announced." print nl ;

! Check for human victory.
: human-won? ( cseq hseq coin-flips -- ? )
    3 tail* >array = nip ;
    
! Check for computer victory.
: computer-won? ( cseq hseq coin-flips -- ? )
    3 tail* >array pick = 2nip ;

! Flip a coin until a victory is detected. Then, inform the
! player who won.
: flip-coins ( cseq hseq -- )
    "Flipping coins..." print
    rand-seq [ 3dup [ human-won? ] [ computer-won? ] 3bi or ]
    [ flip-coin ] until dup >string print human-won?
    [ "You won!" print ] [ "The computer won." print ] if ;

! Randomly choose a player to choose their sequence first.
! Then play a full round of Penney's Game.
: start-game ( -- )
    welcome t|f [ human-first dup optimal swap ]
    [ computer-first human-second ] if flip-coins ;
    
start-game
