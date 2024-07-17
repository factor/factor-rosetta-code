! Filename extensions are a rudimentary but commonly used way of
! identifying files types.
! 
! Task:
! 
! Write a function or program that
! 
! -   takes one string argument representing the path/URL to a file
! -   returns the filename extension according to the below specification,
!     or an empty string if the filename has no extension.
! 
! If your programming language (or standard library) has built-in
! functionality for extracting a filename extension,
! 
! show how it would be used and how exactly its behavior differs from this
! specification.
! 
! Specification:
! 
! For the purposes of this task, a filename extension:
! 
! -   occurs at the very end of the filename
! -   consists of a period, followed solely by one or more ASCII letters
!     or digits (A-Z, a-z, 0-9)
! 
! Test cases:
! 
!     
! 
!         {| class="wikitable"
! 
! |- ! Input ! Output ! Comment |- | http://example.com/download.tar.gz |
! .gz | |- | CharacterModel.3DS | .3DS | |- | .desktop | .desktop | |- |
! document | | empty string |- | document.txt_backup | | empty string,
! because _ is not a letter or number |- | /etc/pam.d/login | | empty
! string, as the period is in the parent directory name rather than the
! filename |}

USING: assocs formatting kernel io io.pathnames math qw
sequences ;
IN: rosetta-code.file-extension

qw{
  http://example.com/download.tar.gz
  CharacterModel.3DS
  .desktop
  document
  document.txt_backup
  /etc/pam.d/login
}

dup [ file-extension ] map zip
"Path" "| Extension" "%-35s%s\n" printf
47 [ "-" write ] times nl
[ "%-35s| %s\n" vprintf ] each
