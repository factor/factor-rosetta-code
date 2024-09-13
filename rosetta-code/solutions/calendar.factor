! Create a routine that will generate a text calendar for any year. Test
! the calendar by generating a calendar for the year 1969, on a device of
! the time. Choose one of the following devices:
! 
! -   A line printer with a width of 132 characters.
! -   An IBM 3278 model 4 terminal (80×43 display with accented
!     characters). Target formatting the months of the year to fit nicely
!     across the 80 character width screen. Restrict number of lines in
!     test output to 43.
! 
! (Ideally, the program will generate well-formatted calendars for any
! page width from 20 characters up.)
! 
! Kudos (κῦδος) for routines that also transition from Julian to Gregorian
! calendar.
! 
! This task is inspired by Real Programmers Don't Use PASCAL by Ed Post,
! Datamation, volume 29 number 7, July 1983.
! 
! THE REAL PROGRAMMER'S NATURAL HABITAT
! "Taped to the wall is a line-printer Snoopy calender for the year 1969."
! 
! For further Kudos see task CALENDAR, where all code is to be in
! UPPERCASE.
! 
! For economy of size, do not actually include Snoopy generation in either
! the code or the output, instead just output a place-holder.
! 
! Related task:
! 
! -   -   Five weekends
! 
! Category:Scala examples needing attention

USING: arrays calendar.format grouping io.streams.string kernel
math.ranges prettyprint sequences sequences.interleaved ;
IN: rosetta-code.calendar

: calendar ( year -- )
    12 [1,b] [ 2array [ month. ] with-string-writer ] with map
    3 <groups> [ "   " <interleaved> ] map 5 " " <repetition>
    <interleaved> simple-table. ;

: calendar-demo ( -- ) 1969 calendar ;

MAIN: calendar-demo
