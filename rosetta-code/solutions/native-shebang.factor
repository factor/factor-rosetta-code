! In short: Use the specimen language (native) for "scripting".
! 
! Example: If your language is "foo", then the test case of "echo.foo" runs in a terminal as "./echo.foo Hello, world!".
! 
! In long: Create a program (in the specimen language) that will
! automatically compile a test case (of the same specimen language) to a
! native binary executable and then transparently load and run this test
! case executable.
! 
! Make it so that all that is required is a custom shebangs at the start
! of the test case. e.g. "#!/usr/local/bin/script_foo"
! 
! Importantly: This task must be coded strictly in the specimen language,
! neither using a shell script nor any other 3rd language.
! 
! Optimise this progress so that the test program binary executable is
! only created if the original test program source code as been
! touched/edited.
! 
! Note: If the lauguage (or a specific implementation) handles this
! automatically, then simple provide an example of "echo.foo"
! 
! Background:
! 
! Simple shebangs can help with scripting, e.g. "#!/usr/bin/env python" at
! the top of a Python script will allow it to be run in a terminal as
! "./script.py".
! 
! The task Multiline shebang largely demonstrates how to use "shell" code
! in the shebang to compile and/or run source-code from a 3rd language,
! typically "#!/bin/bash" or "#!/bin/sh".
! 
! This task:
! 
! However in this task Native shebang task we are go native. In the
! shebang, instead of running a shell, we call a binary-executable
! generated from the original native language, e.g. when using C with gcc
! "#!/usr/local/bin/script_gcc" to extract, compile and run the native
! "script" source code.
! 
! Other small innovations required of this Native shebang task:
! 
! -   Cache the executable in some appropriate place in a path, dependant
!     on available write permissions.
! -   Generate a new cached executable only when the source has been
!     touched.
! -   If a cached is available, then run this instead of regenerating a
!     new executable.
! 
! Difficulties:
! 
! -   Naturally, some languages are not compiled. These languages are
!     forced to use shebang executables from another language, eg
!     "#!/usr/bin/env python" uses the C binaries /usr/bin/env and
!     /usr/bin/python. If this is the case, then simply document the
!     details of the case.
! -   In a perfect world, the test file (e.g. echo.c) would still be a
!     valid program, and would compile without error using the native
!     compiler (e.g. gcc for text.c). The problem is that "#!" is
!     syntactically incorrect on many languages, but in others it can be
!     parsed as a comment.
! -   The "test binary" should be exec-ed and hence retain the original
!     Process identifier.
! 
! Test case:
! 
! -   Create a simple "script file" (in the same native language) called
!     "echo" then use the "script" to output "Hello, world!"
! 
! Category:Programming environment operations


