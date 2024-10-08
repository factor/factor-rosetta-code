! Background:
! 
! This "longest string challenge" is inspired by a problem that used to be
! given to students learning Icon. Students were expected to try to solve
! the problem in Icon and another language with which the student was
! already familiar. The basic problem is quite simple; the challenge and
! fun part came through the introduction of restrictions. Experience has
! shown that the original restrictions required some adjustment to bring
! out the intent of the challenge and make it suitable for Rosetta Code.
! 
! Basic problem statement
! 
! Write a program that reads lines from standard input and, upon end of
! file, writes the longest line to standard output. If there are ties for
! the longest line, the program writes out all the lines that tie. If
! there is no input, the program should produce no output.
! 
! Task
! 
! Implement a solution to the basic problem that adheres to the spirit of
! the restrictions (see below).
! 
! Describe how you circumvented or got around these 'restrictions' and met
! the 'spirit' of the challenge. Your supporting description may need to
! describe any challenges to interpreting the restrictions and how you
! made this interpretation. You should state any assumptions, warnings, or
! other relevant points. The central idea here is to make the task a bit
! more interesting by thinking outside of the box and perhaps by showing
! off the capabilities of your language in a creative way. Because there
! is potential for considerable variation between solutions, the
! description is key to helping others see what you've done.
! 
! This task is likely to encourage a variety of different types of
! solutions. They should be substantially different approaches.
! 
! Given the input:
! 
!     a
!     bb
!     ccc
!     ddd
!     ee
!     f
!     ggg
! 
! the output should be (possibly rearranged):
! 
!     ccc
!     ddd
!     ggg
! 
! Original list of restrictions
! 
! 1.  No comparison operators may be used.
! 2.  No arithmetic operations, such as addition and subtraction, may be
!     used.
! 3.  The only datatypes you may use are integer and string. In
!     particular, you may not use lists.
! 4.  Do not re-read the input file. Avoid using files as a replacement
!     for lists (this restriction became apparent in the discussion).
! 
! Intent of restrictions:
! 
! Because of the variety of languages on Rosetta Code and the wide variety
! of concepts used in them, there needs to be a bit of clarification and
! guidance here to get to the spirit of the challenge and the intent of
! the restrictions.
! 
! The basic problem can be solved very conventionally, but that's boring
! and pedestrian. The original intent here wasn't to unduly frustrate
! people with interpreting the restrictions, it was to get people to think
! outside of their particular box and have a bit of fun doing it.
! 
! The guiding principle here should be to be creative in demonstrating
! some of the capabilities of the programming language being used. If you
! need to bend the restrictions a bit, explain why and try to follow the
! intent. If you think you've implemented a 'cheat', call out the fragment
! yourself and ask readers if they can spot why. If you absolutely can't
! get around one of the restrictions, explain why in your description.
! 
! Now having said that, the restrictions require some elaboration.
! 
! -   In general, the restrictions are meant to avoid the explicit use of
!     these features.
! -   "No comparison operators may be used" - At some level there must be
!     some test that allows the solution to get at the length and
!     determine if one string is longer. Comparison operators, in
!     particular any less/greater comparison should be avoided.
!     Representing the length of any string as a number should also be
!     avoided. Various approaches allow for detecting the end of a string.
!     Some of these involve implicitly using equal/not-equal; however,
!     explicitly using equal/not-equal should be acceptable.
! -   "No arithmetic operations" - Again, at some level something may have
!     to advance through the string. Often there are ways a language can
!     do this implicitly advance a cursor or pointer without explicitly
!     using a +, - , ++, --, add, subtract, etc.
! -   The datatype restrictions are amongst the most difficult to
!     reinterpret. In the language of the original challenge strings are
!     atomic datatypes and structured datatypes like lists are quite
!     distinct and have many different operations that apply to them. This
!     becomes a bit fuzzier with languages with a different programming
!     paradigm. The intent would be to avoid using an easy structure to
!     accumulate the longest strings and spit them out. There will be some
!     natural reinterpretation here.
! 
! To make this a bit more concrete, here are a couple of specific
! examples: In C, a string is an array of chars, so using a couple of
! arrays as strings is in the spirit while using a second array in a
! non-string like fashion would violate the intent. In APL or J, arrays
! are the core of the language so ruling them out is unfair. Meeting the
! spirit will come down to how they are used.
! 
! Please keep in mind these are just examples and you may hit new
! territory finding a solution. There will be other cases like these.
! Explain your reasoning. You may want to open a discussion on the talk
! page as well.
! 
! -   The added "No rereading" restriction is for practical reasons,
!     re-reading stdin should be broken. I haven't outright banned the use
!     of other files but I've discouraged them as it is basically another
!     form of a list. Somewhere there may be a language that just sings
!     when doing file manipulation and where that makes sense; however,
!     for most there should be a way to accomplish without resorting to an
!     externality.
! 
! At the end of the day for the implementer this should be a bit of fun.
! As an implementer you represent the expertise in your language, the
! reader may have no knowledge of your language. For the reader it should
! give them insight into how people think outside the box in other
! languages. Comments, especially for non-obvious (to the reader) bits
! will be extremely helpful. While the implementations may be a bit
! artificial in the context of this task, the general techniques may be
! useful elsewhere.


