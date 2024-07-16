! Some definitions to help in the explanation:
! 
!     Floor operation
! 
!         https://en.wikipedia.org/wiki/Floor_and_ceiling_functions
! 
!         Greatest integer less than or equal to a real number.
! 
!     Bitwise Logical shift operators (c-inspired)
! 
!         https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts
! 
!         Binary bits of value shifted left or right, with zero bits
!         shifted in where appropriate.
!         Examples are shown for 8 bit binary numbers; most significant
!         bit to the left.
! 
!         << Logical shift left by given number of bits.
! 
!             E.g Binary 00110101 << 2 == Binary 11010100
! 
!         >> Logical shift right by given number of bits.
! 
!             E.g Binary 00110101 >> 2 == Binary 00001101
! 
!     ^ Bitwise exclusive-or operator
! 
!         https://en.wikipedia.org/wiki/Exclusive_or
!         Bitwise comparison for if bits differ
! 
!             E.g Binary 00110101 ^ Binary 00110011 == Binary 00000110
! 
!     | Bitwise or operator
! 
!         https://en.wikipedia.org/wiki/Bitwise_operation#OR
!         Bitwise comparison gives 1 if any of corresponding bits are 1
! 
!             E.g Binary 00110101 | Binary 00110011 == Binary 00110111
! 
! [https://www.pcg-random.org/download.html#minimal-c-implementation| PCG32] Generator (pseudo-code):
! 
! PCG32 has two unsigned 64-bit integers of internal state:
! 
! 1.  state: All 2**64 values may be attained.
! 2.  sequence: Determines which of 2**63 sequences that state iterates
!     through. (Once set together with state at time of seeding will stay
!     constant for this generators lifetime).
! 
! Values of sequence allow 2**63 different sequences of random numbers
! from the same state.
! 
! The algorithm is given 2 U64 inputs called seed_state, and
! seed_sequence. The algorithm proceeds in accordance with the following
! pseudocode:-
! 
!     const N<-U64 6364136223846793005
!     const inc<-U64 (seed_sequence << 1) | 1
!     state<-U64 ((inc+seed_state)*N+inc
!     do forever
!       xs<-U32 (((state>>18)^state)>>27)
!       rot<-INT (state>>59)
!       OUTPUT U32 (xs>>rot)|(xs<<((-rot)&31))
!       state<-state*N+inc
!     end do
! 
! Note that this an anamorphism – dual to catamorphism, and encoded in
! some languages as a general higher-order `unfold` function, dual to
! `fold` or `reduce`.
! 
! Task:
! 
! -   Generate a class/set of functions that generates pseudo-random
! 
! numbers using the above.
! 
! -   Show that the first five integers generated with the seed 42, 54
! 
! are: 2707161783 2068313097 3122475824 2211639955 3215226955
! 
! -   Show that for an initial seed of 987654321, 1 the counts of 100_000
!     repetitions of
! 
!    floor(random_gen.next_float() * 5)
! 
!     Is as follows:
! 
!    0: 20049, 1: 20022, 2: 20115, 3: 19809, 4: 20005
! 
! -   Show your output here, on this page.

USING: accessors kernel locals math math.bitwise math.statistics
prettyprint sequences ;

CONSTANT: const 6364136223846793005

TUPLE: pcg32 state inc ;

: <pcg32> ( -- pcg32 )
    0x853c49e6748fea9b 0xda3e39cb94b95bdb pcg32 boa ;

:: next-int ( pcg -- n )
    pcg state>> :> old
    old const * pcg inc>> + 64 bits pcg state<<
    old -18 shift old bitxor -27 shift 32 bits :> shifted
    old -59 shift 32 bits :> r
    shifted r neg shift
    shifted r neg 31 bitand shift bitor 32 bits ;

: next-float ( pcg -- x ) next-int 1 32 shift /f ;

:: seed ( pcg st seq -- )
    0x0 pcg state<<
    seq 0x1 shift 1 bitor 64 bits pcg inc<<
    pcg next-int drop
    pcg state>> st + pcg state<<
    pcg next-int drop ;

! Task
<pcg32> 42 54 [ seed ] keepdd 5 [ dup next-int . ] times
 
987654321 1 [ seed ] keepdd
100,000 [ dup next-float 5 * >integer ] replicate nip
histogram .
