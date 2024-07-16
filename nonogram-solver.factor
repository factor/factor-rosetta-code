! A nonogram is a puzzle that provides numeric clues used to fill in a
! grid of cells, establishing for each cell whether it is filled or not.
! The puzzle solution is typically a picture of some kind.
! 
! Each row and column of a rectangular grid is annotated with the lengths
! of its distinct runs of occupied cells. Using only these lengths you
! should find one valid configuration of empty and occupied cells, or show
! a failure message.
! 
! Example
! 
!     Problem:                 Solution:
! 
!     . . . . . . . .  3       . # # # . . . .  3
!     . . . . . . . .  2 1     # # . # . . . .  2 1
!     . . . . . . . .  3 2     . # # # . . # #  3 2
!     . . . . . . . .  2 2     . . # # . . # #  2 2
!     . . . . . . . .  6       . . # # # # # #  6
!     . . . . . . . .  1 5     # . # # # # # .  1 5
!     . . . . . . . .  6       # # # # # # . .  6
!     . . . . . . . .  1       . . . . # . . .  1
!     . . . . . . . .  2       . . . # # . . .  2
!     1 3 1 7 5 3 4 3          1 3 1 7 5 3 4 3
!     2 1 5 1                  2 1 5 1
! 
! The problem above could be represented by two lists of lists:
! 
!     x = [[3], [2,1], [3,2], [2,2], [6], [1,5], [6], [1], [2]]
!     y = [[1,2], [3,1], [1,5], [7,1], [5], [3], [4], [3]]
! 
! A more compact representation of the same problem uses strings, where
! the letters represent the numbers, A=1, B=2, etc:
! 
!     x = "C BA CB BB F AE F A B"
!     y = "AB CA AE GA E C D C"
! 
! Task
! 
! For this task, try to solve the 4 problems below, read from a
! “nonogram_problems.txt” file that has this content (the blank lines are
! separators):
! 
!     C BA CB BB F AE F A B
!     AB CA AE GA E C D C
! 
!     F CAC ACAC CN AAA AABB EBB EAA ECCC HCCC
!     D D AE CD AE A DA BBB CC AAB BAA AAB DA AAB AAA BAB AAA CD BBA DA
! 
!     CA BDA ACC BD CCAC CBBAC BBBBB BAABAA ABAD AABB BBH BBBD ABBAAA CCEA AACAAB BCACC ACBH DCH ADBE ADBB DBE ECE DAA DB CC
!     BC CAC CBAB BDD CDBDE BEBDF ADCDFA DCCFB DBCFC ABDBA BBF AAF BADB DBF AAAAD BDG CEF CBDB BBB FC
! 
!     E BCB BEA BH BEK AABAF ABAC BAA BFB OD JH BADCF Q Q R AN AAN EI H G
!     E CB BAB AAA AAA AC BB ACC ACCA AGB AIA AJ AJ ACE AH BAF CAG DAG FAH FJ GJ ADK ABK BL CM
! 
! Extra credit: generate nonograms with unique solutions, of desired
! height and width.
! 
! This task is the problem n.98 of the "99 Prolog Problems" (archived) by
! Werner Hett (also thanks to Paul Singleton for the idea and the
! examples).
! 
! Related tasks
! 
! -   Nonoblock.
! 
! See also
! 
! -   Arc Consistency Algorithm
! -   http://www.haskell.org/haskellwiki/99_questions/Solutions/98
!     (Haskell)
! -   http://twanvl.nl/blog/haskell/Nonograms (Haskell)
! -   http://picolisp.com/5000/!wiki?99p98 (PicoLisp)

