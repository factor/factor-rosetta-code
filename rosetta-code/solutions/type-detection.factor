! This draft task needs a purpose, a description and some way to tell
! whether examples satisfy or do not satisfy it.
! 
! Task
! 
!   
! 
! Show a function/procedure that processes a block of text by printing it.
! 
! The function takes one parameter (ideally) that describes the text.
! 
! Demonstrate by calling the function twice, each time passing in a
! different type.
! 
! This can be done with pattern matching, multi-methods, dynamic type
! detection, structure(s) with a tag, etc.
! 
! The objective is write a [e.g. library] function that processes text
! from multiple sources (such as a string/char *, socket, file, etc).
! 
! If not practical, show how the caller would coerce a type that can be
! passed to the library function.

USING: arrays formatting io kernel math prettyprint sequences
strings ;
IN: rosetta-code.type-detection

GENERIC: myprint ( object -- )

M: object myprint drop "I don't know how to print this." print ;
M: string myprint "I'm a string: \"%s\"\n" printf ;
M: fixnum myprint "I'm a fixnum: " write . ;
M: array  myprint "I'm an array: { " write
    [ pprint bl ] each "}" print ;
    
"Hello world." myprint
{ 1 2 3 4 5 }  myprint
123            myprint
3.1415         myprint
