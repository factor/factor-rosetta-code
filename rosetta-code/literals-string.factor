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
