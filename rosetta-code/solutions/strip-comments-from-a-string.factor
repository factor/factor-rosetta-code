! The task is to remove text that follow any of a set of comment markers,
! (in these examples either a hash or a semicolon) from a string or input
! line.
! 
! Whitespace debacle: There is some confusion about whether to remove any
! whitespace from the input line.
! 
! As of 2 September 2011, at least 8 languages (C, C++, Java, Perl,
! Python, Ruby, sed, UNIX Shell) were incorrect, out of 36 total
! languages, because they did not trim whitespace by 29 March 2011 rules.
! Some other languages might be incorrect for the same reason.
! 
! Please discuss this issue at {{TALKPAGENAME}}.
! 
! -   From 29 March 2011, this task required that: "The comment marker and
!     any whitespace at the beginning or ends of the resultant line should
!     be removed. A line without comments should be trimmed of any leading
!     or trailing whitespace before being produced as a result." The task
!     had 28 languages, which did not all meet this new requirement.
! -   From 28 March 2011, this task required that: "Whitespace before the
!     comment marker should be removed."
! -   From 30 October 2010, this task did not specify whether or not to
!     remove whitespace.
! 
! The following examples will be truncated to either "apples, pears " or
! "apples, pears".
! 
! (This example has flipped between "apples, pears " and "apples, pears"
! in the past.)
! 
!     apples, pears # and bananas
!     apples, pears ; and bananas
! 
! Category:String manipulation

USE: sequences.extras
: strip-comments ( str -- str' )
    [ "#;" member? not ] take-while "" like ;
