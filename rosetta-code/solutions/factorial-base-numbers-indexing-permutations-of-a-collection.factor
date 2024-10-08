! You need a random arrangement of a deck of cards, you are sick of lame
! ways of doing this. This task is a super-cool way of doing this using
! factorial base numbers. The first 25 factorial base numbers in
! increasing order are: 0.0.0, 0.0.1, 0.1.0, 0.1.1, 0.2.0, 0.2.1, 1.0.0,
! 1.0.1, 1.1.0, 1.1.1,1.2.0, 1.2.1, 2.0.0, 2.0.1, 2.1.0, 2.1.1, 2.2.0,
! 2.2.1, 3.0.0, 3.0.1, 3.1.0, 3.1.1, 3.2.0, 3.2.1, 1.0.0.0 Observe that
! the least significant digit is base 2 the next base 3, in general an
! n-digit factorial base number has digits n..1 in base n+1..2.
! 
! I want to produce a 1 to 1 mapping between these numbers and
! permutations:-
! 
!        0.0.0 -> 0123
!        0.0.1 -> 0132
!        0.1.0 -> 0213
!        0.1.1 -> 0231
!        0.2.0 -> 0312
!        0.2.1 -> 0321
!        1.0.0 -> 1023
!        1.0.1 -> 1032
!        1.1.0 -> 1203
!        1.1.1 -> 1230
!        1.2.0 -> 1302
!        1.2.1 -> 1320
!        2.0.0 -> 2013
!        2.0.1 -> 2031
!        2.1.0 -> 2103
!        2.1.1 -> 2130
!        2.2.0 -> 2301
!        2.2.1 -> 2310
!        3.0.0 -> 3012
!        3.0.1 -> 3021
!        3.1.0 -> 3102
!        3.1.1 -> 3120
!        3.2.0 -> 3201
!        3.2.1 -> 3210
! 
! The following psudo-code will do this: Starting with m=0 and Ω, an array
! of elements to be permutated, for each digit g starting with the most
! significant digit in the factorial base number.
! 
! If g is greater than zero, rotate the elements from m to m+g in Ω (see
! example) Increment m and repeat the first step using the next most
! significant digit until the factorial base number is exhausted. For
! example: using the factorial base number 2.0.1 and Ω = 0 1 2 3 where
! place 0 in both is the most significant (left-most) digit/element.
! 
! Step 1: m=0 g=2; Rotate places 0 through 2. 0 1 2 3 becomes 2 0 1 3 Step
! 2: m=1 g=0; No action. Step 3: m=2 g=1; Rotate places 2 through 3. 2 0 1
! 3 becomes 2 0 3 1
! 
! Let me work 2.0.1 and 0123
! 
!     step 1 n=0 g=2 Ω=2013
!     step 2 n=1 g=0 so no action
!     step 3 n=2 g=1 Ω=2031
! 
! The task:
! 
!  First use your function to recreate the above table.
!  Secondly use your function to generate all permutaions of 11 digits, perhaps count them don't display them, compare this method with
!     methods in rc's permutations task.
!  Thirdly here following are two ramdom 51 digit factorial base numbers I prepared earlier:
!    39.49.7.47.29.30.2.12.10.3.29.37.33.17.12.31.29.34.17.25.2.4.25.4.1.14.20.6.21.18.1.1.1.4.0.5.15.12.4.3.10.10.9.1.6.5.5.3.0.0.0
!    51.48.16.22.3.0.19.34.29.1.36.30.12.32.12.29.30.26.14.21.8.12.1.3.10.4.7.17.6.21.8.12.15.15.13.15.7.3.12.11.9.5.5.6.6.3.4.0.3.2.1
!    use your function to crate the corresponding permutation of the following shoe of cards:
!       A♠K♠Q♠J♠10♠9♠8♠7♠6♠5♠4♠3♠2♠A♥K♥Q♥J♥10♥9♥8♥7♥6♥5♥4♥3♥2♥A♦K♦Q♦J♦10♦9♦8♦7♦6♦5♦4♦3♦2♦A♣K♣Q♣J♣10♣9♣8♣7♣6♣5♣4♣3♣2♣
!  Finally create your own 51 digit factorial base number and produce the corresponding permutation of the above shoe

USING: assocs io kernel literals math math.factorials
math.parser math.ranges prettyprint qw random sequences
splitting ;
RENAME: factoradic math.combinatorics.private => _factoradic
RENAME: rotate sequences.extras => _rotate
IN: rosetta-code.factorial-permutations

CONSTANT: shoe $[
    qw{ A K Q J 10 9 8 7 6 5 4 3 2 } qw{ ♠ ♥ ♦ ♣ }
    [ append ] cartesian-map flip concat
]

! Factor can already make factoradic numbers, but they always
! have a least-significant digit of 0 to remove.
: factoradic ( n -- seq )
    _factoradic dup [ drop but-last ] unless-empty ;

! Convert "3.1.2.0" to { 3 1 2 0 }, for example.
: string>factoradic ( str -- seq )
    "." split [ string>number ] map ;

! Rotate a subsequence.
! E.g. 0 2 { 3 1 2 0 } (rotate) -> { 2 3 1 0 }.
: (rotate) ( from to seq -- newseq )
    [ 1 + ] dip [ snip ] [ subseq ] 3bi -1 _rotate glue ;

! Only rotate a subsequence if from does not equal to.
: rotate ( from to seq -- newseq )
    2over = [ 2nip ] [ (rotate) ] if ;

! The pseudocode from the task description
: fpermute ( factoradic -- permutation )
    dup length 1 + <iota> swap <enumerated>
    [ over + rot rotate ] assoc-each ;

! Use a factoradic number to index permutations of a collection.
: findex ( factoradic seq -- permutation )
    [ fpermute ] [ nths concat ] bi* ;

: .f ( seq -- ) [ "." write ] [ pprint ] interleave ;   ! Print a factoradic number
: .p ( seq -- ) [ pprint ] each nl ;                    ! Print a permutation

: show-table ( -- )
    "Generate table" print 24
    [ factoradic 3 0 pad-head dup .f fpermute " -> " write .p ]
    each-integer nl ;

: show-shuffles ( -- )
    "Generate given task shuffles" print
    "Original deck:" print shoe concat print nl
    "39.49.7.47.29.30.2.12.10.3.29.37.33.17.12.31.29.34.17.25.2.4.25.4.1.14.20.6.21.18.1.1.1.4.0.5.15.12.4.3.10.10.9.1.6.5.5.3.0.0.0"
    "51.48.16.22.3.0.19.34.29.1.36.30.12.32.12.29.30.26.14.21.8.12.1.3.10.4.7.17.6.21.8.12.15.15.13.15.7.3.12.11.9.5.5.6.6.3.4.0.3.2.1"
    [ [ print ] [ string>factoradic shoe findex print nl ] bi ] bi@ ;

: show-random-shuffle ( -- )
    "Random shuffle:" print
    51 52 [ n! ] bi@ [a,b] random factoradic shoe findex print ;

: main ( -- ) show-table show-shuffles show-random-shuffle ;

MAIN: main
