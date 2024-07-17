! The job of a URL shortener is to take a long URL (e.g.
! "https://www.cockroachlabs.com/docs/stable/build-a-go-app-with-cockroachdb.html")
! and turn it into something shorter (e.g. "https://bit.ly/2QLUQIu").
! 
! A simple URL shortener with no special rules is very simple and consists
! of 2 endpoints:
! 
! -   One to generate a short version of a URL given a long version of a
!     URL.
! -   One to handle a call to the short version of a URL and redirect the
!     user to the long (original) version of the URL.
! 
! Create a simple URL shortening API with the following endpoints:
! 
! POST /
! 
! A POST endpoint that accepts a JSON body describing the URL to shorten.
! Your URL shortener should generate a short version of the URL and keep
! track of the mapping between short and long URLs. For example:
! 
!    $ curl -X POST 'localhost:8080' \
!    -H 'Content-Type: application/json' \
!    -d '{
!        "long": "https://www.cockroachlabs.com/docs/stable/build-a-go-app-with-cockroachdb.html"
!    }'
! 
! Should returning something similar to:
! 
!    http://localhost:8080/9eXmFnuj
! 
! GET /:short
! 
! A GET endpoint that accepts a short version of the URL in the URL path
! and redirects the user to the original URL. For example:
! 
!    $ curl -L http://localhost:3000/9eXmFnuj
! 
! Should redirect the user to the original URL:
! 
!    <!DOCTYPE html>
!    
! 
!    ...
! 
! Rules:
! 
! -   Store the short -> long mappings in any way you like. In-memory is
!     fine.
! -   There are no auth requirements. Your API can be completely open.
! 
! Category:Networking and Web Interaction


