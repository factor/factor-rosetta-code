! Task:
! 
! Load the entire contents of some text file as a single string variable.
! 
! If applicable, discuss: encoding selection, the possibility of
! memory-mapping.
! 
! Of course, in practice one should avoid reading an entire file at once
! if the file is large and the task can be accomplished incrementally
! instead (in which case check File IO); this is for those cases where
! having the entire file is actually what is wanted.

USING: io.encodings.ascii io.encodings.binary io.files ;

! to read entire file as binary
"foo.txt" binary file-contents

! to read entire file as lines of text
"foo.txt" ascii file-lines
