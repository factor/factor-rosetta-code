! The purpose of this task is to demonstrate parsing of text-format IP
! addresses, using IPv4 and IPv6.
! 
! Taking the following as inputs:
! 
!     
! 
!         {| border="5" cellspacing="0" cellpadding=2
! 
! |- |127.0.0.1 |The "localhost" IPv4 address |- |127.0.0.1:80 |The
! "localhost" IPv4 address, with a specified port (80) |- |::1 |The
! "localhost" IPv6 address |- |[::1]:80 |The "localhost" IPv6 address,
! with a specified port (80) |- |2605:2700:0:3::4713:93e3 |Rosetta Code's
! primary server's public IPv6 address |- |[2605:2700:0:3::4713:93e3]:80
! |Rosetta Code's primary server's public IPv6 address, with a specified
! port (80) |}
! 
! Task:
! 
! Emit each described IP address as a hexadecimal integer representing the
! address, the address space, and the port number specified, if any.
! 
! In languages where variant result types are clumsy, the result should be
! ipv4 or ipv6 address number, something which says which address space
! was represented, port number and something that says if the port was
! specified.
! 
! Example:
! 
! 127.0.0.1 has the address number 7F000001 (2130706433 decimal) in the
! ipv4 address space.
! 
! ::ffff:127.0.0.1 represents the same address in the ipv6 address space
! where it has the address number FFFF7F000001 (281472812449793 decimal).
! 
! ::1 has address number 1 and serves the same purpose in the ipv6 address
! space that 127.0.0.1 serves in the ipv4 address space.


