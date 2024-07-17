! In Germany and the Netherlands postal addresses have the form: street
! name, followed by the house number, in accordance with the national
! standards DIN 5008 respectively NEN 5825. The problem is that some
! street names have numbers (e.g. special years) and some house numbers
! have characters as an extension. It's a real life problem and difficult
! because in the Netherlands some street names are a tribute to our
! liberators. The street names have the numbers 40 and 45 indicating the
! years of war between 1940 and 1945.
! 
! Task:
! 
! Write code that correctly separates the house number from the street
! name and presents them both. No static data must be shown, only
! processed data.
! 
! The suggested approach is to either use the regular expression in the
! Scala entry or to devise an equivalent algorithm.
! 
! The test-set:
! 
!     Plataanstraat 5
!     Straat 12
!     Straat 12 II
!     Dr. J. Straat   12
!     Dr. J. Straat 12 a
!     Dr. J. Straat 12-14
!     Laan 1940 – 1945 37
!     Plein 1940 2
!     1213-laan 11
!     16 april 1944 Pad 1
!     1e Kruisweg 36
!     Laan 1940-’45 66
!     Laan ’40-’45
!     Langeloërduinen 3 46
!     Marienwaerdt 2e Dreef 2
!     Provincialeweg N205 1
!     Rivium 2e Straat 59.
!     Nieuwe gracht 20rd
!     Nieuwe gracht 20rd 2
!     Nieuwe gracht 20zw /2
!     Nieuwe gracht 20zw/3
!     Nieuwe gracht 20 zw/4
!     Bahnhofstr. 4
!     Wertstr. 10
!     Lindenhof 1
!     Nordesch 20
!     Weilstr. 6
!     Harthauer Weg 2
!     Mainaustr. 49
!     August-Horch-Str. 3
!     Marktplatz 31
!     Schmidener Weg 3
!     Karl-Weysser-Str. 6
! 
! Reference The Netherlands - Addresses
! 
! Category:Web


