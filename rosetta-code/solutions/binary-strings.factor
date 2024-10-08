! Many languages have powerful and useful (binary safe) string
! manipulation functions, while others don't, making it harder for these
! languages to accomplish some tasks.
! 
! This task is about creating functions to handle binary strings (strings
! made of arbitrary bytes, i.e. byte strings according to Wikipedia) for
! those languages that don't have built-in support for them.
! 
! If your language of choice does have this built-in support, show a
! possible alternative implementation for the functions or abilities
! already provided by the language.
! 
! In particular the functions you need to create are:
! 
! -   String creation and destruction (when needed and if there's no
!     garbage collection or similar mechanism)
! -   String assignment
! -   String comparison
! -   String cloning and copying
! -   Check if a string is empty
! -   Append a byte to a string
! -   Extract a substring from a string
! -   Replace every occurrence of a byte (or a string) in a string with
!     another string
! -   Join strings
! 
! Possible contexts of use: compression algorithms (like LZW compression),
! L-systems (manipulation of symbols), many more.

"Hello, byte-array!" utf8 encode .
