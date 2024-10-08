! Task:
! 
! Define two associative arrays, where one represents the following "base"
! data:
! 
!     
! 
!         {| class="wikitable"
! 
! |+ | Key || Value |- | "name" || "Rocket Skates" |- | "price" || 12.75
! |- | "color" || "yellow" |}
! 
! And the other represents "update" data:
! 
!     
! 
!         {| class="wikitable"
! 
! |+ | Key || Value |- | "price" || 15.25 |- | "color" || "red" |- |
! "year" || 1974 |}
! 
! Merge these into a new associative array that contains every key found
! in either of the source ones. Each key should map to the value in the
! second (update) table if that exists, or else to the value in the first
! (base) table. If possible, do this in a way that does not mutate the
! original two associative arrays. Obviously this should be done in a way
! that would work for any data, not just the specific data given here, but
! in this example the result should be:
! 
!     
! 
!         {| class="wikitable"
! 
! |+ | Key || Value |- | "name" || "Rocket Skates" |- | "price" || 15.25
! |- | "color" || "red" |- | "year" || 1974 |}

USING: assocs prettyprint ;

{ { "name" "Rocket Skates" } { "price" 12.75 } { "color" "yellow" } }
{ { "price" 15.25 } { "color" "red" } { "year" 1974 } }
assoc-union .
