! Description
! 
! The ADFGVX cipher was a manually applied field cipher used by the German
! Army during World War I. It was broken in 1918 by the French
! cryptanalyst Georges Painvin.
! 
! The workings of the cipher are described in the Wikipedia article,
! linked to above, and so will not be repeated here.
! 
! Task
! 
! Write routines, functions etc. in your language to:
! 
! 1. Encrypt suitable plaintext and decrypt the resulting cipher text
! using the ADFGVX cipher algorithm given a Polybius square (see 2. below)
! and a suitable key. For this purpose suitable means text consisting
! solely of ASCII upper case letters or digits.
! 
! 2. Create a 6 x 6 Polybius square using a random combination of the
! letters A to Z and the digits 0 to 9 and then display it.
! 
! 3. Given the number of letters (between 7 and 12 say) to use, create a
! key by selecting a suitable word at random from unixdict.txt and then
! display it. The word selected should be such that none of its characters
! are repeated.
! 
! Use these routines to create a Polybius square and a 9 letter key.
! 
! These should then be used to encrypt the plaintext: ATTACKAT1200AM and
! decrypt the resulting cipher text. Display here the results of both
! operations.
! 
! Note
! 
! As it's unclear from the Wikipedia article how to handle a final row
! with fewer elements than the number of characters in the key, either of
! the methods mentioned in Columnar transposition may be used. In the case
! of the second method, it is also acceptable to fill any gaps after
! shuffling by moving elements to the left which makes decipherment
! harder.


