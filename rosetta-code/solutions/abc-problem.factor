! You are given a collection of ABC blocks (maybe like the ones you had
! when you were a kid).
! 
! There are twenty blocks with two letters on each block.
! 
! A complete alphabet is guaranteed amongst all sides of the blocks.
! 
! The sample collection of blocks:
! 
!  (B O)
!  (X K)
!  (D Q)
!  (C P)
!  (N A)
!  (G T)
!  (R E)
!  (T G)
!  (Q D)
!  (F S)
!  (J W)
!  (H U)
!  (V I)
!  (A N)
!  (O B)
!  (E R)
!  (F S)
!  (L Y)
!  (P C)
!  (Z M)
! 
! Task:
! 
! Write a function that takes a string (word) and determines whether the
! word can be spelled with the given collection of blocks.
! 
! The rules are simple:
! 
! ::# Once a letter on a block is used that block cannot be used again
! 
! ::# The function should be case-insensitive
! 
! ::# Show the output on this page for the following 7 words in the
! following example
! 
! Example:
! 
!         >>> can_make_word("A")
!         True
!         >>> can_make_word("BARK")
!         True
!         >>> can_make_word("BOOK")
!         False
!         >>> can_make_word("TREAT")
!         True
!         >>> can_make_word("COMMON")
!         False
!         >>> can_make_word("SQUAD")
!         True
!         >>> can_make_word("CONFUSE")
!         True

USING: assocs combinators.short-circuit formatting grouping io
kernel math math.statistics qw sequences sets unicode ;
IN: rosetta-code.abc-problem

! === CONSTANTS ================================================

CONSTANT: blocks qw{
    BO XK DQ CP NA GT RE TG QD FS JW HU VI AN OB ER FS LY PC ZM
}

CONSTANT: input qw{ A BARK BOOK TREAT COMMON SQUAD CONFUSE }

! === PROGRAM LOGIC ============================================

: pare ( str -- seq )
    [ blocks ] dip [ intersects? ] curry filter ;

: enough-blocks? ( str -- ? ) dup pare [ length ] bi@ <= ;

: enough-letters? ( str -- ? )
    [ blocks concat ] dip dup [ within ] dip
    [ histogram values ] bi@ [ - ] 2map [ neg? ] any? not ;

: can-make-word? ( str -- ? )
    >upper { [ enough-blocks? ] [ enough-letters? ] } 1&& ;

! === OUTPUT ===================================================

: show-blocks ( -- )
    "Available blocks:" print blocks [ 1 cut "(%s %s)" sprintf ]
    map 5 group [ [ write bl ] each nl ] each nl ;

: header ( -- )
    "Word" "Can make word from blocks?" "%-7s %s\n" printf
    "======= ==========================" print ;

: result ( str -- )
    dup can-make-word? "Yes" "No" ? "%-7s %s\n" printf ;

! === MAIN =====================================================

: abc-problem ( -- )
    show-blocks header input [ result ] each ;

MAIN: abc-problem
