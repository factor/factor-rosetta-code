! Idiomatically determine all the characters that can be used for symbols.
! The word symbols is meant things like names of variables, procedures
! (i.e., named fragments of programs, functions, subroutines, routines),
! statement labels, events or conditions, and in general, anything a
! computer programmer can choose to name, but not being restricted to this
! list. Identifiers might be another name for symbols.
! 
! The method should find the characters regardless of the hardware
! architecture that is being used (ASCII, EBCDIC, or other).
! 
! Task requirements
! 
! Display the set of all the characters that can be used for symbols which
! can be used (allowed) by the computer program. You may want to mention
! what hardware architecture is being used, and if applicable, the
! operating system.
! 
! Note that most languages have additional restrictions on what characters
! can't be used for the first character of a variable or statement label,
! for instance. These type of restrictions needn't be addressed here (but
! can be mentioned).
! 
! See also
! 
! -   Idiomatically determine all the lowercase and uppercase letters.

USING: parser see ;
\ scan-word-name see
