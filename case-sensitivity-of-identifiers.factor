! Three dogs (Are there three dogs or one dog?) is a code snippet used to
! illustrate the lettercase sensitivity of the programming language. For a
! case-sensitive language, the identifiers dog, Dog and DOG are all
! different and we should get the output:
! 
!     The three dogs are named Benjamin, Samba and Bernie.
! 
! For a language that is lettercase insensitive, we get the following
! output:
! 
!     There is just one dog named Bernie.
! 
! Related task:
! 
! -   Unicode variable names

USING: formatting locals ;
IN: scratchpad
[let
    "Benjamin" :> dog
    "Samba"    :> Dog
    "Bernie"   :> DOG
    { dog Dog DOG } "There are three dogs named %s, %s, and %s." vprintf
]
