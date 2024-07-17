! Today (2020-02-02, at the time of this writing) happens to be a
! palindrome, without the hyphens, not only for those countries which
! express their dates in the yyyy-mm-dd format but, unusually, also for
! countries which use the dd-mm-yyyy format.
! 
! Task
! 
! Write a program which calculates and shows the next 15 palindromic dates
! for those countries which express their dates in the yyyy-mm-dd format.

USING: calendar calendar.format io kernel lists lists.lazy
sequences sets ;

: palindrome-dates ( -- list )
    2020 2 2 <date> [ 1 days time+ ] lfrom-by
    [ timestamp>ymd ] lmap-lazy
    [ "-" without dup reverse = ] lfilter ;

15 palindrome-dates ltake [ print ] leach
