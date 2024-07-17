! Create an HTML table.
! 
! -   The table body should have at least three rows of three columns.
! -   Each of these three columns should be labelled "X", "Y", and "Z".
! -   An extra column should be added at either the extreme left or the
!     extreme right of the table that has no heading, but is filled with
!     sequential row numbers.
! -   The rows of the "X", "Y", and "Z" columns should be filled with
!     random or sequential integers having 4 digits or less.
! -   The numbers should be aligned in the same fashion for all columns.

USING: html.streams literals prettyprint random xml.writer ;

: rnd ( -- n ) 10,000 random ;

{
     { "" "X" "Y" "Z" }
    ${ 1  rnd rnd rnd }
    ${ 2  rnd rnd rnd }
    ${ 3  rnd rnd rnd }
}
[ simple-table. ] with-html-writer pprint-xml
