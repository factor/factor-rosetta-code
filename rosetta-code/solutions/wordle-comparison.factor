! Rationale:
! 
! While similar to both Bulls and cows and Mastermind, Wordle is a notable
! variation, having experienced a viral surge in popularity, and reverse
! engineering the game or creating variants has become a popular
! programming exercise. However, a sampling of the "code a Wordle clone"
! videos on YouTube shows that seven of the eight reviewed had a serious
! flaw in the way that they assigned colours to the letters of a guessed
! word. This aspect of the game is described here:
! en.wikipedia.org/wiki/Wordle#Gameplay
! 
!   After every guess, each letter is marked as either green, yellow or
!   gray: green indicates that letter is correct and in the correct
!   position, yellow means it is in the answer but not in the right
!   position, while gray indicates it is not in the answer at all.
!   Multiple instances of the same letter in a guess, such as the "o"s in
!   "robot", will be colored green or yellow only if the letter also
!   appears multiple times in the answer; otherwise, excess repeating
!   letters will be colored gray.
! 
! Task:
! 
! Create a function or procedure that takes two strings; the answer
! string, and the guess string, and returns a string, list, dynamic array
! or other ordered sequence indicating how each letter should be marked as
! per the description above. (e.g. "green", "yellow", or "grey", or,
! equivalently, the integers 2, 1, or 0 or suchlike.)
! 
! You can assume that both the answer string and the guess string are the
! same length, and contain only printable characters/code points in the
! ASCII/UniCode Range ! to ~ (hex 20 to 7F) and that case is significant.
! (The original game only uses strings of 5 characters, all alphabetic
! letters, all in the same case, but this allows for most existing
! variants of the game.)
! 
! Provide test data and show the output here.
! 
! The test data should include the answer string ALLOW and the guess
! string LOLLY, and the result should be
! (yellow, yellow, green, grey, grey) or equivalent.


