! Parameterized SQL statements are an easy way to avoid SQL injection
! attacks. SQL drivers and libraries will automatically "sanitize" input
! to parameterized SQL statements to avoid these catastrophic database
! attacks. Second, parameterized SQL performs better. A lot better.
! 
! Using a SQL update statement like this one (spacing is optional):
! 
!     UPDATE players
!        SET name = 'Smith, Steve', score = 42, active = true
!        WHERE jerseyNum = 99
! 
! show how to make a parameterized SQL statement, set the parameters to
! the values given above, and execute the statement.
! 
! Non-parameterized SQL is the GoTo statement of database programming.
! Don't do it, and make sure your coworkers don't either.

