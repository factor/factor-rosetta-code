! In bioinformatics, long character strings are often encoded in a format
! called FASTA.
! 
! A FASTA file can contain several strings, each identified by a name
! marked by a > (greater than) character at the beginning of the line.
! 
! Task:
! 
! Write a program that reads a FASTA file such as:
! 
!     >Rosetta_Example_1
!     THERECANBENOSPACE
!     >Rosetta_Example_2
!     THERECANBESEVERAL
!     LINESBUTTHEYALLMUST
!     BECONCATENATED
! 
!     Rosetta_Example_1: THERECANBENOSPACE
!     Rosetta_Example_2: THERECANBESEVERALLINESBUTTHEYALLMUSTBECONCATENATED
! 
! Note that a high-quality implementation will not hold the entire file in
! memory at once; real FASTA files can be multiple gigabytes in size.

USING: formatting io kernel sequences ;
IN: rosetta-code.fasta

: process-fasta-line ( str -- )
    dup ">" head? [ rest "\n%s: " printf ] [ write ] if ;

: main ( -- )
    readln rest "%s: " printf [ process-fasta-line ] each-line ;

MAIN: main
