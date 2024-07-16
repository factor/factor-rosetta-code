! This task has three parts:
! 
! -   Connect to a MySQL database (connect_db)
! -   Create user/password records in the following table (create_user)
! -   Authenticate login requests against the table (authenticate_user)
! 
! This is the table definition:
! 
!     create table users (
!         userid int primary key auto_increment,
!         username varchar(32) unique key not null,
!         pass_salt tinyblob not null,
!                 -- a string of 16 random bytes
!         pass_md5 tinyblob not null
!                 -- binary MD5 hash of pass_salt concatenated with the password
!     );
! 
! (pass_salt and pass_md5 would be binary(16) values, but MySQL versions
! before 5.0.15 strip trailing spaces when selecting them.)

