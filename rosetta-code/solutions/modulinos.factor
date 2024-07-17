! It is useful to be able to execute a main() function only when a program
! is run directly. This is a central feature in programming scripts. A
! script that behaves this way is called a modulino.
! 
! Examples from https://github.com/mcandre/modulinos
! 
! Sometimes getting the ScriptName is required in order to determine when
! to run main().
! 
! Care when manipulating command line arguments, due to subtle exec
! security constraints that may or not be enforced on implicit argv[0].
! https://ryiron.wordpress.com/2013/12/16/argv-silliness/
! 
!     This is still a draft task, and the current task description has
!     caused mega confusion. See Talk:Modulinos for numerous attempts to
!     understand the task and to rewrite the task description.
! 
!     The task Executable library is written to replace this task. This
!     task's future is in doubt as its aims are not clear enough.

! INCLUDING macro that imports source code files in the current directory

USING: kernel vocabs.loader parser sequences lexer vocabs.parser ;
IN: syntax

: include-vocab ( vocab -- ) dup ".factor" append parse-file append use-vocab ;

SYNTAX: INCLUDING: ";" [ include-vocab ] each-token ;
