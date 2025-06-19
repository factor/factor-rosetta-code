! Task
! 
! Showcase an instruction or function built into the language, that is
! made redundant by another instruction also built into the language. It
! can be limited to a specific way that function is used, e.g. printing a
! null string, but try not to make it that obvious.
! 
! NOP and any instructions or functions that are intended to do nothing do
! not count.

dupd reach

[ ] keepdd [ [ ] [ ] bi ] 2dip

[let :> ( a b c ) a b b c a ]

SYMBOLS: a b c ;
c set b set a set a get b get b get c get a get

shuffle( a b c -- a b b c a )
