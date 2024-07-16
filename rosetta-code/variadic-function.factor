! Task:
! 
! Create a function which takes in a variable number of arguments and
! prints each one on its own line.
! 
! Also show, if possible in your language, how to call the function on a
! list of arguments constructed at runtime.
! 
! Functions of this type are also known as Variadic Functions.
! 
! Related task:
! 
! -   Call a function

IN: scratchpad "apple" "banana" "cucumber"

--- Data stack:
"apple"
"banana"
"cucumber"

IN: scratchpad 2 variadic-print
cucumber
banana

--- Data stack:
"apple"
