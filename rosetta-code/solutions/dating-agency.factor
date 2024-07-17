! Scenario
! 
! A sailor signs up to a dating agency hoping to find a suitable mate.
! 
! The dating agency has 10 ladies on its books who may be suitable and
! uses the algorithm "all the nice girls love a sailor" to decide which
! ones to put forward for the sailor's consideration.
! 
! The sailor uses a different algorithm ("lady is lovable") to decide
! which ladies to actually date.
! 
! Task
! 
! Model this scenario in your language.
! 
! Give the sailor and ladies some names.
! 
! Use some arbitrary method based on the ladies' names to determine
! whether they're nice and/or lovable. For preference, choose a method
! where the outcomes are (more or less) equally likely.
! 
! Hence, determine which ladies the dating agency should suggest and which
! of these the sailor should offer to date.
! 
! Note
! 
! This task is intended as a bit of fun as well as a simple exercise in
! object modelling so hopefully it won't offend anyone!

USING: formatting io kernel math math.primes math.vectors
prettyprint qw sequences sets ;

CONSTANT: ladies qw{
    Abigail Emily Haley Leah Maru
    Penny Caroline Jodi Marnie Robin
}

CONSTANT: sailor "Willy"

: prime-root? ( n -- ? ) 1 - 9 mod 1 + prime? ;                    ! is the digital root prime?
: nice? ( lady sailor -- ? ) [ hashcode ] bi@ + prime-root? ;      ! a lady is nice if the sum of the hashcode of her name and the sailor's name has a prime digit root
: lovable? ( lady sailor -- ? ) vdot prime-root? ;                 ! a lady is lovable if the dot product of her name and the sailor's name has a prime digital root

: nice ( -- seq ) ladies [ sailor nice? ] filter ;
: lovable ( -- seq ) ladies [ sailor lovable? ] filter ;
: compatible ( -- seq ) nice lovable intersect ;
: ladies. ( seq -- ) ", " join print ;

"lady       nice?      lovable?" print
"------------------------------" print
ladies [
    dup sailor [ nice? ] [ lovable? ] bi-curry bi
    [ "yes" "no" ? ] bi@
    "%-10s %-10s %-10s\n" printf
] each nl

"Based on this analysis:" print nl
"The dating agency should suggest the following dates:" print
nice ladies. nl
sailor "And %s should offer to date these ones:\n" printf
lovable ladies. nl
sailor "But just between us, only the following ladies are compatible with %s:\n" printf
compatible ladies.
