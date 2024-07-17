! Given a stream of characters containing the separator characters
! "formfeed", "linefeed", "tab" and "space", print out the i^(th)
! character of the i^(th) tab-field of the i^(th) line of the i^(th) page
! to reveal a secret password.
! 
! Stop processing immediately upon encountering a "!" found uniquely in
! this i,i,i,i position (lest the system self-destruct). The "!" may be
! found elsewhere however, in which case it should be ignored.
! 
! Ideally this can be generalised as follows:
! 
! -   The separator characters are defined by a user-supplied array that
!     can include additional or alternative separators, e.g. (formfeed,
!     linefeed, ".", "," ," ",...).
! -   The selection criterion is generalised i^(th),i^(th),i^(th),i^(th)
!     to a boolean function of f(page,line,field,word,...) or
!     f(i^(th),j^(th),k^(th),l^(th),m^(th),etc...)
! 
! Provide a reasonably interesting message to be decoded, e.g.
! "Silence-Dogood". Your choice.
! 
! This task was inspired by the movie "National Treasure", which refers to
! a "book cipher".


