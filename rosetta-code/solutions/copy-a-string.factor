! This task is about copying a string.
! 
! Task:
! 
! Where it is relevant, distinguish between copying the contents of a
! string versus making an additional reference to an existing string.
! 
! Category: String manipulation Category:Simple Category:Strings

"This is a mutable string." dup ! reference
"Let's make a deal!" dup clone  ! copy
"New" " string" append .               ! new string
    "New string"
