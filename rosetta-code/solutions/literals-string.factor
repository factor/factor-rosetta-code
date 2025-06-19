! Task:
! 
! Show literal specification of characters and strings.
! 
! If supported, show how the following work:
! 
! -   -   verbatim strings (quotes where escape sequences are quoted
!         literally)
!     -   here-strings
! 
! Also, discuss which quotes expand variables.
! 
! Related tasks:
! 
! -   Special characters
! -   Here document
! 
! Category: String manipulation Category: Syntax elements

CHAR: a

CHAR: x                       ! 120
CHAR: \u000032                ! 50
CHAR: \u{exclamation-mark}    ! 33
CHAR: exclamation-mark        ! 33
CHAR: ugaritic-letter-samka   ! 66450

"Hello, world!"

"Hello, world!" { } like ! { 72 101 108 108 111 44 32 119 111 114 108 100 33 }

"Line one\nLine two" print

"\"Hello,\" she said." print

"2\u{superscript-two} = 4
2\u{superscript-three} = 8
2\u{superscript-four} = 16" print

USE: multiline
[[ escape codes \t are literal \\ in here
but newlines \u{plus-minus-sign} are still
inserted " for each line the string \" spans.]] print

USE: multiline
HEREDOC: END
Everything between the line above
         and the final line (a user-defined token)
      is parsed into a string where whitespace
  is         significant.
END
print

USE: multiline
STRING: random-stuff
ABC
123
    "x y z
;
random-stuff print

USING: interpolate locals namespaces ;

"Sally" "name" set
"bicycle"
"home"

[let

"crying" :> a

[I ${name} crashed her ${1}. Her ${1} broke.
${name} ran ${} ${a}.
I]

]
