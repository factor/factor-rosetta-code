! "Never trust user input." If the Super Mario Bros. 3 Wrong Warp or Bobby
! Tables have taught programmers anything, it's that user input can be
! dangerous in unexpected ways.
! 
! In general, the task of preventing errors such as the above are best
! left to the built-in security features of the language rather than a
! filter of your own creation. This exercise is to test your ability to
! think about all the possible ways user input could break your program.
! 
! Task:
! 
! Create a function that takes a list of 20 first and last names, and
! copies them to a record or struct. Ten of them must be typical input,
! (i.e. consist of only letters of the alphabet and punctuation), but the
! other ten must be deliberately chosen to cause problems with a program
! that expects only letters and punctuation. A few examples:
! 
! -   ASCII control codes such as NUL, CR, LF
! -   Code for the language you are using that can result in damage (e.g.
!     -rm -rf, delete System32, DROP TABLE, etc.)
! -   Numbers, symbols, foreign languages, emojis, etc.
! 
! (There were already solutions provided before the requirement that ten
! names are "normal" and ten are potentially harmful was added. Those
! answers satisfied the task requirements at the time they were
! submitted.)
! 
! Related tasks
! 
! -   Parametrized SQL statement


