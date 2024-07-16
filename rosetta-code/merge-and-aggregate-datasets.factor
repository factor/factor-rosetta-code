! Merge and aggregate datasets
! 
! Task:
! 
! Merge and aggregate two datasets as provided in .csv files into a new
! resulting dataset.
! 
! Use the appropriate methods and data structures depending on the
! programming language.
! 
! Use the most common libraries only when built-in functionality is not
! sufficient.
! 
! Note:
! 
! Either load the data from the .csv files or create the required data
! structures hard-coded.
! 
! patients.csv file contents:
! 
!     PATIENT_ID,LASTNAME
!     1001,Hopper
!     4004,Wirth
!     3003,Kemeny
!     2002,Gosling
!     5005,Kurtz
! 
! visits.csv file contents:
! 
!     PATIENT_ID,VISIT_DATE,SCORE
!     2002,2020-09-10,6.8
!     1001,2020-09-17,5.5
!     4004,2020-09-24,8.4
!     2002,2020-10-08,
!     1001,,6.6
!     3003,2020-11-12,
!     4004,2020-11-05,7.0
!     1001,2020-11-19,5.3
! 
! Create a resulting dataset in-memory or output it to screen or file,
! whichever is appropriate for the programming language at hand.
! 
! Merge and group per patient id and last name, get the maximum visit
! date, and get the sum and average of the scores per patient to get the
! resulting dataset.
! 
! Note that the visit date is purposefully provided as ISO format, so that
! it could also be processed as text and sorted alphabetically to
! determine the maximum date.
! 
!     | PATIENT_ID | LASTNAME | LAST_VISIT |  SCORE_SUM | SCORE_AVG |
!     | 1001       |  Hopper  | 2020-11-19 |  17.4      | 5.80      |
!     | 2002       |  Gosling | 2020-10-08 |   6.8      | 6.80      |
!     | 3003       |  Kemeny  | 2020-11-12 |            |           |
!     | 4004       |  Wirth   | 2020-11-05 |  15.4      | 7.70      |
!     | 5005       |  Kurtz   |            |            |           |
! 
! Note:
! 
! This task is aimed in particular at programming languages that are used
! in data science and data processing, such as F#, Python, R, SPSS, MATLAB
! etc.
! 
! Related tasks:
! 
! -   CSV data manipulation
! -   CSV to HTML translation
! -   Read entire file
! -   Read a file line by line

