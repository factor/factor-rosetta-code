! Splitmix64 is the default pseudo-random number generator algorithm in
! Java and is included / available in many other languages. It uses a
! fairly simple algorithm that, though it is considered to be poor for
! cryptographic purposes, is very fast to calculate, and is "good enough"
! for many random number needs. It passes several fairly rigorous PRNG
! "fitness" tests that some more complex algorithms fail.
! 
! Splitmix64 is not recommended for demanding random number requirements,
! but is often used to calculate initial states for other more complex
! pseudo-random number generators.
! 
! The "standard" splitmix64 maintains one 64 bit state variable and
! returns 64 bits of random data with each call.
! 
! Basic pseudocode algorithm:
! 
!         uint64 state                                  /* The state can be seeded with any (upto) 64 bit integer value. */
! 
!         next_int() {
!             state += 0x9e3779b97f4a7c15               /* increment the state variable */
!             uint64 z = state                          /* copy the state to a working variable */
!             z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9  /* xor the variable with the variable right bit shifted 30 then multiply by a constant */
!             z = (z ^ (z >> 27)) * 0x94d049bb133111eb  /* xor the variable with the variable right bit shifted 27 then multiply by a constant */
!             return z ^ (z >> 31)                      /* return the variable xored with itself right bit shifted 31 */
!         }
! 
!         next_float() {
!             return next_int() / (1 << 64)             /* divide by 2^64 to return a value between 0 and 1 */
!         }
! 
! The returned value should hold 64 bits of numeric data. If your language
! does not support unsigned 64 bit integers directly you may need to apply
! appropriate bitmasks during bitwise operations.
! 
! In keeping with the general layout of several recent pseudo-random
! number tasks:
! 
! Task:
! 
! -   Write a class or set of functions that generates pseudo-random
!     numbers using splitmix64.
! 
! -   Show the first five integers generated using the seed 1234567.
! 
!     6457827717110365317
!     3203168211198807973
!     9817491932198370423
!     4593380528125082431
!    16408922859458223821
! 
! -   Show that for an initial seed of 987654321, the counts of 100_000
!     repetitions of floor next_float() * 5 is as follows:
! 
!    0: 20027, 1: 19892, 2: 20073, 3: 19978, 4: 20030  
! 
! -   Show your output here, on this page.
! 
! See also:
! 
! * Java docs for splitmix64
! * Public domain C code used in many PRNG implementations; by Sebastiano Vigna
! 
! Related tasks:
! * Pseudo-random numbers/Combined recursive generator MRG32k3a‎‎
! * Pseudo-random numbers/PCG32‎‎
! * Pseudo-random_numbers/Xorshift_star

USING: io kernel math math.bitwise math.functions
math.statistics namespaces prettyprint sequences ;

SYMBOL: state

: seed ( n -- ) 64 bits state set ;

: next-int ( -- n )
    0x9e3779b97f4a7c15 state [ + 64 bits ] change
    state get -30 0xbf58476d1ce4e5b9 -27 0x94d049bb133111eb -31 1
    [ [ dupd shift bitxor ] dip * 64 bits ] 2tri@ ;

: next-float ( -- x ) next-int 64 2^ /f ;

! Test next-int
"Seed: 1234567; first five integer values" print
1234567 seed 5 [ next-int . ] times nl

! Test next-float
"Seed: 987654321; first 100,000 float values histogram" print
987654321 seed 100,000 [ next-float 5 * >integer ] replicate
histogram .
