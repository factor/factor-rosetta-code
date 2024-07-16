! Find the last 40 decimal digits of a^(b), where
! 
! -   -   a = 2988348162058574136915891421498819466320163312926952423791023078876139
!     -   b = 2351399303373464486466122544523690094744975233415544072992656881240319
! 
! A computer is too slow to find the entire value of a^(b).
! 
! Instead, the program must use a fast algorithm for modular
! exponentiation: a^(b) mod  m.
! 
! The algorithm must work for any integers a, b, m, where b ≥ 0 and m > 0.

! Built-in
2988348162058574136915891421498819466320163312926952423791023078876139
2351399303373464486466122544523690094744975233415544072992656881240319
10 40 ^
^mod .
