! Task:
! 
! Display a finite linear combination in an infinite vector basis
! (e₁, e₂, …).
! 
! Write a function that, when given a finite list of scalars (α¹, α², …),
! creates a string representing the linear combination ∑_(i)α^(i)e_(i) in
! an explicit format often used in mathematics, that is:
! 
!     α^(i₁)e_(i₁) ± |α^(i₂)|e_(i₂) ± |α^(i₃)|e_(i₃) ± …
! 
! where α^(i_(k)) ≠ 0
! 
! The output must comply to the following rules:
! 
! -   don't show null terms, unless the whole combination is null.
! 
!         e(1) is fine, e(1) + 0*e(3) or e(1) + 0 is wrong.
! 
! -   don't show scalars when they are equal to one or minus one.
! 
!         e(3) is fine, 1*e(3) is wrong.
! 
! -   don't prefix by a minus sign if it follows a preceding term. Instead
!     you use subtraction.
! 
!         e(4) - e(5) is fine, e(4) + -e(5) is wrong.
! 
! Show here output for the following lists of scalars:
! 
!      1)    1,  2,  3
!      2)    0,  1,  2,  3
!      3)    1,  0,  3,  4
!      4)    1,  2,  0
!      5)    0,  0,  0
!      6)    0
!      7)    1,  1,  1
!      8)   -1, -1, -1
!      9)   -1, -2,  0, -3
!     10)   -1

USING: formatting kernel match math pair-rocket regexp sequences ;

MATCH-VARS: ?a ?b ;

: choose-term ( coeff i -- str )
    1 + { } 2sequence {
        {  0  _ } => [       ""                 ]
        {  1 ?a } => [ ?a    "e(%d)"    sprintf ]
        { -1 ?a } => [ ?a    "-e(%d)"   sprintf ]
        { ?a ?b } => [ ?a ?b "%d*e(%d)" sprintf ]
    } match-cond ;
    
: linear-combo ( seq -- str )
    [ choose-term ] map-index harvest " + " join
    R/ \+ -/ "- " re-replace [ "0" ] when-empty ;
    
{ { 1 2 3 } { 0 1 2 3 } { 1 0 3 4 } { 1 2 0 } { 0 0 0 } { 0 }
  { 1 1 1 } { -1 -1 -1 } { -1 -2 0 -3 } { -1 } }
[ dup linear-combo "%-14u  ->  %s\n" printf ] each
