! Brian Kernighan, in a lecture at the University of Nottingham, described
! a problem on which this task is based.
! 
! Problem:
! 
! You are given a a data file of thousands of lines; each of three
! `whitespace` separated fields: a date, a one word name and the magnitude
! of the event.
! 
! Example lines from the file would be lines like:
! 
!     8/27/1883    Krakatoa            8.8
!     5/18/1980    MountStHelens       7.6
!     3/13/2009    CostaRica           5.1
! 
! Task:
! 
! -   Create a program or script invocation to find all the events with
!     magnitude greater than 6
! -   Assuming an appropriate name e.g. "data.txt" for the file:
! 
! :# Either: Show how your program is invoked to process a data file of
! that name.
! 
! :# Or: Incorporate the file name into the program, (as it is assumed
! that the program is single use).

USING: io math math.parser prettyprint sequences splitting ;
IN: rosetta-code.kernighan

lines [ "\s" split last string>number 6 > ] filter .
