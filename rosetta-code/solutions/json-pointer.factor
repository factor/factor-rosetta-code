! JSON Pointer is a syntax for targeting a value in a JSON (JavaScript
! Object Notation) document.
! 
! Standardized in RFC 6901, a JSON Pointer is a Unicode string containing
! slash (/) separated tokens. Each token is either a potential property
! name for a JSON object, or a potential index for a JSON array. When a
! property name contains a slash (/) or a tilde (~), they are encoded as
! ~1 and ~0, respectively.
! 
! Pseudocode
! 
! Evaluating or resolving a JSON Pointer against an arbitrary JSON
! document might look like this.
! 
!     set the current node to the document root
!     FOR each token in the pointer
!       decode the token
!       IF the current node is an array
!         IF the token is a string representation of an array index AND the index is in range
!           set the current node to node[index]
!         ELSE
!           error condition
!         ENDIF
!       ELSE IF the current node is an object
!         IF the current node has a property matching token
!           set the current node to node[token]
!         ELSE
!           error condition
!         ENDIF
!       ELSE
!         error condition
!       ENDIF
!     ENDFOR
! 
! Barring any error conditions, the result is the value of the current
! node after the loop has completed. For example, evaluating the JSON
! Pointer /foo/bar/1 against the JSON document
! {"foo": {"bar": ["hello", "world"]}}, would result in the value "world".
! 
! See RFC 6901 for details.
! 
! Task
! 
! Demonstrate parsing and evaluation of JSON Pointers using, at least, the
! following examples. Display, on this page, either the resulting JSON
! value for each test case or a helpful error message.
! 
! Example JSON document
! 
!     {
!       "wiki": {
!         "links": [
!           "https://rosettacode.org/wiki/Rosetta_Code",
!           "https://discord.com/channels/1011262808001880065"
!         ]
!       },
!       "": "Rosetta",
!       " ": "Code",
!       "g/h": "chrestomathy",
!       "i~j": "site",
!       "abc": ["is", "a"],
!       "def": { "": "programming" }
!     }
! 
! Example JSON pointers
! 
! JSON pointers are surrounded by quotes to emphasize whitespace and the
! empty pointer. The quotes are not part of the pointer.
! 
!   JSON pointer       Expected result
!   ------------------ ----------------------------------------------------
!   ""                 The entire input document.
!   "/"                "Rosetta"
!   "/ "               "Code"
!   "/abc"             ["is", "a"]
!   "/def/"            "programming"
!   "/g~1h"            "chrestomathy"
!   "/i~0j"            "site"
!   "/wiki/links/0"    "https://rosettacode.org/wiki/Rosetta_Code"
!   "/wiki/links/1"    "https://discord.com/channels/1011262808001880065"
!   "/wiki/links/2"    Error condition.
!   "/wiki/name"       Error condition.
!   "/no/such/thing"   Error condition.
!   "bad/pointer"      Error condition.
! 
! Reference
! 
! -   RFC 6901 - JSON Pointer Internet Standards Track document
! 
! Related tasks
! 
! -   JSON


