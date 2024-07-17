! Task:
! 
! Write a function to search plain text for URIs or IRIs.
! 
! The function should return a list of URIs or IRIs found in the text.
! 
! The definition of a URI is given in RFC 3986. IRI is defined in RFC
! 3987.
! 
! For searching URIs in particular "Appendix C. Delimiting a URI in
! Context" is noteworthy.
! 
! The abbreviation IRI isn't as well known as URI and the short
! description is that an IRI is just an alternate form of a URI that
! supports Internationalization and hence Unicode. While many
! specifications support both forms this isn't universal.
! 
! Consider the following issues:
! 
! -   -    . , ; ' ? ( ) are legal characters in a URI, but they are often
!         used in plain text as a delimiter.
!     -   IRIs allow most (but not all) unicode characters.
!     -   URIs can be something else besides http:// or https://
! 
! Sample text:
! 
!      this URI contains an illegal character, parentheses and a misplaced full stop:
!      http://en.wikipedia.org/wiki/Erich_Kästner_(camera_designer). (which is handled by http://mediawiki.org/).
!      and another one just to confuse the parser: http://en.wikipedia.org/wiki/-)
!      ")" is handled the wrong way by the mediawiki parser.
!      ftp://domain.name/path(balanced_brackets)/foo.html
!      ftp://domain.name/path(balanced_brackets)/ending.in.dot.
!      ftp://domain.name/path(unbalanced_brackets/ending.in.dot.
!      leading junk ftp://domain.name/path/embedded?punct/uation.
!      leading junk ftp://domain.name/dangling_close_paren)
!      if you have other interesting URIs for testing, please add them here:  
! 
! Regular expressions to solve the task are fine, but alternative
! approaches are welcome too. (otherwise, this task would degrade into
! 'finding and applying the best regular expression')
! 
! Extra Credit: implement the parser to match the IRI specification in RFC
! 3987.


