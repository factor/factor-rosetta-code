! When entering text on a phone's digital pad it is possible that a
! particular combination of digits corresponds to more than one word. Such
! are called textonyms.
! 
! Assuming the digit keys are mapped to letters as follows:
! 
!     2 -> ABC
!     3 -> DEF
!     4 -> GHI
!     5 -> JKL
!     6 -> MNO
!     7 -> PQRS
!     8 -> TUV
!     9 -> WXYZ  
! 
! Task:
! 
! Write a program that finds textonyms in a list of words such as
! Textonyms/wordlist or unixdict.txt.
! 
! The task should produce a report:
! 
! There are #{0} words in #{1} which can be represented by the digit key mapping.
! They require #{2} digit combinations to represent them.
! #{3} digit combinations represent Textonyms.
! 
! Where:
! 
! #{0} is the number of words in the list which can be represented by the digit key mapping.
! #{1} is the URL of the wordlist being used.
! #{2} is the number of digit combinations required to represent the words in #{0}.
! #{3} is the number of #{2} which represent more than one word.
! 
! At your discretion show a couple of examples of your solution displaying
! Textonyms.
! 
! E.G.:
! 
!  2748424767 -> "Briticisms", "criticisms"
! 
! Extra credit:
! 
! Use a word list and keypad mapping other than English.

USING: assocs assocs.extras interpolate io io.encodings.utf8
io.files kernel literals math math.parser prettyprint sequences
unicode ;

<< CONSTANT: src "unixdict.txt" >>

CONSTANT: words
    $[ src utf8 file-lines [ [ letter? ] all? ] filter ]

CONSTANT: digits "22233344455566677778889999"

: >phone ( str -- n )
    [ CHAR: a - digits nth ] map string>number ;

: textonyms ( seq -- assoc )
    [ [ >phone ] keep ] map>alist expand-keys-push-at ;

: #textonyms ( assoc -- n )
    [ nip length 1 > ] assoc-filter assoc-size ;

words length src words textonyms [ assoc-size ] keep #textonyms

[I There are ${} words in ${} which can be represented by the digit key mapping.
They require ${} digit combinations to represent them.
${} digit combinations represent Textonyms.I] nl nl

"7325 -> " write words textonyms 7325 of .
