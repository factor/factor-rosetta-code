! Task:
! 
! Invoke an object method where the name of the method to be invoked can
! be generated at run time.
! 
! Related tasks:
! 
! -   Respond to an unknown method call.
! -   Runtime evaluation

USING: accessors kernel math prettyprint sequences words ;
IN: rosetta-code.unknown-method-call

TUPLE: foo num ;
C: <foo> foo
GENERIC: add5 ( x -- y )
M: foo add5 num>> 5 + ;

42 <foo>              ! construct a foo
"add" "5" append      ! construct a word name
                      ! must specify vocab to look up a word
"rosetta-code.unknown-method-call"
lookup-word execute . ! 47
