! A Time-based One-time Password Algorithm (TOTP) is an algorithm that
! computes a one-time password from a shared secret key and the current
! time. It is the cornerstone of Initiative For Open Authentication (OATH)
! and is used in a number of two factor authentication systems.
! 
! Essentially, both the server and the client compute the time-limited
! token, then the server checks if the token supplied by the client
! matches the locally generated token.
! 
! Task:
! 
! Implement this algorithm using HMAC-SHA1 and an optional step is to
! generate the random Base-32 string used as the secret key, but this is
! not a requirement.
! 
! A reference implementation, based on JavaScript, can be found at the
! following location:
! 
!     
! 
!         http://blog.tinisles.com/2011/10/google-authenticator-one-time-password-algorithm-in-javascript
! 
! According to RFC 6238, the reference implementation is as follows:
! 
! -   Generate a key, K, which is an arbitrary bytestring, and share it
!     securely with the client.
! -   Agree upon an epoch, T0, and an interval, TI, which will be used to
!     calculate the value of the counter C (defaults are the Unix epoch as
!     T0 and 30 seconds as TI)
! -   Agree upon a cryptographic hash method (default is SHA-1)
! -   Agree upon a token length, N (default is 6)
! 
! Although RFC 6238 allows different parameters to be used, the Google
! implementation of the authenticator app does not support T0, TI values,
! hash methods and token lengths different from the default. It also
! expects the K secret key to be entered (or supplied in a QR code) in
! base-32 encoding according to RFC 3548.
! 
! -   Google Authenticator App (Apple iOS)
! -   Google Authenticator App (Google Android)
! -   Microsoft Authenticator App (Windows Phone)


