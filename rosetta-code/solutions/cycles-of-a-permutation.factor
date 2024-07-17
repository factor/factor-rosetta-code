! On the event of their marriage, Alf and Betty are gifted a magnificent
! and weighty set of twenty-six wrought iron letters, from A to Z, by
! their good friends Anna and Graham.
! 
! Alf and Betty have, in their home, a shelf sturdy enough to display
! their gift, but it is only large enough to hold fifteen of the letters
! at one time. They decide to select fifteen of the letters and rearrange
! them every day, as part of their daily workout, and to select a
! different set of letters from time to time, when they grow bored of the
! current set.
! 
! To pass the time during their honeymoon, Alf and Betty select their
! first set of letters and find seven arrangements, one for each day of
! the week, that they think Anna and Graham would approve of. They are:
! 
!               Mon: HANDY COILS ERUPT
!               Tue: SPOIL UNDER YACHT
!               Wed: DRAIN STYLE POUCH
!               Thu: DITCH SYRUP ALONE
!               Fri: SOAPY THIRD UNCLE
!               Sat: SHINE PARTY CLOUD 
!               Sun: RADIO LUNCH TYPES
! 
! They decide to write down instructions for how to rearrange Monday's
! arrangement of letters into Tuesday's arrangement, Tuesday's to
! Wednesday's and so on, ending with Sunday's to Monday's.
! 
! However, rather than use the letters, they number the positions on the
! shelf from 1 to 15, and use those position numbers in their
! instructions. They decide to call these instructions "permutations".
! 
! So, for example, to move from the Wednesday arrangement to the Thursday
! arrangement, i.e.
! 
! Position on shelf:  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
!               Wed:  D  R  A  I  N  S  T  Y  L  E  P  O  U  C  H
!               Thu:  D  I  T  C  H  S  Y  R  U  P  A  L  O  N  E
! 
! they would write the permutation as:
! 
!              Wed:  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
!              Thu:  1  4  7 14 15  6  8  2 13 11  3  9 12  5 10
! 
! (i.e. The D that is in position 1 on Thursday stayed in position 1, the
! I that is in position 2 on Thursday came from position 4, the T in
! position 3 came from position 7, and so on.)
! 
! They decide to call this "two-line notation", because it takes two lines
! to write it down. They notice that the first line is always going to be
! the same, so it can be omitted, and simplify it to a "one-line notation"
! that would look like this:
! 
!              Wed->Thu: 1 4 7 14 15 6 8 2 13 11 3 9 12 5 10
! 
! As a subtle nuance, they figure out that when the letters at the right
! hand end don't move, they can safely leave them off the notation. For
! example, Mon and Tue both end with T, so for Mon->Tue the one-line
! notation would be fourteen numbers long rather than fifteen.
! 
! Then they notice that the letter at position 9 moves to position 12, the
! letter at position 12 moves to position 13, and the letter at position
! 13 moves to position 9, forming the cycle 9->12->13->9->12->13-> etc.,
! which they decide to write as (9 12 13). They call this a 3-cycle,
! because if they applied the cycle to the letters in those positions
! three times, they would end up back in their original positions.
! 
! They also notice that the letters in positions 1 and 6 do not move, so
! they decide to not write down any of the 1-cycles (not just the ones at
! the end as with the one-line notation.) They also decide that they will
! always write cycles starting with the smallest number in the cycle, and
! that when they write down the cycles in a permutation, the will be
! sorted by the first number in the permutation, smallest first.
! 
! The permutation Wed->Thur has a 10-cycle starting at position 2, a
! 3-cycle starting at position 9 and two 1-cycles (at positions 1 and 6),
! so they write down:
! 
!              Wed->Thu: (2 8 7 3 11 10 15 5 14 4) (9 12 13) 
! 
! They decide to call this "cycle notation". (By pure coincidence all the
! names they have chosen are the same as those used by mathematicians
! working in the field of abstract algebra. The abstract algebra term for
! converting from one-line notation to cycle notation is "decomposition".
! Alf and Betty probably wouldn't have thought of that. 1-cycles,
! 2-cycles, 3-cycles et cetera are collectively called k-cycles. 2-cycles
! are also called transpositions. One more piece of terminology: two or
! more cycles are disjoint if they have no elements in common. The cycles
! of a permutation written in cycle notation are disjoint.)
! 
! Alf and Betty notice that they can perform the first k-cycle as a series
! of transpositions, swapping the letters in positions 14 and 4, then the
! letters in positions 5 and 14, then 15 and 5, then 10 and 15 and so on,
! ending with swapping the letters in positions 4 and 2.
! 
! Then it occurs to them that it would be more efficient if one of them
! took the letter in position 8 and held it while the other moved the
! letter in position 7 and moved it to position 8, then moved 3 to 7, 11
! to 3 and so on. Finally the one who had been holding the letter from
! position 8 could put it in position 2.
! 
! Computer programmers would call this an "in-place" solution. The one and
! two-line notations lend themselves to a not-in-place solution, i.e.,
! having a second shelf that they could conveniently move they letters to
! while rearranging them.
! 
! If they accidentally did the Wed->Thu permutation on the wrong day of
! the week they would end up with a jumble of letters that they would need
! to undo using a Thu->Wed permutation. Mathematicians would call this the
! inverse of Wed->Thu.
! 
! They could do this in two-line notation by swapping the top and bottom
! lines and calculating the one-line notation result.
! 
!              Wed->Thu:  1  4  7 14 15  6  8  2 13 11  3  9 12  5 10
!                         1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
!                        --------------------------------------------
!              Thu->Wed:  1  8 11  2 14  6  3  7 12 15 10 13  9  4  5 
! 
! (To perform the calculation: The 1 in the top line has a 1 below it, so
! 1 goes in the first position in the result. The 2 in the second line has
! an 4 above it, so write 2 in the fourth position in the result. Th 3 in
! the second line has a seven above it, so write 3 in the seventh position
! in the result and so on.)
! 
! Or they could use cycle notation. To invert a cycle, reverse the order
! of the numbers in it. To maintain the convention that cycles start with
! the smallest number in the cycle, move the first number in the cycle to
! the end before reversing. So (9 13 12) -> (13 12 9) -> (9 12 13). Do
! this for every cycle.
! 
!              Wed->Thu: (2 8 7 3 11 10 15 5 14 4) (9 12 13)
!              Thu->Wed: (2 4 14 5 15 10 11 3 7 8) (9 13 12)
! 
! If Alf and Betty went to visit Anna and Graham on a Wednesday and came
! home on a Friday, they'd need to figure out the permutation Wed->Fri
! from the permutations Wed->Thu and Thu->Fri. Mathematicians call this
! either composition or multiplication, and if A is the notation for
! Wed->Thu and B is the notation for Thu->Fri, they would write it as BA
! or B∙A. It may seem backwards, but that's they way mathematicians roll.
! 
! Note that B∙A will NOT give the same result as A∙B – unlike regular
! multiplication of numbers, this sort of multiplication is generally not
! commutative. (There is an exception to this rule; when two or more
! cycles are disjoint they can be performed in any order.)
! 
! The cycle notation for Thu->Fri is
! 
!              Thu->Fri: (1 10 4 13 2 8 9 11 3 6) (5 7) (12 14)
! 
! and the multiplication Thu->Fri∙Wed->Thu gives the result
! 
!              Wed->Fri: (1 10 15 7 6 ) (2 9 14 13 11 4 8 5 12)
! 
! The order of a permutation is the number of times it needs to be applied
! for the items being rearranged to return to their starting position, and
! the signature of a permutation is 1 if an even number of transpositions
! would be required to do the permutation, and -1 if it required an odd
! number of permutations.
! 
! The order of a permutation is the least common multiple of its cycles'
! lengths, and the signature is 1 if a permutation has an even number of
! cycles with an even number of elements, and -1 otherwise.
! 
! For a summary of the mathematics discussed here, and a demonstration of
! the manual method for multiplying permutations in cycle notation, I
! suggest the Socratica YouTube video Cycle Notation of Permutations -
! Abstract Algebra.
! 
! (Other suitable videos are also available, including the first three
! parts of this YouTube playlist by Dr Angela Berardinelli.)
! 
! Wolfram Alpha is useful resource for testing code. If you enter one-line
! notation wrapped in parentheses and scroll down a little way when it has
! finished computing, you will find, amongst other things, the cycle
! decomposition and the inverse permutation. If you enter cycle notation
! preceded by the word "permutation" it will give the result of
! multiplying the cycles in all the notations mentioned above as well as
! the order and signature of the result.
! 
! Task:
! 
! Notes:
! 
! Alf and Betty chose to represent one-line notation as space delimited
! numbers without enclosing parentheses, brackets or braces. This
! representation is not mandated. If it is more convenient to, for
! example, use comma delimitation and enclosing braces, then do so.
! Similar considerations apply to their choice of representations for
! cycles and the cycles of a permutation. State which representations your
! solution uses.
! 
! Their choice of orderings for cycle notation (i.e. smallest number first
! for cycles, cycles sorted in ascending order by first number) is not
! mandated. If your solution uses a different ordering, describe it.
! 
! Similarly, right-to-left evaluation of cycle multiplication as
! composition of functions is not mandated. Show how Thu->Fri∙Wed->Thu
! would be written in your solution.
! 
! Alf and Betty's system is one-based. If a zero-based system is more
! appropriate, then use that, but provide the means (e.g. one or more
! functions, procedures, subroutines, methods, or words, et cetera) to
! allow conversion to and from zero-based and one-based representations so
! that user I/O can be one-based. State if this is the case in your
! solution.
! 
! Their choice of orderings for cycle notation (i.e. smallest number first
! for cycles, cycles sorted in ascending order by first number) is not
! mandated. If your solution uses a different ordering, describe it.
! 
! Their choice of omitting trailing 1-cycles in one-line notation and all
! 1-cycles in cycle-notation is not mandated. Include 1-cycles in either
! notation if you prefer.
! 
! Other names exist for some of the terms used in this task. For example,
! the signature is also known as the sign or parity. Use whichever terms
! you are comfortable with, but make it clear what they mean.
! 
! Data validation is not required for this task. You can assume that all
! arguments and user inputs are valid. If you do include sanity checks,
! they should not be to the detriment of the legibility of your code.
! 
! If the required functionality is available as part of your language or
! in a library well known to the language's user base, state this and
! consider writing equivalent code for bonus points.
! 
! 1.  Provide routines (i.e. functions, procedures, subroutines, methods,
!     words or whatever your language uses) that
!     1.  given two strings containing the same characters as one another,
!         and without repeated characters within the strings, returns the
!         permutation in either one-line or cycle notation that transforms
!         one of the strings into the other.
!     2.  given a permutation, returns the inverse permutation, for both
!         cycle and one-line notation.
!     3.  given a permutation and a string of unique characters, returns
!         the string with the characters permuted, for both cycle and
!         one-line notation.
!     4.  given two permutations A and B in cycle notation, returns a
!         single permutation in cycle notation equivalent to applying
!         first A and then B. i.e. A.B
!     5.  convert permutations in one-line notation to cycle notation and
!         vice versa.
!     6.  return the order of a permutation.
!     7.  return the signature of a permutation.
! 2.  Demonstrate how Alf and Betty can use this functionality in the
!     scenario described above. Assume that Alf and Betty are novice
!     programmers that have some famiiarity with your language. (i.e. Keep
!     It Simple.) Provide the output from your demonstation code.


