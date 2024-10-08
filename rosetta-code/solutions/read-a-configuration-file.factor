! The task is to read a configuration file in standard configuration file
! format, and set variables accordingly.
! 
! For this task, we have a configuration file as follows:
! 
! # This is a configuration file in standard configuration file format
! #
! # Lines beginning with a hash or a semicolon are ignored by the application
! # program. Blank lines are also ignored by the application program.
! 
! # This is the fullname parameter
! FULLNAME Foo Barber
! 
! # This is a favourite fruit
! FAVOURITEFRUIT banana
! 
! # This is a boolean that should be set
! NEEDSPEELING
! 
! # This boolean is commented out
! ; SEEDSREMOVED
! 
! # Configuration option names are not case sensitive, but configuration parameter
! # data is case sensitive and may be preserved by the application program.
! 
! # An optional equals sign can be used to separate configuration parameter data
! # from the option name. This is dropped by the parser. 
! 
! # A configuration option may take multiple parameters separated by commas.
! # Leading and trailing whitespace around parameter names and parameter data fields
! # are ignored by the application program.
! 
! OTHERFAMILY Rhu Barber, Harry Barber
! 
! For the task we need to set four variables according to the
! configuration entries as follows:
! 
! -   fullname = Foo Barber
! -   favouritefruit = banana
! -   needspeeling = true
! -   seedsremoved = false
! 
! We also have an option that contains multiple parameters. These may be
! stored in an array.
! 
! -   otherfamily(1) = Rhu Barber
! -   otherfamily(2) = Harry Barber
! 
! Related tasks
! 
! -   Update a configuration file


