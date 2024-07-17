! Languages can be implemented by interpreters or compilers. Some
! languages are implemented by both techniques.
! 
! If a language is implemented via a compiler, the developer (usually)
! writes one or more source files in the language, submits them to the
! compiler and (all being well) receives a compiled executable in return.
! That executable only does what the specific program does.
! 
! If the language is implemented via an interpreter, the decveloper
! (usually) writes one or more source files and invokes an interpreter to
! execute the program. Generally "object code" as such, is not created.
! 
! Suppose we want to have it both ways and we want to "compile" the
! interpreted code and get an executable that will only do what the
! specific interpreted program does i.e.., not a general interpreter.
! 
! So, instead of supplying the source for the program, we just want to
! produce an executable for that specific program. The purpose of this
! task is to show how it could be done for your language.
! 
! Note: This task is about creating a compiled executable. Some operating
! systems allow a script to start with e.g. "#!" and the name of the
! interpreter to run it. This is not. what is reuired, as this would mean
! shipping the source.
! 
! One method of doing this would be to create a program in a language for
! which there is a compiler available (C for example) that contanss the
! source of the program to be interpreted, writes it to a temporary file
! and calls the interpreter to run it and then deletes the temporary file
! afterwards.
! 
! Alternatively, if the interpreter provides itself as an API and allows
! the source to be specified by other means - as a string perhaps, the
! need to write a temporary file would be avoided.
! 
! For example, let's assume we need an executable that will run the Hello
! World program in the interpreter only language I. The I source might be:
! 
!         print "Hello, World!"
! 
! then (assuming the I interpreter is invoked with the command
! "InterpretI" and a suitable file for the temporary source is /tmp/t) a
! suitable C source might be:
! 
!     #include <stdio.h>
!     #include <errno.h>
!     static void w( char * line, FILE * tf )
!     {fputs( line, tf );
!      if( errno != 0 ){ perror( "temp" );exit( 2 ); }
!     }
!     int main( int argc, char ** argv )
!     {FILE * tf = fopen( "/tmp/t", "w" );
!      if( tf == NULL ){ perror( "temp" );exit( 1 ); }
!      w( "    print \"Hello, World!\"\n", tf );
!      fclose( tf );
!      system( "InterpretI /tmp/t" );
!      remove( "/tmp/t" );
!     }
! 
! If your language has other ways of doing this e.g., the interpreter
! provides an API that would let you specify the code via a string instead
! of storing it in a file, demonstrate how this would be done.
! 
! If the implementation provides a standard utility or option to do this,
! show the commands necessary to do it.
! 
! Note, this task is about showing how to achieve the goal, blurb is good
! but code or commands are required.
! 
! if your language can only be compiled (unlikely as that may seem - I've
! heard that there are C interpreters, for example), you could omit it
! from the task, write an interpreter :) or ...
! 
! If you do generate a source, it need not be in C - it can be in any
! language for which a compiler is available (perhaps your language).
! 
! Whether or not the executable can be cross-compiled for a platform other
! than the one your program runs on is assumed to be a property of the
! compiler you are going to use to create the executable.


