! Take a string and repeat it some number of times.
! 
! Example: repeat("ha", 5) => "hahahahaha"
! 
! If there is a simpler/more efficient way to repeat a single “character”
! (i.e. creating a string filled with a certain character), you might want
! to show that as well (i.e. repeat-char("*", 5) => "*****").

: repeat-string ( str n -- str' ) swap <repetition> concat ;

"ha" 5 repeat-string print
