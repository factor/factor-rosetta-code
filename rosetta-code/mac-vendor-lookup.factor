! Every connected device around the world comes with a unique Media Access
! Control address, or a MAC address.
! 
! A common task a network administrator may come across is being able to
! identify a network device's manufacturer when given only a MAC address.
! 
! Task:
! 
! Interface with one (or numerous) APIs that exist on the internet and
! retrieve the device manufacturer based on a supplied MAC address.
! 
! A MAC address that does not return a valid result should return the
! String "N/A". An error related to the network connectivity or the API
! should return a null result.
! 
! Many implementations on this page use http://api.macvendors.com/ which,
! as of 19th September 2021, is throttling requests. After only 2 calls,
! the following response is returned for all subsequent requests. If you
! are planning to use the same provider or going to run the examples on
! this page, consider building in a delay between two calls.
! 
! {"errors":{"detail":"Too Many Requests","message":"Please slow down your
! requests or upgrade your plan at https://macvendors.com"}}

USING: accessors calendar continuations http.client io kernel
sequences threads ;

: mac-vendor ( str -- str )
    "http://api.macvendors.com/" prepend
    [ http-get nip ] [ nip response>> message>> ] recover ;

"FC-A1-3E"
"FC:FB:FB:01:FA:21"
"10-11-22-33-44-55-66"
[ mac-vendor print 1 seconds sleep ] tri@
