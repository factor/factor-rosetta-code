! Task:
! 
! Implement a function or program that, given a range of IPv4 addresses in
! CIDR notation (dotted-decimal/network-bits), will return/output the same
! range in canonical form.
! 
! That is, the IP address portion of the output CIDR block must not
! contain any set (1) bits in the host part of the address.
! 
! Example:
! 
! Given 87.70.141.1/22, your code should output 87.70.140.0/22
! 
! Explanation:
! 
! An Internet Protocol version 4 address is a 32-bit value, conventionally
! represented as a number in base 256 using dotted-decimal notation, where
! each base-256 digit is given in decimal and the digits are separated by
! periods. Logically, this 32-bit value represents two components: the
! leftmost (most-significant) bits determine the network portion of the
! address, while the rightmost (least-significant) bits determine the host
! portion. Classless Internet Domain Routing block notation indicates
! where the boundary between these two components is for a given address
! by adding a slash followed by the number of bits in the network portion.
! 
! In general, CIDR blocks stand in for the entire set of IP addresses
! sharing the same network component, so it's common to see access control
! lists that specify individual IP addresses using /32 to indicate that
! only the one address is included. Software accepting this notation as
! input often expects it to be entered in canonical form, in which the
! host bits are all zeroes. But network admins sometimes skip this step
! and just enter the address of a specific host on the subnet with the
! network size, resulting in a non-canonical entry.
! 
! The example address, 87.70.141.1/22, represents binary
! 0101011101000110100011 / 0100000001, with the / indicating the
! network/host division. To canonicalize, clear all the bits to the right
! of the / and convert back to dotted decimal: 0101011101000110100011 /
! 0000000000 → 87.70.140.0.
! 
! More examples for testing
! 
!             36.18.154.103/12    →  36.16.0.0/12
!             62.62.197.11/29     →  62.62.197.8/29
!             67.137.119.181/4    →  64.0.0.0/4
!             161.214.74.21/24    →  161.214.74.0/24
!             184.232.176.184/18  →  184.232.128.0/18

USING: command-line formatting grouping io kernel math.parser
namespaces prettyprint sequences splitting ;
IN: rosetta-code.canonicalize-cidr

! canonicalize a CIDR block: make sure none of the host bits are set
command-line get [ lines ] when-empty
[
    ! ( CIDR-IP -- bits-in-network-part dotted-decimal )
    "/" split first2 string>number swap

    ! get IP as binary string
    "." split [ string>number "%08b" sprintf ] map "" join

    ! replace the host part with all zeros
    over cut length [ CHAR: 0 ] "" replicate-as append

    ! convert back to dotted-decimal
    8 group [ bin> number>string ] map "." join swap

    ! and output
    "%s/%d\n" printf
] each
