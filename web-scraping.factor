! Task:
! 
! Create a program that downloads the time from this URL:
! http://tycho.usno.navy.mil/cgi-bin/timer.pl and then prints the current
! UTC time by extracting just the UTC time from the web page's HTML.
! Alternatively, if the above url is not working, grab the first date/time
! off this page's talk page.
! 
! If possible, only use libraries that come at no extra monetary cost with
! the programming language and that are widely available and popular such
! as CPAN for Perl or Boost for C++.

USING: http.client io sequences ;

"http://tycho.usno.navy.mil/cgi-bin/timer.pl" http-get nip
[ "UTC" swap start [ 9 - ] [ 1 - ] bi ] keep subseq print
