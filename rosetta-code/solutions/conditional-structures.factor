! Task:
! 
! List the conditional structures offered by a programming language. See
! Wikipedia: conditionals for descriptions.
! 
! Common conditional structures include if-then-else and switch.
! 
! Less common are arithmetic if, ternary operator and Hash-based
! conditionals.
! 
! Arithmetic if allows tight control over computed gotos, which optimizers
! have a hard time to figure out.
! 
! Category:Simple Category:Flow control


t 1 2 ? ! returns 1


t [ 1 ] [ 2 ] if ! returns 1

{ { [ t ] [ 1 ] } { [ f ] [ 2 ] } } cond ! returns 1

t { { t [ 1 ] } { f [ 2 ] } } case ! returns 1

t [ "1" print ] when ! prints 1

f [ "1" print ] unless ! prints 1
