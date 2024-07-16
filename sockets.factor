! For this exercise a program is open a socket to localhost on port 256
! and send the message "hello socket world" before closing the socket.
! 
! Catching any exceptions or errors is not required.

"localhost" 256 <inet> utf8 [ "hello socket world" print ] with-client
