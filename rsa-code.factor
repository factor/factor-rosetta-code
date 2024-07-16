! Given an RSA key (n,e,d), construct a program to encrypt and decrypt
! plaintext messages strings.
! 
! Background
! 
! RSA code is used to encode secret messages. It is named after Ron
! Rivest, Adi Shamir, and Leonard Adleman who published it at MIT in 1977.
! The advantage of this type of encryption is that you can distribute the
! number “n” and “e” (which makes up the Public Key used for encryption)
! to everyone. The Private Key used for decryption “d” is kept secret, so
! that only the recipient can read the encrypted plaintext.
! 
! The process by which this is done is that a message, for example “Hello
! World” is encoded as numbers (This could be encoding as ASCII or as a
! subset of characters a = 01, b = 02, ..., z = 26). This yields a string
! of numbers, generally referred to as "numerical plaintext", “P”. For
! example, “Hello World” encoded with a=1,...,z=26 by hundreds would yield
! 08051212152315181204.
! 
! The plaintext must also be split into blocks so that the numerical
! plaintext is smaller than n otherwise the decryption will fail.
! 
! The ciphertext, C, is then computed by taking each block of P, and
! computing
! 
!     C ≡ P^(e) mod  n
! 
! Similarly, to decode, one computes
! 
!     P ≡ C^(d) mod  n
! 
! To generate a key, one finds 2 (ideally large) primes p and q. the value
! “n” is simply: n = p × q. One must then choose an “e” such that
! gcd (e, (p − 1) × (q − 1)) = 1. That is to say, e and (p − 1) × (q − 1)
! are relatively prime to each other.
! 
! The decryption value d is then found by solving
! 
!     d × e ≡ 1 mod  (p − 1) × (q − 1)
! 
! The security of the code is based on the secrecy of the Private Key
! (decryption exponent) “d” and the difficulty in factoring “n”. Research
! into RSA facilitated advances in factoring and a number of factoring
! challenges. Keys of 829 bits have been successfully factored, and NIST
! now recommends 2048 bit keys going forward (see Asymmetric algorithm key
! lengths).
! 
! Summary of the task requirements:
! 
! -   Encrypt and Decrypt a short message or two using RSA with a
!     demonstration key.
! -   Implement RSA do not call a library.
! -   Encode and decode the message using any reversible method of your
!     choice (ASCII or a=1,..,z=26 are equally fine).
! -   Either support blocking or give an error if the message would
!     require blocking)
! -   Demonstrate that your solution could support real keys by using a
!     non-trivial key that requires large integer support (built-in or
!     libraries). There is no need to include library code but it must be
!     referenced unless it is built into the language. The following keys
!     will be meet this requirement;however, they are NOT long enough to
!     be considered secure:
! 
!         n = 9516311845790656153499716760847001433441357
!         e = 65537
!         d = 5617843187844953170308463622230283376298685
! 
! -   Messages can be hard-coded into the program, there is no need for
!     elaborate input coding.
! -   Demonstrate that your implementation works by showing plaintext,
!     intermediate results, encrypted text, and decrypted text.

