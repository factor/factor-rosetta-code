! Task:
! 
! Given a text file and an integer n, print/display the n most common
! words in the file (and the number of their occurrences) in decreasing
! frequency.
! 
! For the purposes of this task:
! 
! -   A word is a sequence of one or more contiguous letters.
! -   You are free to define what a letter is.
! -   Underscores, accented letters, apostrophes, hyphens, and other
!     special characters can be handled at your discretion.
! -   You may treat a compound word like well-dressed as either one word
!     or two.
! -   The word it's could also be one or two words as you see fit.
! -   You may also choose not to support non US-ASCII characters.
! -   Assume words will not span multiple lines.
! -   Don't worry about normalization of word spelling differences.
! -   Treat color and colour as two distinct words.
! -   Uppercase letters are considered equivalent to their lowercase
!     counterparts.
! -   Words of equal frequency can be listed in any order.
! -   Feel free to explicitly state the thoughts behind the program
!     decisions.
! 
! Show example output using Les Misérables from Project Gutenberg as the
! text file input and display the top 10 most used words.
! 
! History:
! 
! This task was originally taken from programming pearls from
! Communications of the ACM June 1986 Volume 29 Number 6 where this
! problem is solved by Donald Knuth using literate programming and then
! critiqued by Doug McIlroy, demonstrating solving the problem in a 6 line
! Unix shell script (provided as an example below).
! 
! References:
! 
! -   McIlroy's program
! 
! Category:Text processing


USING: ascii io math.statistics prettyprint sequences
splitting ;
IN: rosetta-code.word-count

lines " " join " .,?!:;()\"-" split harvest [ >lower ] map
sorted-histogram <reversed> 10 head .

