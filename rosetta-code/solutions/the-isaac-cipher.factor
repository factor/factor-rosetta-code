! ISAAC is a cryptographically secure pseudo-random number generator
! (CSPRNG) and stream cipher. It was developed by Bob Jenkins from 1993
! (http://burtleburtle.net/bob/rand/isaac.html) and placed in the Public
! Domain. ISAAC is fast - especially when optimised - and portable to most
! architectures in nearly all programming and scripting languages. It is
! also simple and succinct, using as it does just two 256-word arrays for
! its state.
! 
! ISAAC stands for "Indirection, Shift, Accumulate, Add, and Count" which
! are the principal bitwise operations employed. To date - and that's
! after more than 20 years of existence - ISAAC has not been broken
! (unless GCHQ or NSA did it, but they wouldn't be telling). ISAAC thus
! deserves a lot more attention than it has hitherto received and it would
! be salutary to see it more universally implemented.
! 
! Task:
! 
! Translate ISAAC's reference C or Pascal code into your language of
! choice.
! 
! The RNG should then be seeded with the string "this is my secret key"
! and finally the message "a Top Secret secret" should be encrypted on
! that key. Your program's output cipher-text will be a string of
! hexadecimal digits.
! 
! Optional: Include a decryption check by re-initializing ISAAC and
! performing the same encryption pass on the cipher-text.
! 
! Please use the C or Pascal as a reference guide to these operations.
! 
! Two encryption schemes are possible: (1) XOR (Vernam) or (2)
! Caesar-shift mod 95 (Vigenère). XOR is the simplest; C-shifting offers
! greater security.
! 
! You may choose either scheme, or both, but please specify which you
! used. Here are the alternative sample outputs for checking purposes:
! 
!     Message: a Top Secret secret
!     Key    : this is my secret key
!     XOR    : 1C0636190B1260233B35125F1E1D0E2F4C5422
!     MOD    : 734270227D36772A783B4F2A5F206266236978
!     XOR dcr: a Top Secret secret
!     MOD dcr: a Top Secret secret
! 
! No official seeding method for ISAAC has been published, but for this
! task we may as well just inject the bytes of our key into the randrsl
! array, padding with zeroes before mixing, like so:
! 
!     // zeroise mm array
!     FOR i:= 0 TO 255 DO mm[i]:=0;
!     // check seed's highest array element
!     m := High(seed);
!     // inject the seed
!     FOR i:= 0 TO 255 DO BEGIN
!         // in case seed[] has less than 256 elements.
!         IF i>m THEN randrsl[i]:=0  
!             ELSE randrsl[i]:=seed[i];
!     END;
!     // initialize ISAAC with seed
!     RandInit(true);
! 
! ISAAC can of course also be initialized with a single 32-bit unsigned
! integer in the manner of traditional RNGs, and indeed used as such for
! research and gaming purposes. But building a strong and simple
! ISAAC-based stream cipher - replacing the irreparably broken RC4 - is
! our goal here: ISAAC's intended purpose.


