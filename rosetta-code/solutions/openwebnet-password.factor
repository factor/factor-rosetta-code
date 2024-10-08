! Calculate the password requested by ethernet gateways from the Legrand /
! Bticino MyHome OpenWebNet home automation system when the user's ip
! address is not in the gateway's whitelist
! 
! Note: Factory default password is '12345'. Changing it is highly
! recommended !
! 
! conversation goes as follows
! 
!     ← *#*1##
!     → *99*0##
!     ← *#603356072##
! 
! at which point a password should be sent back, calculated from the
! "password open" that is set in the gateway, and the nonce that was just
! sent
! 
!     → *#25280520##
!     ← *#*1##


