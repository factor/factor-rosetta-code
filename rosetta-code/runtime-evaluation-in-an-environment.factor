! Given a program in the language (as a string or AST) with a free
! variable named x (or another name if that is not valid syntax), evaluate
! it with x bound to a provided value, then evaluate it again with x bound
! to another provided value, then subtract the result of the first from
! the second and return or print it.
! 
! Do so in a way which:
! 
! -   does not involve string manipulation of the input source code
! -   is plausibly extensible to a runtime-chosen set of bindings rather
!     than just x
! -   does not make x a global variable
! 
! or note that these are impossible.
! 
! See also:
! 
! -   For more general examples and language-specific details, see Eval.
! -   Dynamic variable names is a similar task.

IN: scratchpad 9 4 "x get dup *" eval-with-x .
65
IN: scratchpad x get .
f
