! Many systems offer the ability to open a file for writing, such that any
! data written will be appended to the end of the file. Further, the file
! operations will always adjust the position pointer to guarantee the end
! of the file, even in a multitasking environment.
! 
! This feature is most useful in the case of log files, where many jobs
! may be appending to the log file at the same time, or where care must be
! taken to avoid concurrently overwriting the same record from another
! job.
! 
! Task:
! 
! Given a two record sample for a mythical "passwd" file:
! 
! -   Write these records out in the typical system format.
!     -   Ideally these records will have named fields of various types.
! -   Close the file, then reopen the file for append.
!     -   Append a new record to the file and close the file again.
!     -   Take appropriate care to avoid concurrently overwrites from
!         another job.
! -   Open the file and demonstrate the new record has indeed written to
!     the end.
! 
!   account   password   UID    GID    fullname,office,extension,homephone,email                                directory      shell
!   --------- ---------- ------ ------ ------------------------------------------------------------------------ -------------- -----------
!   string    string     int    int    struct(string,string,string,string,string)                               string         string
!   jsmith    x          1001   1000   Joe Smith,Room 1007,(234)555-8917,(234)555-0077,jsmith@rosettacode.org   /home/jsmith   /bin/bash
!   jdoe      x          1002   1000   Jane Doe,Room 1004,(234)555-8914,(234)555-0044,jdoe@rosettacode.org      /home/jdoe     /bin/bash
! 
!   : Source record field types and contents.
! 
!   account   password   UID    GID    fullname,office,extension,homephone,email                        directory   shell
!   --------- ---------- ------ ------ ---------------------------------------------------------------- ----------- -----------
!   string    string     int    int    struct(string,string,string,string,string)                       string      string
!   xyz       x          1003   1000   X Yz,Room 1003,(234)555-8913,(234)555-0033,xyz@rosettacode.org   /home/xyz   /bin/bash
! 
!   : Record to be appended.
! 
! Resulting file format: should mimic Linux's /etc/passwd file format with
! particular attention to the "," separator used in the GECOS field. But
! if the specific language has a particular or unique format of storing
! records in text file, then this format should be named and demonstrated
! with an additional example.
! 
! Expected output:
! 
!     Appended record: xyz:x:1003:1000:X Yz,Room 1003,(234)555-8913,(234)555-0033,xyz@rosettacode.org:/home/xyz:/bin/bash
! 
! Finally: Provide a summary of the language's "append record"
! capabilities in a table. eg.
! 
! +---------------------+---------------+-------------+----------+-----------+
! | Data Representation |               | IO          | Append   | Automatic |
! |                     |               | Library     | Possible | Append    |
! +=====================+===============+=============+==========+===========+
! | In core             | On disk       |             |          |           |
! +---------------------+---------------+-------------+----------+-----------+
! | C struct            | CSV text file | glibc/stdio | ☑        | ☑         |
! +---------------------+---------------+-------------+----------+-----------+
! 
! : Append Capabilities.
! 
! Alternatively: If the language's appends can not guarantee its writes
! will always append, then note this restriction in the table. If
! possible, provide an actual code example (possibly using file/record
! locking) to guarantee correct concurrent appends.

