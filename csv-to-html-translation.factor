! Consider a simplified CSV format where all rows are separated by a
! newline and all columns are separated by commas.
! 
! No commas are allowed as field data, but the data may contain other
! characters and character sequences that would normally be escaped when
! converted to HTML
! 
! Task:
! 
! Create a function that takes a string representation of the CSV data and
! returns a text string of an HTML table representing the CSV data.
! 
! Use the following data as the CSV text to convert, and show your output.
! 
!     Character,Speech
!     The multitude,The messiah! Show us the messiah!
!     Brians mother,<angry>Now you listen here! He's not the messiah; he's
!     a very naughty boy! Now go away!</angry>
!     The multitude,Who are you?
!     Brians mother,I'm his mother; that's who!
!     The multitude,Behold his mother! Behold his mother!
! 
! Extra credit:
! 
! Optionally allow special formatting for the first row of the table as if
! it is the tables header row (via <thead> preferably; CSS if you must).

USING: csv html.streams prettyprint xml.writer ;

"Character,Speech
The multitude,The messiah! Show us the messiah!
Brians mother,<angry>Now you listen here! He's not the messiah; he's a very naughty boy! Now go away!</angry>
The multitude,Who are you?
Brians mother,I'm his mother; that's who!
The multitude,Behold his mother! Behold his mother!"

string>csv [ simple-table. ] with-html-writer pprint-xml
