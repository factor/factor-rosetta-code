!                         ABCD
!                         CABD
!                         ACDB
!                         DACB
!                         BCDA
!                         ACBD
!                         ADCB
!                         CDAB
!                         DABC
!                         BCAD
!                         CADB
!                         CDBA
!                         CBAD
!                         ABDC
!                         ADBC
!                         BDCA
!                         DCBA
!                         BACD
!                         BADC
!                         BDAC
!                         CBDA
!                         DBCA
!                         DCAB
! 
! Listed above are all-but-one of the permutations of the symbols A, B, C,
! and D, except for one permutation that's not listed.
! 
! Task:
! 
! Find that missing permutation.
! 
! Methods:
! 
! -   Obvious method:
! 
!         enumerate all permutations of   A,  B,  C,  and  D,  
!         and then look for the missing permutation. 
! 
! -   alternate method:
! 
!         Hint:  if all permutations were shown above,  how many 
!         times would  A  appear in each position?     
!         What is the  parity  of this number?
! 
! -   another alternate method:
! 
!         Hint:  if you add up the letter values of each column, 
!         does a missing letter   A,  B,  C,  and  D   from each
!         column cause the total value for each column to be unique?
! 
! Related task:
! 
! -   Permutations)

USING: io math.combinatorics sequences sets ;

"ABCD" all-permutations lines diff first print
