! The present task is focused on the conversion of strings of
! comma-separated values (CSV) to strings of tab-separated values (TSV)
! subject to the specific set of rules given below. These generally
! correspond to conventions regarding CSV and TSV files, but this task is
! primarily concerned with records considered separately. When considering
! a text file, a "record" should be seen as a line in the file as
! determined by the NEWLINE conventions of the operating system.
! 
! In accordance with the so-called robustness principle of processing, if
! a string or input line begins with a valid (possibly empty) sequence of
! comma-separated values but is followed by nonsense, then processing
! should continue based on the identified values, with the remainder of
! the line or string being ignored.
! 
! A CSV record
! 
! Our starting point will be a character set that includes ASCII; the
! language of regular expressions (which will be denoted by strings of the
! form r'REGEX'); and the following PEG (parsing expression grammar)
! grammar for a single CSV record:
! 
!       record = field (',' field)*
!       field  = (ws* quoted_field ws*) / unquoted_field
!       quoted_field = '"' quoted_field_content '"'
!       ws     = ' '
! 
!       unquoted_field := r'[^,"]*'
! 
!       quoted_field_content := r'(("")|([^"]))*'
! 
! Since it has already been stipulated that partitioning of a file into
! lines is determined by the NEWLINE convention of the computing platform,
! the NEWLINE cannot appear in either `quoted_field` or
! `quoted_field_content` so there is no need to express that as a
! restriction in the PEG.
! 
! "Robustness"
! 
! As mentioned above, if an input line or string begins with a valid
! sequence of comma-separated values but is followed by nonsense, then
! processing should continue using the valid values.
! 
! Files, NEWLINE, and end-of-file
! 
! When converting a file of text on a particular platform, the converter
! should adhere to the conventions regarding lines, NEWLINES and
! end-of-file for that platform as much as possible, but if the last line
! in the file is not followed by a NEWLINE, then that line should be
! processed as though it were followed by a new line.
! 
! csv2tsv
! 
! When converting a CSV record to a TSV record, only the sequence of
! `unquoted_field` and `quoted_field_content` values is relevant. Before
! emitting these values as tab-separated values, the following
! transformations must be performed:
! 
! 1.  each literal tab (TAB) must be replaced by the two-character string
!     "\t";
! 2.  each embedded LF (LINEFEED) must be replaced by the two-character
!     string "\n";
! 3.  each embedded CR (CARRIAGERETURN) must be replaced by the
!     two-character string "\r";
! 4.  each backslash that occurs in a two-character substring of the form
!     r'\\[nrt]' must be duplicated;
! 5.  each literal NUL character (#x0) should be replaced by the
!     two-character string "\0".
! 
! Whether or not backslashes in general must be duplicated is optional.
! 
! EXAMPLES
! 
! In these examples, a line of the form:
! 
!     'input' => 'tsv' # comment
! 
! signifies that the input as given on the left should be transformed into
! the 'tsv' string given on the right, in both cases minus the surrounding
! quotes. On either side, signifies the tab character.
! 
!     'a,"b"'      => 'a<tab>b'   # <tab> is the tab character
!     '"a","b""c"' => 'a<tab>b"c' # double-quotes are normalized
!     ''           => ''          # an empty line is translated to an empty line
!     ',a'         => '<tab>a'    # an empty field is translated to an empty field
!     'a,"'        => 'a<tab>'    # the trailing nonsense is ignored, but the comma is not
!     ' a , "b" '  => ' a <tab>b' # whitespace around quoted fields is ignored
!     '"12",34'    => '12<tab>34' # numeric strings are not treated specially
!     'a<tab>b'    => 'a\tb'      # literal tabs in the CSV must be converted to "\t"
!     'a\tb'       => 'a\\tb'     # ... and so an escaped t must be distinguished
!     'a\n\rb'     => 'a\\n\\rb'  # literal backslashes are also duplicated for n, r
!     'a�b'        => 'a\0b'      # NUL is translated to the two-character string "\0"
!     'a<RETURN>b' => 'a\rb'      # <RETURN> is the control character
! 
! TASKS
! 
! Display a program, procedure or function, preferably named csv2tsv,
! which, when given a text file of lines or strings beginning with a CSV
! record as defined above, produces a corresponding stream of TSV records
! in accordance with all the above requirements.
! 
! When run on different platforms, the program should transform a given
! sequence of records, when presented in accordance with the NEWLINE
! conventions of each computing platform, in the same way, adjusting for
! the NEWLINE conventions of the platform.
! 
! Use the following as a test file (after changing the RETURN string to
! the RETURN control character) and note any discrepancies with the
! requirements; in addition, indicate how strings containing backslashes
! (besides those preceding r'[nrt]) are transformed.
! 
! TEST FILE
! 
! The test file should include a line with a RETURN ('\r') character. One
! way to change the first RETURN in the following to the '\r' control
! character would be to use `sed`, perhaps along the lines of: sed -i.bak
! $'s/RETURN/\r/' TEST.csv
! 
!     a,"b"
!     "a","b""c"
! 
!     ,a
!     a,"
!      a , "b"
!     "12",34
!     a   b, That is a TAB character
!     a\tb
!     a\n\rb
!     a�b, That is a NUL character
!     aRETURNb, Be sure to change RETURN to the '\r' control character (#xd) 
!     a\b
! 
! category:CSV category:TSV
! 
! Category:PEG


