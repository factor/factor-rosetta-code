! Soundex is an algorithm for creating indices for words based on their
! pronunciation.
! 
! Task:
! 
! The goal is for homophones to be encoded to the same representation so
! that they can be matched despite minor differences in spelling (from the
! soundex Wikipedia article).
! 
! Caution:
! 
! There is a major issue in many of the implementations concerning the
! separation of two consonants that have the same soundex code! According
! to the official Rules
! https://www.archives.gov/research/census/soundex.html. So check for
! instance if Ashcraft is coded to A-261.
! 
! -   If a vowel (A, E, I, O, U) separates two consonants that have the
!     same soundex code, the consonant to the right of the vowel is coded.
!     Tymczak is coded as T-522 (T, 5 for the M, 2 for the C, Z ignored
!     (see "Side-by-Side" rule above), 2 for the K). Since the vowel "A"
!     separates the Z and K, the K is coded.
! -   If "H" or "W" separate two consonants that have the same soundex
!     code, the consonant to the right of the vowel is not coded. Example:
!     Ashcraft is coded A-261 (A, 2 for the S, C ignored, 6 for the R, 1
!     for the F). It is not coded A-226.

USE: soundex
"soundex" soundex    ! S532
"example" soundex    ! E251
"ciondecks" soundex  ! C532
"ekzampul" soundex   ! E251
