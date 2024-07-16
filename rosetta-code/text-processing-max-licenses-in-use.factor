! A company currently pays a fixed sum for the use of a particular
! licensed software package. In determining if it has a good deal it
! decides to calculate its maximum use of the software from its license
! management log file.
! 
! Assume the software's licensing daemon faithfully records a checkout
! event when a copy of the software starts and a checkin event when the
! software finishes to its log file.
! 
! An example of checkout and checkin events are:
! 
!  License OUT @ 2008/10/03_23:51:05 for job 4974
!  ...
!  License IN  @ 2008/10/04_00:18:22 for job 4974
! 
! Task:
! 
! Save the 10,000 line log file from here into a local file, then write a
! program to scan the file extracting both the maximum licenses that were
! out at any time, and the time(s) at which this occurs.
! 
! Mirror of log file available as a zip here (offsite mirror).

( scratchpad ) [ find-max-licenses print-max-licenses ] time
Maximum simultaneous license use is 99 at the following times: 
2008/10/03_08:39:34
2008/10/03_08:40:40
Running time: 0.16164423 seconds
