! Often data is produced by one program, in the wrong format for later use
! by another program or person. In these situations another program can be
! written to parse and transform the original data into a format useful to
! the other. The term "Data Munging" is often used in programming circles
! for this task.
! 
! A request on the comp.lang.awk newsgroup led to a typical data munging
! task:
! 
!     I have to analyse data files that have the following format:
!     Each row corresponds to 1 day and the field logic is: $1 is the date,
!     followed by 24 value/flag pairs, representing measurements at 01:00,
!     02:00 ... 24:00 of the respective day. In short:
! 
!     <date> <val1> <flag1> <val2> <flag2> ...  <val24> <flag24>
! 
!     Some test data is available at: 
!     ... (nolonger available at original location)
! 
!     I have to sum up the values (per day and only valid data, i.e. with
!     flag>0) in order to calculate the mean. That's not too difficult.
!     However, I also need to know what the "maximum data gap" is, i.e. the
!     longest period with successive invalid measurements (i.e values with
!     flag<=0)
! 
! The data is free to download and use and is of this format:
! 
! Data is no longer available at that link. Zipped mirror available here
! (offsite mirror).
! 
!     1991-03-30  10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1
!     1991-03-31  10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   10.000  1   20.000  1   20.000  1   20.000  1   35.000  1   50.000  1   60.000  1   40.000  1   30.000  1   30.000  1   30.000  1   25.000  1   20.000  1   20.000  1   20.000  1   20.000  1   20.000  1   35.000  1
!     1991-03-31  40.000  1   0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2  0.000   -2
!     1991-04-01  0.000   -2  13.000  1   16.000  1   21.000  1   24.000  1   22.000  1   20.000  1   18.000  1   29.000  1   44.000  1   50.000  1   43.000  1   38.000  1   27.000  1   27.000  1   24.000  1   23.000  1   18.000  1   12.000  1   13.000  1   14.000  1   15.000  1   13.000  1   10.000  1
!     1991-04-02  8.000   1   9.000   1   11.000  1   12.000  1   12.000  1   12.000  1   27.000  1   26.000  1   27.000  1   33.000  1   32.000  1   31.000  1   29.000  1   31.000  1   25.000  1   25.000  1   24.000  1   21.000  1   17.000  1   14.000  1   15.000  1   12.000  1   12.000  1   10.000  1
!     1991-04-03  10.000  1   9.000   1   10.000  1   10.000  1   9.000   1   10.000  1   15.000  1   24.000  1   28.000  1   24.000  1   18.000  1   14.000  1   12.000  1   13.000  1   14.000  1   15.000  1   14.000  1   15.000  1   13.000  1   13.000  1   13.000  1   12.000  1   10.000  1   10.000  1
! 
! Only a sample of the data showing its format is given above. The full
! example file may be downloaded here.
! 
! Structure your program to show statistics for each line of the file,
! (similar to the original Python, Perl, and AWK examples below), followed
! by summary statistics for the file. When showing example output just
! show a few line statistics and the full end summary.


