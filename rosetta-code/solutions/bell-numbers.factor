! Bell or exponential numbers are enumerations of the number of different
! ways to partition a set that has exactly n elements. Each element of the
! sequence B_(n) is the number of partitions of a set of size n where
! order of the elements and order of the partitions are non-significant.
! E.G.: {a b} is the same as {b a} and {a} {b} is the same as {b} {a}.
! 
! So:
! 
!     B₀ = 1 trivially. There is only one way to partition a set with zero
!     elements. { }
! 
!     B₁ = 1 There is only one way to partition a set with one element.
!     {a}
! 
!     B₂ = 2 Two elements may be partitioned in two ways. {a} {b}, {a b}
! 
!     B₃ = 5 Three elements may be partitioned in five ways {a} {b} {c},
!     {a b} {c}, {a} {b c}, {a c} {b}, {a b c}
! 
!     and so on.
! 
! A simple way to find the Bell numbers is construct a Bell triangle, also
! known as an Aitken's array or Peirce triangle, and read off the numbers
! in the first column of each row. There are other generating algorithms
! though, and you are free to choose the best / most appropriate for your
! case.
! 
! Task:
! 
! Write a routine (function, generator, whatever) to generate the Bell
! number sequence and call the routine to show here, on this page at least
! the first 15 and (if your language supports big Integers) 50th elements
! of the sequence.
! 
! If you do use the Bell triangle method to generate the numbers, also
! show the first ten rows of the Bell triangle.
! 
! See also:
! 
! -   -   OEIS:A000110 Bell or exponential numbers
!     -   OEIS:A011971 Aitken's array

USING: formatting io kernel math math.matrices sequences vectors ;

: next-row ( prev -- next )
    [ 1 1vector ]
    [ dup last [ + ] accumulate swap suffix! ] if-empty ;

: aitken ( n -- seq )
    V{ } clone swap [ next-row dup ] replicate nip ;

0 50 aitken col [ 15 head ] [ last ] bi
"First 15 Bell numbers:\n%[%d, %]\n\n50th: %d\n\n" printf
"First 10 rows of the Bell triangle:" print
10 aitken [ "%[%d, %]\n" printf ] each
