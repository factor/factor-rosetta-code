! Show how to access private or protected members of a class in an
! object-oriented language from outside an instance of the class, without
! calling non-private or non-protected members of the class as a proxy.
! The intent is to show how a debugger, serializer, or other
! meta-programming tool might access information that is barred by normal
! access methods to the object but can nevertheless be accessed from
! within the language by some provided escape hatch or reflection
! mechanism. The intent is specifically not to demonstrate heroic measures
! such as peeking and poking raw memory.
! 
! Note that cheating on your type system is almost universally regarded as
! unidiomatic at best, and poor programming practice at worst.
! Nonetheless, if your language intentionally maintains a double-standard
! for OO privacy, here's where you can show it off.
! 
! Category:Object oriented

( scratchpad ) USING: sets sets.private ;
( scratchpad ) { 1 2 3 } { 1 2 4 } sequence/tester count .
2
