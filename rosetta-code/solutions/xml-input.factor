! Given the following XML fragment, extract the list of student names
! using whatever means desired. If the only viable method is to use XPath,
! refer the reader to the task XML and XPath.
! 
!     <Students>
!       <Student Name="April" Gender="F" DateOfBirth="1989-01-02" />
!       <Student Name="Bob" Gender="M"  DateOfBirth="1990-03-04" />
!       <Student Name="Chad" Gender="M"  DateOfBirth="1991-05-06" />
!       <Student Name="Dave" Gender="M"  DateOfBirth="1992-07-08">
!         <Pet Type="dog" Name="Rover" />
!       </Student>
!       <Student DateOfBirth="1993-09-10" Gender="F" Name="&#x00C9;mily" />
!     </Students>
! 
! Expected Output
! 
! April
! Bob
! Chad
! Dave
! Émily

USING: io multiline sequences xml xml.data xml.traversal ;

: print-student-names ( string -- )
    string>xml "Student" tags-named [ "Name" attr print ] each ;

[[ <Students>
  <Student Name="April" Gender="F" DateOfBirth="1989-01-02" />
  <Student Name="Bob" Gender="M"  DateOfBirth="1990-03-04" />
  <Student Name="Chad" Gender="M"  DateOfBirth="1991-05-06" />
  <Student Name="Dave" Gender="M"  DateOfBirth="1992-07-08">
    <Pet Type="dog" Name="Rover" />
  </Student>
  <Student DateOfBirth="1993-09-10" Gender="F" Name="&#x00C9;mily" />
</Students>]] print-student-names
