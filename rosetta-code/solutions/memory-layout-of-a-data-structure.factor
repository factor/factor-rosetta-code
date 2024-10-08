! It is often useful to control the memory layout of fields in a data
! structure to match an interface control definition, or to interface with
! hardware. Define a data structure matching the RS-232 Plug Definition.
! Use the 9-pin definition for brevity.
! 
! Pin Settings for Plug
! (Reverse order for socket.)
! __________________________________________
! 1  2  3  4  5  6  7  8  9  10 11 12 13
!  14 15 16 17 18 19 20 21 22 23 24 25
! _________________
! 1  2  3  4  5
! 6  7  8  9
! 25 pin                        9 pin
! 1 - PG   Protective ground
! 2 - TD   Transmitted data     3
! 3 - RD   Received data        2
! 4 - RTS  Request to send      7
! 5 - CTS  Clear to send        8
! 6 - DSR  Data set ready       6
! 7 - SG   Signal ground        5
! 8 - CD   Carrier detect       1
! 9 - + voltage (testing)
! 10 - - voltage (testing)
! 11 -
! 12 - SCD  Secondary CD
! 13 - SCS  Secondary CTS
! 14 - STD  Secondary TD
! 15 - TC   Transmit clock
! 16 - SRD  Secondary RD
! 17 - RC   Receiver clock
! 18 -
! 19 - SRS  Secondary RTS            
! 20 - DTR  Data terminal ready      4
! 21 - SQD  Signal quality detector
! 22 - RI   Ring indicator           9
! 23 - DRS  Data rate select
! 24 - XTC  External clock
! 25 -


