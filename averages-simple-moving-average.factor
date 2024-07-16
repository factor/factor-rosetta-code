! Computing the simple moving average of a series of numbers.
! 
! Task
! 
! Create a stateful function/class/instance that takes a period and
! returns a routine that takes a number as argument and returns a simple
! moving average of its arguments so far.
! 
! A simple moving average is a method for computing an average of a stream
! of numbers by only averaging the last P numbers from the stream, where P
! is known as the period.
! 
! It can be implemented by calling an initialing routine with P as its
! argument, I(P), which should then return a routine that when called with
! individual, successive members of a stream of numbers, computes the mean
! of (up to), the last P of them, lets call this SMA().
! 
! The word stateful in the task description refers to the need for SMA()
! to remember certain information between calls to it:
! 
! -   The period, P
! -   An ordered container of at least the last P numbers from each of its
!     individual calls.
! 
! Stateful also means that successive calls to I(), the initializer,
! should return separate routines that do not share saved state so they
! could be used on two independent streams of data.
! 
! Pseudo-code for an implementation of SMA is:
! 
!     function SMA(number: N):
!         stateful integer: P
!         stateful list:    stream
!         number:           average
! 
!         stream.append_last(N)
!         if stream.length() > P:
!             # Only average the last P elements of the stream
!             stream.delete_first()
!         if stream.length() == 0:
!             average = 0
!         else:    
!             average = sum( stream.values() ) / stream.length()
!         return average

USING: kernel interpolate io locals math.statistics prettyprint
random sequences ;
IN: rosetta-code.simple-moving-avg

:: I ( P -- quot )
    V{ } clone :> v!
    [ v swap suffix! P short tail* v! ] ;

: sma-add ( quot n -- quot' ) swap tuck call( x x -- x ) ;

: sma-query ( quot -- avg v ) first concat dup mean swap ;

: simple-moving-average-demo ( -- )
    5 I 10 <iota> [
        over sma-query unparse
        [I After ${2} numbers Sequence is ${0} Mean is ${1}I] nl
        100 random sma-add
    ] each drop ;

MAIN: simple-moving-average-demo
