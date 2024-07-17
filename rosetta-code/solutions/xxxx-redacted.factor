! You've been given a contract from a three letter abbreviation government
! agency. They want a program to automatically redact sensitive
! information from documents to be released to the public. They want fine
! control over what gets redacted though.
! 
! Given a piece of free-form, possibly Unicode text, (assume text only, no
! markup or formatting codes) they want to be able to redact: whole words,
! (case sensitive or insensitive) or partial words, (case sensitive or
! insensitive). Further, they want the option to "overkill" redact a
! partial word. Overkill redact means if the word contains the redact
! target, even if is only part of the word, redact the entire word.
! 
! For our purposes, a "word" here, means: a character group, separated by
! white-space and possibly punctuation; not necessarily strictly
! alphabetic characters. To "redact" a word or partial word, replace each
! character in the redaction target with a capital letter 'X'. There
! should be the same number of graphemes in the final redacted word as
! there were in the non-redacted word.
! 
! Task
! 
! Write a procedure to "redact" a given piece of text. Your procedure
! should take the text (or a link to it), the redaction target (or a link
! to it) and the redaction options. It need not be a single routine, as
! long as there is some way to programmatically select which operation
! will be performed. It may be invoked from a command line or as an
! internal routine, but it should be separately invokable, not just a hard
! coded block.
! 
! The given strings are enclosed in square brackets to denote them. The
! brackets should not be counted as part of the strings.
! 
! Using the test string: [Tom? Toms bottom tomato is in his stomach while
! playing the "Tom-tom" brand tom-toms. That's so tom.]
! 
! Show the redacted sentence for each of the redaction target strings
! [Tom] & [tom] using the following options:
! 
! -   -   Whole word
!     -   Whole word, Case insensitive
!     -   Partial word
!     -   Partial word, Case insensitive
!     -   Partial word, Overkill
!     -   Partial word, Case insensitive, Overkill
! 
! Note that some combinations don't, or at least, shouldn't really differ
! from less specific combination. E.G. "Whole word, Overkill" should be
! theoretically be exactly the same as "Whole word".
! 
! Extra kudos for not including adjoining punctuation during "Overkill"
! redaction.
! 
! Extra kudos if the redaction target can contain non-letter characters.
! 
! The demo strings use the abbreviations w/p for whole/partial word, i/s
! for case insensitive/sensitive, n/o for normal/overkill. You are not
! required to use those, or any abbreviation. They are just for display,
! though may be useful to show what operation you are intending to
! perform.
! 
! Ideal expected output (adjoining punctuation untouched):
! 
!    Redact 'Tom':
!    [w|s|n] XXX? Toms bottom tomato is in his stomach while playing the "Tom-tom" brand tom-toms. That's so tom.
!    [w|i|n] XXX? Toms bottom tomato is in his stomach while playing the "Tom-tom" brand tom-toms. That's so XXX.
!    [p|s|n] XXX? XXXs bottom tomato is in his stomach while playing the "XXX-tom" brand tom-toms. That's so tom.
!    [p|i|n] XXX? XXXs botXXX XXXato is in his sXXXach while playing the "XXX-XXX" brand XXX-XXXs. That's so XXX.
!    [p|s|o] XXX? XXXX bottom tomato is in his stomach while playing the "XXXXXXX" brand tom-toms. That's so tom.
!    [p|i|o] XXX? XXXX XXXXXX XXXXXX is in his XXXXXXX while playing the "XXXXXXX" brand XXXXXXXX. That's so XXX.
! 
!    Redact 'tom':
!    [w|s|n] Tom? Toms bottom tomato is in his stomach while playing the "Tom-tom" brand tom-toms. That's so XXX.
!    [w|i|n] XXX? Toms bottom tomato is in his stomach while playing the "Tom-tom" brand tom-toms. That's so XXX.
!    [p|s|n] Tom? Toms botXXX XXXato is in his sXXXach while playing the "Tom-XXX" brand XXX-XXXs. That's so XXX.
!    [p|i|n] XXX? XXXs botXXX XXXato is in his sXXXach while playing the "XXX-XXX" brand XXX-XXXs. That's so XXX.
!    [p|s|o] Tom? Toms XXXXXX XXXXXX is in his XXXXXXX while playing the "XXXXXXX" brand XXXXXXXX. That's so XXX.
!    [p|i|o] XXX? XXXX XXXXXX XXXXXX is in his XXXXXXX while playing the "XXXXXXX" brand XXXXXXXX. That's so XXX.
! 
! Stretch
! 
! Complex Unicode: Using the test string: [🧑 👨 🧔 👨‍👩‍👦] and the redaction
! strings: [👨] and [👨‍👩‍👦]
! 
! Show the redacted strings when using the option "Whole word" (Case
! sensitivity shouldn't matter.) A single grapheme should be replaced by a
! single 'X'.
! 
!                   🧑 👨 🧔 👨‍👩‍👦
!    Redact '👨' [w] 🧑 X 🧔 👨‍👩‍👦
!    Redact '👨‍👩‍👦' [w] 🧑 👨 🧔 X


