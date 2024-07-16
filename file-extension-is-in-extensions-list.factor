! Filename extensions are a rudimentary but commonly used way of
! identifying files types.
! 
! Task:
! 
! Given an arbitrary filename and a list of extensions, tell whether the
! filename has one of those extensions.
! 
! Notes:
! 
! -   The check should be case insensitive.
! -   The extension must occur at the very end of the filename, and be
!     immediately preceded by a dot (.).
! -   You may assume that none of the given extensions are the empty
!     string, and none of them contain a dot. Other than that they may be
!     arbitrary strings.
! 
! Extra credit:
!     Allow extensions to contain dots. This way, users of your
!     function/program have full control over what they consider as the
!     extension in cases like:
! 
!   archive.tar.gz
! 
!     Please state clearly whether or not your solution does this.
! 
! The following test cases all assume this list of extensions: zip, rar,
! 7z, gz, archive, A##
! 
!         {| class="wikitable"
! 
! |- ! Filename ! Result |- | MyData.a## || true |- | MyData.tar.Gz ||
! true |- | MyData.gzip || false |- | MyData.7z.backup || false |- |
! MyData... || false |- | MyData || false |}
! 
! If your solution does the extra credit requirement, add tar.bz2 to the
! list of extensions, and check the following additional test cases:
! 
!         {| class="wikitable"
! 
! |- ! Filename ! Result |- | MyData_v1.0.tar.bz2 || true |- |
! MyData_v1.0.bz2 || false |}
! 
! Checking if a file is in a certain category of file formats with known
! extensions (e.g. archive files, or image files) is a common problem in
! practice, and may be approached differently from extracting and
! outputting an arbitrary extension (see e.g. FileNameExtensionFilter in
! Java).
! 
! It also requires less assumptions about the format of an extension,
! because the calling code can decide what extensions are valid.
! 
! For these reasons, this task exists in addition to the Extract file
! extension task.
! 
! Related tasks:
! 
! -   Extract file extension
! -   String matching

USING: formatting kernel qw sequences splitting unicode ;
IN: rosetta-code.file-extension-list

CONSTANT: extensions qw{ zip rar 7z gz archive A## tar.bz2 }
CONSTANT: filenames qw{
    MyData.a## MyData.tar.Gz MyData.gzip MyData.7z.backup
    MyData... MyData MyData_v1.0.tar.bz2 MyData_v1.0.bz2
}

: ext-in-list? ( filename list -- ? )
    [ >lower "." split ] dup [ map ] curry bi*
    [ tail? t = ] with find nip >boolean ;

extensions "List of file extensions: %[%s, %]\n\n" printf
"File extension in extensions list?\n" printf
filenames [
    dup extensions ext-in-list? "%19s  %u\n" printf
] each
