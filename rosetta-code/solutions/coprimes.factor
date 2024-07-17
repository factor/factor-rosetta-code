! Task:
! 
! p and q are coprimes if they have no common factors other than 1.
! 
! Given the input pairs: [21,15],[17,23],[36,12],[18,29],[60,15] display
! whether they are coprimes.

USING: io kernel math prettyprint sequences ;

: coprime? ( seq -- ? ) [ ] [ simple-gcd ] map-reduce 1 = ;

{
    { 21 15 }
    { 17 23 }
    { 36 12 }
    { 18 29 }
    { 60 15 }
    { 21 22 25 31 143 }
}
[ dup pprint coprime? [ " Coprime" write ] when nl ] each
