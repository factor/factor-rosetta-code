! This task is about coding a Text Generator using Markov Chain algorithm.
! 
! A Markov chain algorithm basically determines the next most probable
! suffix word for a given prefix.
! 
! To do this, a Markov chain program typically breaks an input text
! (training text) into a series of words, then by sliding along them in
! some fixed sized window, storing the first N words as a prefix and then
! the N + 1 word as a member of a set to choose from randomly for the
! suffix.
! 
! As an example, take this text with N = 2:
! 
! now he is gone she said he is gone for good
! 
! this would build the following table:
! 
!     PREFIX               SUFFIX
!     now he               is
!     he is                gone, gone
!     is gone              she, for
!     gone she             said
!     she said             he
!     said he              is
!     gone for             good
!     for good             (empty) if we get at this point, the program stops generating text
! 
! To generate the final text choose a random PREFIX, if it has more than
! one SUFFIX, get one at random, create the new PREFIX and repeat until
! you have completed the text.
! 
! Following our simple example, N = 2, 8 words:
! 
!     random prefix: gone she
!     suffix: said
!     new prefix: she + said
!     new suffix: he
!     new prefix: said + he
!     new suffix: is
!     ... and so on
! 
!     gone she said he is gone she said
! 
! The bigger the training text, the better the results. You can try this
! text here: alice_oz.txt
! 
! Create a program that is able to handle keys of any size (I guess keys
! smaller than 2 words would be pretty random text but...) and create
! output text also in any length. Probably you want to call your program
! passing those numbers as parameters. Something like: markov( "text.txt",
! 3, 300 )

USING: assocs fry grouping io io.encodings.ascii io.files kernel
make math random sequences splitting ;

: build-markov-assoc ( path n -- assoc )
    [ ascii file-contents " " split harvest ] dip 1 + clump
    H{ } clone tuck [ [ unclip-last swap ] dip push-at ] curry
    each ;

: first-word ( assoc -- next-key ) random concat unclip , ;

: next-word ( assoc key -- next-key )
    [ of random ] keep unclip , swap suffix ;

: markov ( path n #words -- )
    [ build-markov-assoc ] dip '[
        dup first-word _ [ dupd next-word ] times
    ] { } make 2nip " " join print ;

"alice_oz.txt" 3 200 markov
