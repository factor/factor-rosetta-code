! Background
! 
! This task is inspired by Mark Nelson's DDJ Column "Wordplay" and one of
! the weekly puzzle challenges from Will Shortz on NPR Weekend Edition 1
! and originally attributed to David Edelheit.
! 
! The challenge was to take the names of two U.S. States, mix them all
! together, then rearrange the letters to form the names of two different
! U.S. States (so that all four state names differ from one another).
! 
! What states are these?
! 
! The problem was reissued on the Unicon Discussion Web which includes
! several solutions with analysis. Several techniques may be helpful and
! you may wish to refer to Gödel numbering, equivalence relations, and
! equivalence classes. The basic merits of these were discussed in the
! Unicon Discussion Web.
! 
! A second challenge in the form of a set of fictitious new states was
! also presented.
! 
! Task:
! 
! Write a program to solve the challenge using both the original list of
! states and the fictitious list.
! 
! Caveats:
! 
! -   case and spacing aren't significant - just letters (harmonize case)
! -   don't expect the names to be in any order - such as being sorted
! -   don't rely on names to be unique (eliminate duplicates - meaning if
!     Iowa appears twice you can only use it once)
! 
! Comma separated list of state names used in the original puzzle:
! 
!         "Alabama",  "Alaska",  "Arizona",  "Arkansas",
!         "California",  "Colorado",  "Connecticut",  "Delaware",  
!         "Florida",  "Georgia",  "Hawaii",  "Idaho",  "Illinois",  
!         "Indiana",  "Iowa",  "Kansas",  "Kentucky",  "Louisiana",
!         "Maine",  "Maryland",  "Massachusetts",  "Michigan",
!         "Minnesota",  "Mississippi",  "Missouri",  "Montana",
!         "Nebraska",  "Nevada",  "New Hampshire",  "New Jersey",
!         "New Mexico",  "New York",  "North Carolina",  "North Dakota",
!         "Ohio",  "Oklahoma",  "Oregon",  "Pennsylvania",  "Rhode Island",
!         "South Carolina",  "South Dakota",  "Tennessee",  "Texas",
!         "Utah",  "Vermont",  "Virginia",
!         "Washington",  "West Virginia",  "Wisconsin",  "Wyoming"
! 
! Comma separated list of additional fictitious state names to be added to
! the original (Includes a duplicate):
! 
!     "New Kory",  "Wen Kory",  "York New",  "Kory New",  "New Kory"

