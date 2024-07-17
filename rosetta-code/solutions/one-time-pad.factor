! Implement a One-time pad, for encrypting and decrypting messages.
! 
! To keep it simple, we will be using letters only.
! 
! Sub-Tasks:
! 
! -   Generate the data for a One-time pad (user needs to specify a
!     filename and length)
! 
!     The important part is to get "true random" numbers, e.g. from
!     /dev/random
! 
! -   encryption / decryption ( basically the same operation, much like
!     Rot-13 )
! 
!     For this step, much of Vigenère cipher could be reused,
! 
! with the key to be read from the file containing the One-time pad.
! 
! -   optional: management of One-time pads: list, mark as used, delete,
!     etc.
! 
!     Somehow, the users needs to keep track which pad to use for which
!     partner.
! 
! To support the management of pad-files:
! 
! -   Such files have a file-extension ".1tp"
! -   Lines starting with "#" may contain arbitary meta-data (i.e.
!     comments)
! -   Lines starting with "-" count as "used"
! -   Whitespace within the otp-data is ignored
! 
! For example, here is the data from Wikipedia:
! 
!     # Example data - Wikipedia - 2014-11-13
!     -ZDXWWW EJKAWO FECIFE WSNZIP PXPKIY URMZHI JZTLBC YLGDYJ 
!     -HTSVTV RRYYEG EXNCGA GGQVRF FHZCIB EWLGGR BZXQDQ DGGIAK 
!      YHJYEQ TDLCQT HZBSIZ IRZDYS RBYJFZ AIRCWI UCVXTW YKPQMK 
!      CKHVEX VXYVCS WOGAAZ OUVVON GCNEVR LMBLYB SBDCDC PCGVJX 
!      QXAUIP PXZQIJ JIUWYH COVWMJ UZOJHL DWHPER UBSRUJ HGAAPR 
!      CRWVHI FRNTQW AJVWRT ACAKRD OZKIIB VIQGBK IJCWHF GTTSSE 
!      EXFIPJ KICASQ IOUQTP ZSGXGH YTYCTI BAZSTN JKMFXI RERYWE 
! 
! See also
! 
! -   one time pad encryption in Python
! -   snapfractalpop - One-Time-Pad Command-Line-Utility (C).
! -   Crypt-OTP-2.00 on CPAN (Perl)


