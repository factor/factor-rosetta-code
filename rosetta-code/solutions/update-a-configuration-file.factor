! We have a configuration file as follows:
! 
! # This is a configuration file in standard configuration file format
! #
! # Lines begininning with a hash or a semicolon are ignored by the application
! # program. Blank lines are also ignored by the application program.
! 
! # The first word on each non comment line is the configuration option.
! # Remaining words or numbers on the line are configuration parameter
! # data fields.
! 
! # Note that configuration option names are not case sensitive. However,
! # configuration parameter data is case sensitive and the lettercase must
! # be preserved.
! 
! # This is a favourite fruit
! FAVOURITEFRUIT banana
! 
! # This is a boolean that should be set
! NEEDSPEELING
! 
! # This boolean is commented out
! ; SEEDSREMOVED
! 
! # How many bananas we have
! NUMBEROFBANANAS 48
! 
! The task is to manipulate the configuration file as follows:
! 
! -   Disable the needspeeling option (using a semicolon prefix)
! -   Enable the seedsremoved option by removing the semicolon and any
!     leading whitespace
! -   Change the numberofbananas parameter to 1024
! -   Enable (or create if it does not exist in the file) a parameter for
!     numberofstrawberries with a value of 62000
! 
! Note that configuration option names are not case sensitive. This means
! that changes should be effected, regardless of the case.
! 
! Options should always be disabled by prefixing them with a semicolon.
! 
! Lines beginning with hash symbols should not be manipulated and left
! unchanged in the revised file.
! 
! If a configuration option does not exist within the file (in either
! enabled or disabled form), it should be added during this update.
! Duplicate configuration option names in the file should be removed,
! leaving just the first entry.
! 
! For the purpose of this task, the revised file should contain
! appropriate entries, whether enabled or not for
! needspeeling,seedsremoved,numberofbananas and numberofstrawberries.)
! 
! The update should rewrite configuration option names in capital letters.
! However lines beginning with hashes and any parameter data must not be
! altered (eg the banana for favourite fruit must not become capitalized).
! The update process should also replace double semicolon prefixes with
! just a single semicolon (unless it is uncommenting the option, in which
! case it should remove all leading semicolons).
! 
! Any lines beginning with a semicolon or groups of semicolons, but no
! following option should be removed, as should any leading or trailing
! whitespace on the lines. Whitespace between the option and parameters
! should consist only of a single space, and any non-ASCII extended
! characters, tabs characters, or control codes (other than end of line
! markers), should also be removed.
! 
! Related tasks
! 
! -   Read a configuration file


