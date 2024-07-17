! Task:
! 
! Introduction
! 
! Many programming languages allow file inclusion, so that for example,
! standard declarations or code-snippets can be stored in a separate
! source file and be included into the programs that require them at
! compile-time, without the need for cut-and-paste.
! 
! Probably the C pre-processor is the most well-known example.
! 
! The purpose of this task is to demonstrate how a file inclusion
! pre-processor could be implemented in your language, for your language.
! This does not mean to imply that your language needs a file inclusion
! pre-processor - many languages don't have such a facility.
! 
! Other languages, on the other hand do have file inclusion, e.g.: C,
! COBOL, PL/1.
! 
! The distinction between compiled and interpreted languages should be
! irrelevent - this is a specialised text processing exercise - reading a
! source file and producing a modified source file that aldo contains the
! contents of one or more other files.
! 
! Hopefully, the solutions to this task will enable the file inclusion
! facilities of the languages to be compared, even for languages that
! don't need such facilities because they have sophisticated equivalents.
! 
! The pre-processor
! 
! Create a simple pre-processor that implements file-inclusion for your
! language.
! 
! The pre-processor need not check the validity of the resultant source.
! The pre-processor's job is purely to insert te specified files into the
! source at the required points. Whether the result is syntacticly valid
! or not is a matter for the compiler/interpreter when it is presented
! with the source.
! 
! The syntax accepted for your pre-processor should be as per the standard
! for your language, should your language have such a facility. E.g. for C
! the pre-processor must recognise and handle "#include" directives. For
! PL/1, %include statements would be processed and for COBOL, COPY
! statements, and so on.
! 
! If your language does not have a standard facility for file-inclusion,
! implement that used by a popular compiler/interpreter for the language.
! 
! If there is no such feature, either use the C style #include directive
! or choose something of your own invention, e.g., #include would be
! problematic for languages where # introduces a comment.
! 
! State the syntax expected and any limitations, including whether nested
! includes are supported and if so, how deep the nesting can be.
! 
! Minimum requirements
! 
! As a minimum, your pre-procdessor must be able to process a source file
! (read from a file or standard input, as you prefer) and generate another
! source file (written to a file or standard output, as you prefer). The
! file-inclusion directives in the source should be replaced by the
! contents of the specified files. Implementing nested file inclusion
! directives (i.e., if an included file contains another file-inclusion
! directive) is optional.
! 
! Pre-processors for some languages offer additional facilities, such as
! macro expansion and conditional compilation. Your pre-processor need not
! implement such things.
! 
! Notes
! 
! -   implementors: The Task is about implementing a pre-processor for
!     your language, not just describing it's features. Just as the task
!     Calculating the value of e is not about using your language's
!     in-built exp function but showing how e could be calculated, this is
!     about showing how file inclusion could be implemented - even if the
!     compiler/interpreter you are using already has such a facility.
! -   the pre-processors on this page are supplied as-is, with no
!     warranty - use at your own peril : )
! 
! See Also
! 
! -   include a file


