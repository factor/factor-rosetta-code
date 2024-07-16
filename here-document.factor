! A here document (or "heredoc") is a way of specifying a text block,
! preserving the line breaks, indentation and other whitespace within the
! text.
! 
! Depending on the language being used, a here document is constructed
! using a command followed by "<<" (or some other symbol) followed by a
! token string.
! 
! The text block will then start on the next line, and will be followed by
! the chosen token at the beginning of the following line, which is used
! to mark the end of the text block.
! 
! Task:
! 
! Demonstrate the use of here documents within the language.
! 
! Related task:
! 
! -   Documentation

"    a multiline
string\n(with escape sequences: \u{greek-capital-letter-sigma})
"
"""this is "easier".."""



HEREDOC: EOF
             this
 is not \n escaped at all
EOF
