! This task is about writing a computer program that has long literals
! (character literals that may require specifying the words/tokens on more
! than one (source) line, either with continuations or some other method,
! such as abutments or concatenations (or some other mechanisms).
! 
! The literal is to be in the form of a "list", a literal that contains
! many words (tokens) separated by a blank (space), in this case (so as to
! have a common list), the (English) names of the chemical elements of the
! periodic table.
! 
! The list is to be in (ascending) order of the (chemical) element's
! atomic number:
! 
! hydrogen helium lithium beryllium boron carbon nitrogen oxygen fluorine neon sodium aluminum silicon ...
! 
! ... up to the last known (named) chemical element (at this time).
! 
! Do not include any of the "unnamed" chemical element names such as:
! 
! ununennium unquadnilium triunhexium penthextrium penthexpentium septhexunium octenntrium ennennbium
! 
! To make computer programming languages comparable, the statement widths
! should be restricted to less than 81 bytes (characters), or less if a
! computer programming language has more restrictive limitations or
! standards.
! 
! Also mention what column the programming statements can start in if not
! in column one.
! 
! The list may have leading/embedded/trailing blanks during the
! declaration (the actual program statements), this is allow the list to
! be more readable. The "final" list shouldn't have any leading/trailing
! or superfluous blanks (when stored in the program's "memory").
! 
! This list should be written with the idea in mind that the program will
! be updated, most likely someone other than the original author, as there
! will be newer (discovered) elements of the periodic table being added
! (possibly in the near future). These future updates should be one of the
! primary concerns in writing these programs and it should be "easy" for
! someone else to add chemical elements to the list (within the computer
! program).
! 
! Attention should be paid so as to not exceed the clause length of
! continued or specified statements, if there is such a restriction. If
! the limit is greater than (say) 4,000 bytes or so, it needn't be
! mentioned here.
! 
! Task:
! 
! -   -   Write a computer program (by whatever name) to contain a list of
!         the known elements.
!     -   The program should eventually contain a long literal of words
!         (the elements).
!     -   The literal should show how one could create a long list of
!         blank-delineated words.
!     -   The "final" (stored) list should only have a single blank
!         between elements.
!     -   Try to use the most idiomatic approach(es) in creating the final
!         list.
!     -   Use continuation if possible, and/or show alternatives (possibly
!         using concatenation).
!     -   Use a program comment to explain what the continuation character
!         is if it isn't obvious.
!     -   The program should contain a variable that has the date of the
!         last update/revision.
!     -   The program, when run, should display with verbiage:
!         -   -   The last update/revision date (and should be
!                 unambiguous).
!             -   The number of chemical elements in the list.
!             -   The name of the highest (last) element name.
! 
! Show all output here, on this page.

USING: formatting kernel qw sequences ;

qw{
    hydrogen     helium        lithium      beryllium
    boron        carbon        nitrogen     oxygen
    fluorine     neon          sodium       magnesium
    aluminum     silicon       phosphorous  sulfur
    chlorine     argon         potassium    calcium
    scandium     titanium      vanadium     chromium
    manganese    iron          cobalt       nickel
    copper       zinc          gallium      germanium
    arsenic      selenium      bromine      krypton
    rubidium     strontium     yttrium      zirconium
    niobium      molybdenum    technetium   ruthenium
    rhodium      palladium     silver       cadmium
    indium       tin           antimony     tellurium
    iodine       xenon         cesium       barium
    lanthanum    cerium        praseodymium neodymium
    promethium   samarium      europium     gadolinium
    terbium      dysprosium    holmium      erbium
    thulium      ytterbium     lutetium     hafnium
    tantalum     tungsten      rhenium      osmium
    iridium      platinum      gold         mercury
    thallium     lead          bismuth      polonium
    astatine     radon         francium     radium
    actinium     thorium       protactinium uranium
    neptunium    plutonium     americium    curium
    berkelium    californium   einsteinium  fermium
    mendelevium  nobelium      lawrencium   rutherfordium
    dubnium      seaborgium    bohrium      hassium
    meitnerium   darmstadtium  roentgenium  copernicium
    nihonium     flerovium     moscovium    livermorium
    tennessine   oganesson
}

"2020-03-23"   ! last revision date in YYYY-MM-DD format

"Last revision: %s\n" printf
[ length ] [ last ] bi
"Number of elements: %d\nLast element: %s\n" printf
