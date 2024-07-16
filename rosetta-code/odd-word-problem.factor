! Task:
! 
! Write a program that solves the odd word problem with the restrictions
! given below.
! 
! Description:
! 
! You are promised an input stream consisting of English letters and
! punctuations.
! 
! It is guaranteed that:
! 
! -   the words (sequence of consecutive letters) are delimited by one and
!     only one punctuation,
! -   the stream will begin with a word,
! -   the words will be at least one letter long, and
! -   a full stop (a period, [.]) appears after, and only after, the last
!     word.
! 
! Example:
! 
! A stream with six words:
! 
!         what,is,the;meaning,of:life.
! 
! The task is to reverse the letters in every other word while leaving
! punctuations intact, producing:
! 
!         what,si,the;gninaem,of:efil.
! 
! while observing the following restrictions:
! 
! 1.  Only I/O allowed is reading or writing one character at a time,
!     which means: no reading in a string, no peeking ahead, no pushing
!     characters back into the stream, and no storing characters in a
!     global variable for later use;
! 2.  You are not to explicitly save characters in a collection data
!     structure, such as arrays, strings, hash tables, etc, for later
!     reversal;
! 3.  You are allowed to use recursions, closures, continuations, threads,
!     co-routines, etc., even if their use implies the storage of multiple
!     characters.
! 
! Test cases:
! 
! Work on both the "life" example given above, and also the text:
! 
!         we,are;not,in,kansas;any,more.

USING: continuations kernel io io.streams.string locals unicode.categories ;
IN: rosetta.odd-word

<PRIVATE
! Save current continuation.
: savecc ( -- continuation/f )
    [ ] callcc1 ; inline

! Jump back to continuation, where savecc will return f.
: jump-back ( continuation -- )
    f swap continue-with ; inline
PRIVATE>

:: read-odd-word ( -- )
    f :> first-continuation!
    f :> last-continuation!
    f :> reverse!
    ! Read characters. Loop until end of stream.
    [ read1 dup ] [
        dup Letter? [
            ! This character is a letter.
            reverse [
                ! Odd word: Write letters in reverse order.
                last-continuation savecc dup [
                    last-continuation!
                    2drop       ! Drop letter and previous continuation.
                ] [
                    ! After jump: print letters in reverse.
                    drop                ! Drop f.
                    swap write1         ! Write letter.
                    jump-back           ! Follow chain of continuations.
                ] if
            ] [
                ! Even word: Write letters immediately.
                write1
            ] if
        ] [
            ! This character is punctuation.
            reverse [
                ! End odd word. Fix trampoline, follow chain of continuations
                ! (to print letters in reverse), then bounce off trampoline.
                savecc dup [
                    first-continuation!
                    last-continuation jump-back
                ] [ drop ] if
                write1                  ! Write punctuation.
                f reverse!              ! Begin even word.
            ] [
                write1                  ! Write punctuation.
                t reverse!              ! Begin odd word.
                ! Create trampoline to bounce to (future) first-continuation.
                savecc dup [
                    last-continuation!
                ] [ drop first-continuation jump-back ] if
            ] if
        ] if
    ] while
    ! Drop f from read1. Then print a cosmetic newline.
    drop nl ;

: odd-word ( string -- )
    [ read-odd-word ] with-string-reader ;
