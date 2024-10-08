! Task:
! 
! Given a string containing uppercase characters (A-Z), compress repeated
! 'runs' of the same character by storing the length of that run, and
! provide a function to reverse the compression.
! 
! The output can be anything, as long as you can recreate the input with
! it.
! 
! Example:
!     Input:
!     WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW
!     Output: 12W1B12W3B24W1B14W
! 
! Note: the encoding step in the above example is the same as a step of
! the Look-and-say sequence.
! 
! Category: Encodings

USING: io kernel literals math.parser math.ranges sequences
sequences.extras sequences.repeating splitting.extras
splitting.monotonic strings ;
IN: rosetta-code.run-length-encoding

CONSTANT: alpha $[ CHAR: A CHAR: Z [a,b] >string ]

: encode ( str -- str )
    [ = ] monotonic-split [ [ length number>string ] [ first ]
    bi suffix ] map concat ;
    
: decode ( str -- str )
    alpha split* [ odd-indices ] [ even-indices
    [ string>number ] map ] bi [ repeat ] 2map concat ;
    
"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW"
"12W1B12W3B24W1B14W"
[ encode ] [ decode ] bi* [ print ] bi@
