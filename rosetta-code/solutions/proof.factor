! This task only makes sense for dependently-typed languages and proof
! assistants, or for languages with a type system strong enough to emulate
! certain dependent types. It does not ask you to implement a theorem
! prover yourself.
! 
! In the following task the word "define" implies the need to build the
! system of Peano axioms using the language itself, that is a way to
! construct natural and even natural numbers in the canonical forms, as
! well as a definition of the rules of addition and a way to construct all
! other acceptable terms. The word "prove" means that some form of logical
! unification is used (i.e., it requires a type checker in the case of
! languages ​​with dependent types and a verifying algorithm in the case of
! proof assistants). Thus, the metatheory of a language must be expressive
! enough to allow embedding of the Peano axioms and the opportunity to
! carry out constructive proofs. Examples of the trusted mathematical
! metatheories can be given: SystemF for Haskell, MLTT for Agda, CoC/CoIC
! for Coq.
! 
! Task:
! 
! 1.  To illustrate the possibility of type formation and type
!     introduction:
!     1.  Define a countably infinite set of natural numbers {0, 1, 2, 3,
!         ...}.
!     2.  Define a countably infinite set of even natural numbers {0, 2,
!         4, 6, ...} within the previously defined set of natural numbers.
!     3.  Define a countably infinite set of odd natural numbers {1, 3, 5,
!         7, ...} within the previously defined set of natural numbers.
! 2.  To illustrate the possibility of type elimination:
!     1.  Define the addition on natural numbers.
! 3.  To demonstrate constructive proofs:
!     1.  Prove that the addition of any two even numbers is even.
!     2.  Prove that the addition is always associative.
!     3.  Prove that the addition is always commutative.
!     4.  Try to prove that the addition of any two even numbers is odd
!         (it should be rejected).
! 4.  To demonstrate the ability of disproofs:
!     1.  Prove that the addition of any two even numbers cannot be odd.
!     2.  Try to prove that the addition of any two even numbers cannot be
!         even (it should be rejected).
! 
! 3. and 4. can't be done using a simple number enumeration since there is
! a countable many natural numbers which is quantified in propositions.


