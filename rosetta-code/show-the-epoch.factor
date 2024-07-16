! Task:
! 
! Choose popular date libraries used by your language and show the epoch
! those libraries use.
! 
! A demonstration is preferable (e.g. setting the internal representation
! of the date to 0 ms/ns/etc., or another way that will still show the
! epoch even if it is changed behind the scenes by the implementers), but
! text from (with links to) documentation is also acceptable where a
! demonstration is impossible/impractical.
! 
! For consistency's sake, show the date in UTC time where possible.
! 
! Related task:
! 
! -   Date format

USING: calendar calendar.format io ;

0 micros>timestamp timestamp>ymdhms print
