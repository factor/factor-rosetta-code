! Task:
! 
! Write and test a function over an indented plain text outline which
! either:
! 
! 1.  Returns a copy of the outline in which the sub-lists at every level
!     of indentation are sorted, or
! 2.  reports that the indentation characters or widths are not consistent
!     enough to make the outline structure clear.
! 
! Your code should detect and warn of at least two types of inconsistent
! indentation:
! 
! -   inconsistent use of whitespace characters (e.g. mixed use of tabs
!     and spaces)
! -   inconsistent indent widths. For example, an indentation with an odd
!     number of spaces in an outline in which the unit indent appears to
!     be 2 spaces, or 4 spaces.
! 
! Your code should be able to detect and handle both tab-indented, and
! space-indented (e.g. 4 space, 2 space etc) outlines, without being given
! any advance warning of the indent characters used, or the size of the
! indent units.
! 
! You should also be able to specify different types of sort, for example,
! as a minimum, both ascending and descending lexical sorts.
! 
! Your sort should not alter the type or size of the indentation units
! used in the input outline.
! 
! (For an application of Indent Respectful Sort, see the Sublime Text
! package of that name. The Python source text 1 is available for
! inspection on Github).
! 
! Tests
! 
! -   Sort every level of the (4 space indented) outline below lexically,
!     once ascending and once descending.
! 
!     zeta
!         beta
!         gamma
!             lambda
!             kappa
!             mu
!         delta
!     alpha
!         theta
!         iota
!         epsilon
! 
! -   Do the same with a tab-indented equivalent of the same outline.
! 
!     zeta
!         gamma
!             mu
!             lambda
!             kappa
!         delta
!         beta
!     alpha
!         theta
!         iota
!         epsilon
! 
! The output sequence of an ascending lexical sort of each level should
! be:
! 
!     alpha
!         epsilon
!         iota
!         theta
!     zeta
!         beta
!         delta
!         gamma
!             kappa
!             lambda
!             mu
! 
! The output sequence of a descending lexical sort of each level should
! be:
! 
!     zeta
!         gamma
!             mu
!             lambda
!             kappa
!         delta
!         beta
!     alpha
!         theta
!         iota
!         epsilon
! 
! -   Attempt to separately sort each of the following two outlines,
!     reporting any inconsistencies detected in their indentations by your
!     validation code.
! 
!     alpha
!         epsilon
!         iota
!         theta
!     zeta
!         beta
!         delta
!         gamma
!             kappa
!             lambda
!             mu
! 
!     zeta
!         beta
!        gamma
!             lambda
!              kappa
!             mu
!         delta
!     alpha
!         theta
!         iota
!         epsilon
! 
! Related tasks:
! 
! -   -   Functional_coverage_tree
!     -   Display_an_outline_as_a_nested_table


