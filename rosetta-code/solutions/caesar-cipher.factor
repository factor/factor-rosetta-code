! Task:
! 
! Implement a Caesar cipher, both encoding and decoding.
! 
! The key is an integer from 1 to 25.
! 
! This cipher rotates (either towards left or right) the letters of the
! alphabet (A to Z).
! 
! The encoding replaces each letter with the 1st to 25th next letter in
! the alphabet (wrapping Z to A).
! 
! So key 2 encrypts "HI" to "JK", but key 20 encrypts "HI" to "BC".
! 
! This simple "mono-alphabetic substitution cipher" provides almost no
! security, because an attacker who has the encoded message can either use
! frequency analysis to guess the key, or just try all 25 keys.
! 
! Caesar cipher is identical to Vigenère cipher with a key of length 1.
! 
! Also, Rot-13 is identical to Caesar cipher with key 13.
! 
! Related tasks:
! 
! -   Rot-13
! -   Substitution Cipher
! -   Vigenère Cipher/Cryptanalysis
! 
! Category:String manipulation

USING: io kernel locals math sequences unicode.categories ;
IN: rosetta-code.caesar-cipher

:: cipher ( n s -- s' )
    [| c |
        c Letter? [
            c letter? CHAR: a CHAR: A ? :> a
            c a - n + 26 mod a +
        ]
        [ c ] if
    ] :> shift
    s [ shift call ] map ;
    
: encrypt ( n s -- s' ) cipher ;
: decrypt ( n s -- s' ) [ 26 swap - ] dip cipher ;

11 "Esp bftnv mczhy qzi ufxapo zgpc esp wlkj ozr." decrypt print
11 "The quick brown fox jumped over the lazy dog." encrypt print
