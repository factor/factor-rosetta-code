! Verifying Syntax
! 
! A Syntax Analyzer that verifies a token stream,
! 
! outputs a string "true" if the token stream matches the grammar
! requirement,
! 
! outputs a string "false" if the token stream does not match the grammar.
! 
! Task
! 
! The program reads input from a file of token stream,
! 
! reads it and outputs a string "true" if the token stream matches the
! grammar,
! 
! outputs a string "false" and error messages if the token stream does not
! match the grammar,
! 
! based on the grammar below. The grammar is written in Extended
! Backus-Naur Form (EBNF).
! 
! Grammar
! 
!     stmt         =         expr ; 
! 
!     expr         =         expr_level_2; 
!     expr_level_2 =         expr_level_3 {"or" expr_level_3} ; 
!     expr_level_3 =         expr_level_4 {"and" expr_level_4} ; 
!     expr_level_4 = ["not"] expr_level_5 [('=' | '<') expr_level_5] ; 
!     expr_level_5 =         expr_level_6 {('+' | '-') expr_level_6} ; 
!     expr_level_6 =         primary      {('*' | '/') primary} ; 
! 
!     primary      =         Identifier
!                          | Integer
!                          | '(' expr ')'
!                          | "true"
!                          | "false"
!                          ;
!     Integer      =         Digit {Digit};
! 
!     Identifier   =         Letter {Letter | Digit | '_'};
! 
!     Digit        =         "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
! 
!     Letter       =         "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" 
!                          | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" 
!                          | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" 
!                          | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" 
!                          | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" 
!                          | "Y" | "Z" ;


