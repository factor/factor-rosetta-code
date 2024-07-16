! Task:
! 
! Reverse the order of all tokens in each of a number of strings and
! display the result; the order of characters within a token should not be
! modified.
! 
! Example:
! 
! Hey you, Bub! would be shown reversed as: Bub! you, Hey
! 
! Tokens are any non-space characters separated by spaces (formally,
! white-space); the visible punctuation form part of the word within which
! it is located and should not be modified.
! 
! You may assume that there are no significant non-visible characters in
! the input. Multiple or superfluous spaces may be compressed into a
! single space.
! 
! Some strings have no tokens, so an empty string (or one just containing
! spaces) would be the result.
! 
! Display the strings in order (1^(st), 2^(nd), 3^(rd), ···), and one
! string per line.
! 
! (You can consider the ten strings as ten lines, and the tokens as
! words.)
! 
! Input data
! 
!                  (ten lines within the box)
!      line
!          ╔════════════════════════════════════════╗
!        1 ║  ---------- Ice and Fire ------------  ║
!        2 ║                                        ║  ◄─── a blank line here.
!        3 ║  fire, in end will world the say Some  ║
!        4 ║  ice. in say Some                      ║
!        5 ║  desire of tasted I've what From       ║
!        6 ║  fire. favor who those with hold I     ║
!        7 ║                                        ║  ◄─── a blank line here.
!        8 ║  ... elided paragraph last ...         ║
!        9 ║                                        ║  ◄─── a blank line here.
!       10 ║  Frost Robert -----------------------  ║
!          ╚════════════════════════════════════════╝
! 
! Cf.
! 
! -   Phrase reversals

USING: io sequences splitting ;
IN: rosetta-code.reverse-words

"---------- Ice and Fire ------------

fire, in end will world the say Some
ice. in say Some
desire of tasted I've what From
fire. favor who those with hold I

... elided paragraph last ...

Frost Robert -----------------------"

"\n" split [ " " split reverse " " join ] map [ print ] each
