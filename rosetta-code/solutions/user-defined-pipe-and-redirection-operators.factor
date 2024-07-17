! If the language supports operator definition, then:
! 
! -   create "user defined" the equivalents of the Unix shell "<", "|",
!     ">", "<<", ">>" and $(cmd) operators.
! -   Provide simple equivalents of: cat, tee, grep, & uniq, but as
!     filters/procedures native to the specific language.
! -   Replicate the below sample shell script, but in the specific
!     language
! -   Specifically do not cache the entire stream before the subsequent
!     filter/procedure starts. Pass each record on as soon as available
!     through each of the filters/procedures in the chain.
! 
! Alternately: if the language does not support operator definition then
! replace with:
! 
! -   define the procedures: input(cmd,stream), pipe(stream,cmd),
!     output(stream, stream), whereis(array), append(stream)
! 
! For bonus Kudos: Implement the shell "&" concept as a dyadic operator in
! the specific language. e.g.:
! 
!     ( head x & tail x & wait ) | grep test
! 
! Sample shell script: ¢ draft - pending a better (more interesting)
! suggestion ¢
! 
!     aa="$(
!       (
!         head -4 < List_of_computer_scientists.lst;
!         cat List_of_computer_scientists.lst | grep ALGOL | tee ALGOL_pioneers.lst;
!         tail -4 List_of_computer_scientists.lst
!       ) | sort | uniq | tee the_important_scientists.lst | grep aa
!     );
!     echo "Pioneer: $aa"
! 
! Input Records:
! 
!   Name                      Areas of interest
!   ------------------------- ----------------------------------------------------------------------
!   Wil van der Aalst         business process management, process mining, Petri nets
!   Hal Abelson               intersection of computing and teaching
!   Serge Abiteboul           database theory
!   Samson Abramsky           game semantics
!   Leonard Adleman           RSA, DNA computing
!   Manindra Agrawal          polynomial-time primality testing
!   Luis von Ahn              human-based computation
!   Alfred Aho                compilers book, the 'a' in AWK
!   Stephen R. Bourne         Bourne shell, portable ALGOL 68C compiler
!   Kees Koster               ALGOL 68
!   Lambert Meertens          ALGOL 68, ABC (programming language)
!   Peter Naur                BNF, ALGOL 60
!   Guido van Rossum          Python (programming language)
!   Adriaan van Wijngaarden   Dutch pioneer; ARRA, ALGOL
!   Dennis E. Wisnosky        Integrated Computer-Aided Manufacturing (ICAM), IDEF
!   Stephen Wolfram           Mathematica
!   William Wulf              compilers
!   Edward Yourdon            Structured Systems Analysis and Design Method
!   Lotfi Zadeh               fuzzy logic
!   Arif Zaman                Pseudo-random number generator
!   Albert Zomaya             Australian pioneer of scheduling in parallel and distributed systems
!   Konrad Zuse               German pioneer of hardware and software
! 
!   : A test sample of scientists from wikipedia's "List of computer
!   scientists"
! 
! These records can be declared in any format appropriate to the specific
! language. eg table, array, list, table or text file etc.
! 
! Output:
! 
!     Pioneer: Adriaan van Wijngaarden - Dutch pioneer; ARRA, ALGOL


