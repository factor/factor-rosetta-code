! A quine is a self-referential program that can, without any external
! access, output its own source.
! 
! A quine (named after Willard Van Orman Quine) is also known as:
! 
! -   -   self-reproducing automata (1972)
!     -   self-replicating program or self-replicating computer program
!     -   self-reproducing program or self-reproducing computer program
!     -   self-copying program or self-copying computer program
! 
! It is named after the philosopher and logician who studied
! self-reference and quoting in natural language, as for example in the
! paradox "'Yields falsehood when preceded by its quotation' yields
! falsehood when preceded by its quotation."
! 
! "Source" has one of two meanings. It can refer to the text-based program
! source. For languages in which program source is represented as a data
! structure, "source" may refer to the data structure: quines in these
! languages fall into two categories: programs which print a textual
! representation of themselves, or expressions which evaluate to a data
! structure which is equivalent to that expression.
! 
! The usual way to code a quine works similarly to this paradox: The
! program consists of two identical parts, once as plain code and once
! quoted in some way (for example, as a character string, or a literal
! data structure). The plain code then accesses the quoted code and prints
! it out twice, once unquoted and once with the proper quotation marks
! added. Often, the plain code and the quoted code have to be nested.
! 
! Task:
! 
! Write a program that outputs its own source code in this way. If the
! language allows it, you may add a variant that accesses the code
! directly. You are not allowed to read any external files with the source
! code. The program should also contain some sort of self-reference, so
! constant expressions which return their own value which some top-level
! interpreter will print out. Empty programs producing no output are not
! allowed.
! 
! There are several difficulties that one runs into when writing a quine,
! mostly dealing with quoting:
! 
! -   Part of the code usually needs to be stored as a string or
!     structural literal in the language, which needs to be quoted
!     somehow. However, including quotation marks in the string literal
!     itself would be troublesome because it requires them to be escaped,
!     which then necessitates the escaping character (e.g. a backslash) in
!     the string, which itself usually needs to be escaped, and so on.
!     -   Some languages have a function for getting the "source code
!         representation" of a string (i.e. adds quotation marks, etc.);
!         in these languages, this can be used to circumvent the quoting
!         problem.
!     -   Another solution is to construct the quote character from its
!         character code, without having to write the quote character
!         itself. Then the character is inserted into the string at the
!         appropriate places. The ASCII code for double-quote is 34, and
!         for single-quote is 39.
! -   Newlines in the program may have to be reproduced as newlines in the
!     string, which usually requires some kind of escape sequence (e.g.
!     "\n"). This causes the same problem as above, where the escaping
!     character needs to itself be escaped, etc.
!     -   If the language has a way of getting the "source code
!         representation", it usually handles the escaping of characters,
!         so this is not a problem.
!     -   Some languages allow you to have a string literal that spans
!         multiple lines, which embeds the newlines into the string
!         without escaping.
!     -   Write the entire program on one line, for free-form languages
!         (as you can see for some of the solutions here, they run off the
!         edge of the screen), thus removing the need for newlines.
!         However, this may be unacceptable as some languages require a
!         newline at the end of the file; and otherwise it is still
!         generally good style to have a newline at the end of a file.
!         (The task is not clear on whether a newline is required at the
!         end of the file.) Some languages have a print statement that
!         appends a newline; which solves the newline-at-the-end issue;
!         but others do not.
! 
! Next to the Quines presented here, many other versions can be found on
! the Quine page.
! 
! Related task:
! 
! -   -   print itself.

"%s [ 34 1string dup surround ] keep printf" [ 34 1string dup surround ] keep printf
