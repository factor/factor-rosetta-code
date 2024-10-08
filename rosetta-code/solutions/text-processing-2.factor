! The following task concerns data that came from a pollution monitoring
! station with twenty-four instruments monitoring twenty-four aspects of
! pollution in the air. Periodically a record is added to the file, each
! record being a line of 49 fields separated by white-space, which can be
! one or more space or tab characters.
! 
! The fields (from the left) are:
! 
!  DATESTAMP [ VALUEn FLAGn ] * 24
! 
! i.e. a datestamp followed by twenty-four repetitions of a floating-point
! instrument value and that instrument's associated integer flag. Flag
! values are >= 1 if the instrument is working and < 1 if there is some
! problem with it, in which case that instrument's value should be
! ignored.
! 
! A sample from the full data file readings.txt, which is also used in the
! Text processing/1 task, follows:
! 
! Data is no longer available at that link. Zipped mirror available here
! 
!     1991-03-30  10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1
!     1991-03-31  10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   20.000  1   20.000  1   20.000  1   35.000  1   50.000  1   60.000  1   40.000  1   30.000  1   30.000  1   30.000  1   25.000  1   20.000  1   20.000  1   20.000  1   20.000  1   20.000  1   35.000  1
!     1991-03-31  40.000  1   0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2
!     1991-04-01  0.000   -2  13.000  1   16.000  1   21.000  1   24.000  1   22.000  1   20.000  1   18.000  1   29.000  1   44.000  1   50.000  1   43.000  1   38.000  1   27.000  1   27.000  1   24.000  1   23.000  1   18.000  1   12.000  1   13.000  1   14.000  1   15.000  1   13.000  1   10.000  1
!     1991-04-02  8.000   1   9.000   1   11.000  1   12.000  1   12.000  1   12.000  1   27.000  1   26.000  1   27.000  1   33.000  1   32.000  1   31.000  1   29.000  1   31.000  1   25.000  1   25.000  1   24.000  1   21.000  1   17.000  1   14.000  1   15.000  1   12.000  1   12.000  1   10.000  1
!     1991-04-03  10.000  1   9.000   1   10.000  1   10.000  1   9.000   1   10.000  1   15.000  1   24.000  1   28.000  1   24.000  1   18.000  1   14.000  1   12.000  1   13.000  1   14.000  1   15.000  1   14.000  1   15.000  1   13.000  1   13.000  1   13.000  1   12.000  1   10.000  1   10.000  1
! 
! Task:
! 
! 1.  Confirm the general field format of the file.
! 2.  Identify any DATESTAMPs that are duplicated.
! 3.  Report the number of records that have good readings for all
!     instruments.

USING: io io.encodings.ascii io.files kernel math math.parser
prettyprint sequences sequences.extras sets splitting ;

: check-format ( seq -- )
    [ " \t" split length 49 = ] all?
    "Format okay." "Format not okay." ? print ;

"readings.txt" ascii file-lines [ check-format ] keep
[ "Duplicates:" print [ "\t" split1 drop ] map duplicates . ]
[ [ " \t" split rest <odds> [ string>number 0 <= ] none? ] count ]
bi pprint " records were good." print
