! Task:
! 
! Summary: Find and print the mentions of a given string in the recent
! chat logs from a chatroom. Only use your programming language's standard
! library.
! 
! Details:
! 
! The Tcl Chatroom is an online chatroom. Its conversations are logged.
! It's useful to know if someone has mentioned you or your project in the
! chatroom recently. You can find this out by searching the chat logs. The
! logs are publicly available at http://tclers.tk/conferences/tcl/. One
! log file corresponds to the messages from one day in Germany's current
! time zone. Each chat log file has the name YYYY-MM-DD.tcl where YYYY is
! the year, MM is the month and DD the day. The logs store one message per
! line. The messages themselves are human-readable and their internal
! structure doesn't matter.
! 
! Retrieve the chat logs from the last 10 days via HTTP. Find the lines
! that include a particular substring and print them in the following
! format:
! 
!     <log file URL>
!     ------
!     <matching line 1>
!     <matching line 2>
!     ...
!     <matching line N>
!     ------
! 
! The substring will be given to your program as a command line argument.
! 
! You need to account for the possible time zone difference between the
! client running your program and the chat log writer on the server to not
! miss any mentions. (For example, if you generated the log file URLs
! naively based on the local date, you could miss mentions if it was
! already April 5th for the logger but only April 4th for the client.)
! What this means in practice is that you should either generate the URLs
! in the time zone Europe/Berlin or, if your language can not do that, add
! an extra day (today + 1) to the range of dates you check, but then make
! sure to not print parts of a "not found" page by accident if a log file
! doesn't exist yet.
! 
! The code should be contained in a single-file script, with no "project"
! or "dependency" file (e.g., no requirements.txt for Python). It should
! only use a given programming language's standard library to accomplish
! this task and not rely on the user having installed any third-party
! packages.
! 
! If your language does not have an HTTP client in the standard library,
! you can speak raw HTTP 1.0 to the server. If it can't parse command line
! arguments in a standalone script, read the string to look for from the
! standard input.
! 
! Category:Date and time Category:Networking and Web Interaction
! Category:Text processing


