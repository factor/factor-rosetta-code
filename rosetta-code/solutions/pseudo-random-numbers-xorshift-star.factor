! Some definitions to help in the explanation:
! 
!     Floor operation
! 
!     
! 
!         https://en.wikipedia.org/wiki/Floor_and_ceiling_functions
! 
!     
! 
!         Greatest integer less than or equal to a real number.
! 
!     Bitwise Logical shift operators (c-inspired)
! 
!     
! 
!         https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts
! 
!     
! 
!         Binary bits of value shifted left or right, with zero bits
!         shifted in where appropriate.
!         Examples are shown for 8 bit binary numbers; most significant
!         bit to the left.
! 
!     
! 
!         << Logical shift left by given number of bits.
! 
!             E.g Binary 00110101 << 2 == Binary 11010100
! 
!     
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
! [https://en.wikipedia.org/wiki/Xorshift#xorshift*| Xorshift_star] Generator (pseudo-code):
! 
!    /* Let u64 denote an unsigned 64 bit integer type. */
!    /* Let u32 denote an unsigned 32 bit integer type. */
! 
!    class Xorshift_star
!        u64 state       /* Must be seeded to non-zero initial value */
!        u64 const = HEX '2545F4914F6CDD1D'
! 
!        method seed(u64 num):
!            state =  num
!        end method
! 
!        method next_int():
!            u64 x = state
!            x = x ^ (x >> 12)
!            x = x ^ (x << 25)
!            x = x ^ (x >> 27)
!            state = x
!            u32 answer = ((x * const) >> 32)
! 
!            return answer
!        end method
! 
!        method next_float():
!            return float next_int() / (1 << 32)
!        end method
! 
!    end class
! 
! :;Xorshift use:
! 
!    random_gen = instance Xorshift_star
!    random_gen.seed(1234567)
!    print(random_gen.next_int())   /* 3540625527 */
!    print(random_gen.next_int())   /* 2750739987 */
!    print(random_gen.next_int())   /* 4037983143 */
!    print(random_gen.next_int())   /* 1993361440 */
!    print(random_gen.next_int())   /* 3809424708 */
! 
! Task:
! 
! -   Generate a class/set of functions that generates pseudo-random
! 
! numbers as shown above.
! 
! -   Show that the first five integers genrated with the seed 1234567
! 
! are as shown above
! 
! -   Show that for an initial seed of 987654321, the counts of 100_000
!     repetitions of
! 
!    floor(random_gen.next_float() * 5)
! 
!     Is as follows:
! 
!    0: 20103, 1: 19922, 2: 19937, 3: 20031, 4: 20007
! 
! -   Show your output here, on this page.

USING: accessors kernel literals math math.statistics
prettyprint sequences ;

CONSTANT: mask64 $[ 1 64 shift 1 - ]
CONSTANT: mask32 $[ 1 32 shift 1 - ]
CONSTANT: const 0x2545F4914F6CDD1D

! Restrict seed value to positive integers.
PREDICATE: positive < integer 0 > ;
ERROR: seed-nonpositive seed ;

TUPLE: xorshift* { state positive initial: 1 } ;

: <xorshift*> ( seed -- xorshift* )
    dup positive? [ seed-nonpositive ] unless
    mask64 bitand xorshift* boa ;

: twiddle ( m n -- n ) dupd shift bitxor mask64 bitand ;

: next-int ( obj -- n )
    dup state>> -12 twiddle 25 twiddle -27 twiddle tuck swap
    state<< const * mask64 bitand -32 shift mask32 bitand ;

: next-float ( obj -- x ) next-int 1 32 shift /f ;

! ---=== Task ===---
1234567 <xorshift*> 5 [ dup next-int . ] times

987654321 >>state
100,000 [ dup next-float 5 * >integer ] replicate nip
histogram .
