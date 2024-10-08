! Given some text you suspect has been encrypted with a Vigenère cipher,
! extract the key and plaintext. There are several methods for doing this.
! See the Wikipedia entry for more information. Use the following
! encrypted text:
! 
!     MOMUD EKAPV TQEFM OEVHP AJMII CDCTI FGYAG JSPXY ALUYM NSMYH
!     VUXJE LEPXJ FXGCM JHKDZ RYICU HYPUS PGIGM OIYHF WHTCQ KMLRD
!     ITLXZ LJFVQ GHOLW CUHLO MDSOE KTALU VYLNZ RFGBX PHVGA LWQIS
!     FGRPH JOOFW GUBYI LAPLA LCAFA AMKLG CETDW VOELJ IKGJB XPHVG
!     ALWQC SNWBU BYHCU HKOCE XJEYK BQKVY KIIEH GRLGH XEOLW AWFOJ
!     ILOVV RHPKD WIHKN ATUHN VRYAQ DIVHX FHRZV QWMWV LGSHN NLVZS
!     JLAKI FHXUF XJLXM TBLQV RXXHR FZXGV LRAJI EXPRV OSMNP KEPDT
!     LPRWM JAZPK LQUZA ALGZX GVLKL GJTUI ITDSU REZXJ ERXZS HMPST
!     MTEOE PAPJH SMFNB YVQUZ AALGA YDNMP AQOWT UHDBV TSMUE UIMVH
!     QGVRW AEFSP EMPVE PKXZY WLKJA GWALT VYYOB YIXOK IHPDS EVLEV
!     RVSGB JOGYW FHKBL GLXYA MVKIS KIEHY IMAPX UOISK PVAGN MZHPW
!     TTZPV XFCCD TUHJH WLAPF YULTB UXJLN SIJVV YOVDJ SOLXG TGRVO
!     SFRII CTMKO JFCQF KTINQ BWVHG TENLH HOGCS PSFPV GJOKM SIFPR
!     ZPAAS ATPTZ FTPPD PORRF TAXZP KALQA WMIUD BWNCT LEFKO ZQDLX
!     BUXJL ASIMR PNMBF ZCYLV WAPVF QRHZV ZGZEF KBYIO OFXYE VOWGB
!     BXVCB XBAWG LQKCM ICRRX MACUO IKHQU AJEGL OIJHH XPVZW JEWBA
!     FWAML ZZRXJ EKAHV FASMU LVVUT TGK
! 
! Letter frequencies for English can be found here.
! 
! Specifics for this task:
! 
! -   Take only the ciphertext as input. You can assume it's all
!     capitalized and has no punctuation, but it might have whitespace.
! -   Assume the plaintext is written in English.
! -   Find and output the key.
! -   Use that key to decrypt and output the original plaintext.
!     Maintaining the whitespace from the ciphertext is optional.
! -   The algorithm doesn't have to be perfect (which may not be possible)
!     but it should work when given enough ciphertext. The example above
!     is fairly long, and should be plenty for any algorithm.


