! Task:
! 
! This algorithm is designed for pattern searching on certain types of
! devices which are backtracking-unfriendly such as Tape drives and Hard
! disks.
! 
! It works by first caching a segment of data from storage and match it
! against the pattern from the highest position backward to the lowest. If
! the matching fails, it will cache next segment of data and move the
! start point forward to skip the portion of data which will definitely
! fail to match. This continues until we successfully match the pattern or
! the pointer exceeds the data length.
! 
! Follow this link for more information about this algorithm.
! 
! To properly test this algorithm, it would be good to search for a string
! which contains repeated subsequences, such as alfalfa and the text being
! searched should not only include a match but that match should be
! preceded by words which partially match, such as alfredo, behalf,
! calfskin, halfhearted, malfunction or severalfold.


