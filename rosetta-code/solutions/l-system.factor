! Introduction
! 
! An L-system, or Lindenmayer system, is a Turing-complete form of
! computaion, based in the parallel rewriting of symbols, usually provided
! and managed as strings. The name comes after Aristid Lindenmayer, a
! biologist who created it in order to simulate the growth of plants.
! 
! An L-system consists of:
! 
! -   -   An alphabet of symbols
!     -   An initial string, known as the axiom
!     -   A set of rewriting rules, in he form A → B, where A is a single
!         symbol and B is a string. The B string can contain zero, one or
!         multiple symbols, including A.
! 
! Computation
! 
! At start, the current string is the axiom.
! 
! On each step of computation, every symbol Aₙ in the current string,
! having a rewriting rule Aₙ → Bₙ, is replaced by Bₙ. if the string Bₙ of
! the rule Aₙ → Bₙ contains the symbol Aₙ, the rule is not applied
! recursively. This is why this form of computation is called "parallel".
! Once the rewriting of symbols have been performed, the string was
! converted to another string, usually longer.
! 
! After a defined number of steps, the string is the result of the
! computation.
! 
! Example (rabbit population)
! 
! Alphabet: { I, M } for immature and mature rabbit. Only a mature rabbit
! can procreate a bunny
! 
! Rules:
! 
! -   -   I → M (An immature rabbit will be a mature one in the next step)
!     -   M → MI (A mature rabbit will procreate a bunny in the next step)
! 
! Axiom: I (Let us start with a immature rabbit)
! 
! Computation (5 steps):
! 
!   Step   String     Notes
!   ------ ---------- ------------
!   0      I          the axiom
!   1      M          
!   2      MI         
!   3      MIM        
!   4      MIMMI      
!   5      MIMMIMIM   the result
! 
! As you can see, the number of rabbits (the string length) in each step
! corresponds to the Fibonacci numbers.
! 
! Interpretation
! 
! It is common to make a further use of the resulting string. For example,
! symbols can represents musical notes, graphic operations, etc. In this
! sense, the string is like a program, and each symbol is a instruction of
! that program.
! 
! When using graphic operations, sometimes specific symbols represent
! turtle graphics operations such as moving forward, moving forward and
! drawing, turning a certain angle, etc. Other symbols could represent
! push/pop operations in a stack data structure, in order to save the
! position/angle of the pen, to be retieved later.
! 
! Task
! 
! Create a function, method, procedure, class, script, etc. (the solution)
! to compute the steps of a given L-system, and then, to perform the
! interpretation of the resulting string.
! 
! The inputs of the solution must be:
! 
! -   -   The axiom
!     -   The rewritig rules, in a data structure natural to your
!         language, it could be, for example, an array of pairs of strings
!         (S, R) where S is the symbol and R is the :rewriting of the
!         symbol
!     -   The number of steps to perform
!     -   The set of operations associated to each symbol of the resulting
!         string, in a natural structure of your language, it could be,
!         for example, an array of pairs (S, O) where S is a symbol and O
!         is a structure that denotes delayed functionallity, such as
!         anonymous functions, callbacks, pointers to functions, names of
!         functions that can be invoked at run time with EVAL, lambda
!         expressions, etc. (list is not exhaustive)
! 
! It is highly recommended for the solution to be absracted enought to let
! the inputs to be given separated from the solution, this is, the
! solution should be coded as its final place is inside a library which is
! invoked with specific values or parameters. It is not required for the
! solution to contain the necessary code be an actual library, it is
! enough that the code of the solution is separarted from the code of the
! invocation.
! 
! Accesing environment objects. When interpretation produces graphical
! output, it is common to have objects that operations should access, such
! as graphic handlers, a stack, etc. A solution is to define the
! operations requestng such objects as parameters. Another (maybe better)
! option is to use closures.
! 
! If there already exists a library, package, etc. for your language to
! perform execution of L-systems, indicate the name of the library, how to
! get it, if it is open source, and examples of how to use it (see below).
! 
! Test cases
! 
! Provide one or more test cases of L-systems executed and interpreted by
! your solution.
! 
! References
! 
! -   -   Wikipedia: L-system


