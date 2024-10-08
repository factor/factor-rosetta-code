!   ---------------------------------------
!   Display an outline as a nested table.
!   Parse the outline to a tree,
!   measuring the indent of each line,
!   |
!   ---------------------------------------
! 
! The graphic representation of outlines is a staple of mind-mapping and
! the planning of papers, reports, and speeches.
! 
! Task:
! 
! Given a outline with at least 3 levels of indentation, for example:
! 
!     Display an outline as a nested table.
!         Parse the outline to a tree,
!             measuring the indent of each line,
!             translating the indentation to a nested structure,
!             and padding the tree to even depth.
!         count the leaves descending from each node,
!             defining the width of a leaf as 1,
!             and the width of a parent node as a sum.
!                 (The sum of the widths of its children)
!         and write out a table with 'colspan' values
!             either as a wiki table,
!             or as HTML.
! 
! write a program in your language which translates your outline into a
! nested table, with WikiTable or HTML colspan values attached (where
! needed) to parent nodes in the nested table.
! 
! The WikiTable at the top of this page was generated from the indented
! outline shown above, producing the following markup string:
! 
!     {| class="wikitable" style="text-align: center;"
!     |-
!     | style="background: #ffffe6; " colspan=7 | Display an outline as a nested table.
!     |-
!     | style="background: #ffebd2; " colspan=3 | Parse the outline to a tree,
!     | style="background: #f0fff0; " colspan=2 | count the leaves descending from each node,
!     | style="background: #e6ffff; " colspan=2 | and write out a table with 'colspan' values
!     |-
!     | style="background: #ffebd2; " | measuring the indent of each line,
!     | style="background: #ffebd2; " | translating the indentation to a nested structure,
!     | style="background: #ffebd2; " | and padding the tree to even depth.
!     | style="background: #f0fff0; " | defining the width of a leaf as 1,
!     | style="background: #f0fff0; " | and the width of a parent node as a sum.
!     | style="background: #e6ffff; " | either as a wiki table,
!     | style="background: #e6ffff; " | or as HTML.
!     |-
!     |  | 
!     |  | 
!     |  | 
!     |  | 
!     | style="background: #f0fff0; " | (The sum of the widths of its children)
!     |  | 
!     |  | 
!     |}
! 
! Extra credit:
! 
! Use background color to distinguish the main stages of your outline, so
! that the subtree of each node at level two is consistently colored, and
! the edges between adjacent subtrees are immediately revealed.
! 
! Output:
! 
! Display your nested table on this page.


