! DNS is an internet service that maps domain names, like rosettacode.org,
! to IP addresses, like 66.220.0.231.
! 
! Use DNS to resolve www.kame.net to both IPv4 and IPv6 addresses. Print
! these addresses.

USING: dns io kernel sequences ;

"www.kame.net" [ dns-A-query ] [ dns-AAAA-query ] bi
[ message>names second print ] bi@
