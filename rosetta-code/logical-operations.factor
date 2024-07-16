! Task:
! 
! Write a function that takes two logical (boolean) values, and outputs
! the result of "and" and "or" on both arguments as well as "not" on the
! first arguments.
! 
! If the programming language doesn't provide a separate type for logical
! values, use the type most commonly used for that purpose.
! 
! If the language supports additional logical operations on booleans such
! as XOR, list them as well.
! 
! Category:Simple

: logical-operators ( a b -- )
    {
        [ "xor is: " write xor . ]
        [ "and is: " write and . ]
        [ "or is:  " write or . ]
        [ "not is: " write drop not . ]
    } 2cleave ;
