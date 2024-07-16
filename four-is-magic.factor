! Task:
! 
! Write a subroutine, function, whatever it may be called in your
! language, that takes an integer number and returns an English text
! sequence starting with the English cardinal representation of that
! integer, the word 'is' and then the English cardinal representation of
! the count of characters that made up the first word, followed by a
! comma.
! 
! Continue the sequence by using the previous count word as the first word
! of the next phrase, append 'is' and the cardinal count of the letters in
! that word.
! 
! Continue until you reach four. Since four has four characters, finish by
! adding the words 'four is magic' and a period. All integers will
! eventually wind up at four.
! 
! For instance, suppose your are given the integer 3. Convert 3 to Three,
! add is, then the cardinal character count of three, or five, with a
! comma to separate if from the next phrase. Continue the sequence five is
! four, (five has four letters), and finally, four is magic.
! 
!      Three is five, five is four, four is magic.
! 
! For reference, here are outputs for 0 through 9.
! 
!      Zero is four, four is magic.
!      One is three, three is five, five is four, four is magic.
!      Two is three, three is five, five is four, four is magic.
!      Three is five, five is four, four is magic.
!      Four is magic.
!      Five is four, four is magic.
!      Six is three, three is five, five is four, four is magic.
!      Seven is five, five is four, four is magic.
!      Eight is five, five is four, four is magic.
!      Nine is four, four is magic.
! 
! Some task guidelines:
! 
! -   -   You may assume the input will only contain integer numbers.
!     -   Cardinal numbers between 20 and 100 may use either hyphens or
!         spaces as word separators but they must use a word separator.
!         (23 is twenty three or twenty-three not twentythree.)
!     -   Cardinal number conversions should follow the English short
!         scale. (billion is 1e9, trillion is 1e12, etc.)
!     -   Cardinal numbers should not include commas. (20140 is twenty
!         thousand one hundred forty not twenty thousand, one hundred
!         forty.)
!     -   When converted to a string, 100 should be one hundred, not a
!         hundred or hundred, 1000 should be one thousand, not a thousand
!         or thousand.
!     -   When converted to a string, there should be no and in the
!         cardinal string. 130 should be one hundred thirty not one
!         hundred and thirty.
!     -   When counting characters, count all of the characters in the
!         cardinal number including spaces and hyphens. One hundred
!         fifty-one should be 21 not 18.
!     -   The output should follow the format "N is K, K is M, M is ...
!         four is magic." (unless the input is 4, in which case the output
!         should simply be "four is magic.")
!     -   The output can either be the return value from the function, or
!         be displayed from within the function.
!     -   You are encouraged, though not mandated to use proper sentence
!         capitalization.
!     -   You may optionally support negative numbers. -7 is negative
!         seven.
!     -   Show the output here for a small representative sample of
!         values, at least 5 but no more than 25. You are free to choose
!         which which numbers to use for output demonstration.
! 
! You can choose to use a library, (module, external routine, whatever) to
! do the cardinal conversions as long as the code is easily and freely
! available to the public.
! 
! If you roll your own, make the routine accept at minimum any integer
! from 0 up to 999999. If you use a pre-made library, support at least up
! to unsigned 64 bit integers. (or the largest integer supported in your
! language if it is less.)
! 
! Four is magic is a popular code-golf task. This is not code golf. Write
! legible, idiomatic and well formatted code.
! 
! Related tasks:
! 
! -   -   Four is the number of_letters in the ...
!     -   Look-and-say sequence
!     -   Number names
!     -   Self-describing numbers
!     -   Summarize and say sequence
!     -

USING: ascii formatting io kernel make math.text.english regexp
sequences ;
IN: rosetta-code.four-is-magic

! Strip " and " and "," from the output of Factor's number>text
! word with a regular expression.
: number>english ( n -- str )
    number>text R/ and |,/ "" re-replace ;

! Return the length of the input integer's text form.
! e.g. 1 -> 3
: next-len ( n -- m ) number>english length ;

! Given a starting integer, return the sequence of lengths
! terminating with 4.
! e.g. 1 -> { 1 3 5 4 }
: len-chain ( n -- seq )
    [ [ dup 4 = ] [ dup , next-len ] until , ] { } make ;

! Convert a non-four number to its phrase form.
! e.g. 6 -> "six is three, "
: non-four ( n -- str )
    number>english dup length number>english
    "%s is %s, " sprintf ;

! Convert any number to its phrase form.
! e.g. 4 -> "four is magic."
: phrase ( n -- str )
    dup 4 = [ drop "four is magic." ] [ non-four ] if ;
    
: say-magic ( n -- )
    len-chain [ phrase ] map concat capitalize print ;
    
{ 1 4 -11 100 112719908181724 -612312 } [ say-magic ] each
