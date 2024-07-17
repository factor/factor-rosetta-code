! The object of the task is to show how to minimize the exposure of secret
! data, basically to remove it or render it unrecoverable at a point in
! time such as a specific event (e.g. authorization of a transaction,
! completion of a transaction, completion of a process, removal of plain
! text after encryption, etc.
! 
! Some of you may find this task a bit unusual in that it doesn't
! demonstrate a specific algorithm, derive a specific output, or
! demonstrate a visible functionality. It's about how you can meet a
! security requirement in your language. It's also a security requirement
! that hasn't been explicitly thought through in the design of many
! languages (Hint: it is entirely possible that it may not be possible in
! all languages). There isn't going to be a single right answer or
! solution and it isn't about translating from another language. Even
! similar types of languages or even different implementations of the same
! language could have dissimilar solutions. The idea is to show how your
! language can protect secrets in memory from all comers!
! 
! Why this task? It reflects the growing need to better protect secrets as
! well as changes in best practices being driven by security standards.
! 
! The point is to help developers by providing patterns that they could
! actually use to use to achieve these objectives.
! 
! For the purposes of this task:
! 
! - secrets: information like credit card or social insurance numbers,
! passwords, cryptographic keys or IV's, random number seeds, etc. -
! threats: things like memory scrapers that may not even be written in the
! same language - don't assume the only threat is code written in your
! language.
! 
! The object of the task is to show how to minimize the exposure of secret
! data, basically to remove it or render it unrecoverable at a point in
! time such as a specific event (e.g. authorization of a transaction,
! completion of a transaction, completion of a process, removal of plain
! text after encryption, etc.
! 
! Task:
! 
! The basic task is:
! 
! -   read a secret into memory
! -   write or display the secret
! -   securely erase or destroy the secret
! -   In all cases you will want to be careful of temporary variables,
!     system calls, and other things that could leave plain-text
!     artifacts.
! 
! How you accomplish this will depend on your language and your knowledge
! of its memory management:
! 
! In all of these variations take care not to contaminate temporary
! variables, the stack, etc. with function calls or conversions.
! 
! 1. Unmanaged Memory (programmer managed)
! 
! In languages like C, assembly, etc. this can be as simple as zeroing all
! of the data after use and before freeing. Take care not to contaminate
! temporary variables, the stack, etc.
! 
! 2. Managed Memory (garbage collectors)
! 
! In languages like Java and .Net which manage memory for the programmer
! this can be challenging. Many of these represent some types of data
! (e.g. strings) as immutable objects so zeroing them isn't possible.
! Simply discarding them and waiting for the garbage collector to possibly
! sort things out doesn't meet the intent. If your language has a type for
! secrets or a guaranteed destructor that would work this is exactly what
! this task is for.
! 
! a) If possible switch to a mutable data type. In some languages strings
! are immutable but arrays of single characters or even numbers are not
! and can be "zeroed" out.
! 
! b) If you can't switch to mutable type, there may be techniques to
! constrain the data and force a local memory clean up.
! 
! c) Data obfuscation techniques may be possible.
! 
! d) In-memory encryption may be possible using a language or platform
! feature (No DIY).
! 
! e) Call out to a platform function or API that will contain and manage
! the secret.
! 
! f) Call out to a custom external function that will or could maintain
! and manage the secret (just show an external call, no need to write the
! external function).
! 
! g) Something completely different that achieves the same goal.
! 
! Part of your solution will be describe what you are doing and the
! "secret sauce" that lets it work (i.e. how you overcame challenges).
! References (links, book references) to supporting language features,
! APIs, etc. will be important to any developer needing to use this
! technique to comply with a standard.
! 
! References:
! 
! If anyone has examples of similar regulations or standards please add
! them below or on the talk page.
! 
! PCI Point-to-Point-Encryption (P2PE) Standard (v3.1) PCI P2PE Standard
! see requirements 2A-2.3 & 2B-1.5
! 
! -   has two types of secrets called PAN (Primary Account Number) and SAD
!     (Sensitive Authentication Data)
! -   don't keep secrets in working memory any longer than strictly
!     necessary
! -   developers should have secure coding training for their language
!     that includes managing sensitive data in memory
! 
! PCI Secure Software Standard (v1.2) PCI Secure Software Standard see
! requirements 1.1 & 3.5
! 
! -   has a broader definition of secrets or sensitive information
! -   implement methods to render transient sensitive data irretrievable
!     and to confirm that sensitive data is unrecoverable after the
!     process is complete even if it is only stored temporarily in program
!     memory / variables during operation of the software
! -   requires knowledge of any platform or implementation level issues
!     that complicate the erasure of transient sensitive data and to
!     confirm that methods have been implemented to minimize the risk
!     posed by these complications (methods may be external to your
!     language).
! 
! See also Reddit discussion of the issue


