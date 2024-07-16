! A CUSIP is a nine-character alphanumeric code that identifies a North
! American financial security for the purposes of facilitating clearing
! and settlement of trades. The CUSIP was adopted as an American National
! Standard under Accredited Standards X9.6.
! 
! Task:
! 
! Ensure the last digit (i.e., the check digit) of the CUSIP code (the
! 1^(st) column) is correct, against the following:
! 
! -   037833100 Apple Incorporated
! -   17275R102 Cisco Systems
! -   38259P508 Google Incorporated
! -   594918104 Microsoft Corporation
! -   68389X106 Oracle Corporation (incorrect)
! -   68389X105 Oracle Corporation
! 
! Example pseudo-code below.
! 
!     algorithm Cusip-Check-Digit(cusip) is
!        Input: an 8-character CUSIP
! 
!        sum := 0
!        for 1 ≤ i ≤ 8 do
!           c := the ith character of cusip
!           if c is a digit then
!              v := numeric value of the digit c
!           else if c is a letter then
!              p := ordinal position of c in the alphabet (A=1, B=2...)
!              v := p + 9
!           else if c = "*" then
!              v := 36
!           else if c = "@" then
!              v := 37
!           else if' c = "#" then
!              v := 38
!           end if
!           if i is even then
!              v := v × 2
!           end if
! 
!           sum := sum + int ( v div 10 ) + v mod 10
!        repeat
! 
!        return (10 - (sum mod 10)) mod 10
!     end function
! 
! See related tasks:
! 
! -   SEDOL
! -   ISIN

USING: combinators.short-circuit formatting kernel math
math.parser qw regexp sequences unicode ;
IN: rosetta-code.cusip

: cusip-check-digit ( seq -- n )
    but-last-slice [
        [ dup alpha? [ digit> ] [ "*@#" index 36 + ] if ] dip
        odd? [ 2 * ] when 10 /mod +
    ] map-index sum 10 mod 10 swap - 10 mod ;

: cusip? ( seq -- ? )
    {
        [ R/ [0-9A-Z*@#]+/ matches? ]
        [ [ last digit> ] [ cusip-check-digit ] bi = ]
    } 1&& ;

qw{ 037833100 17275R102 38259P508 594918104 68389X106 68389X105 }
[ dup cusip? "correct" "incorrect" ? "%s -> %s\n" printf ] each
