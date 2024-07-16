! Print the word size and endianness of the host machine.
! 
! See also: Variable size/Get

USING: alien.c-types alien.data io layouts ;
"Word size: " write cell 8 * .
"Endianness: " write little-endian? "little" "big" ? print
