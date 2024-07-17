! RPG = Role Playing Game.
! 
! You're running a tabletop RPG, and your players are creating characters.
! 
! Each character has six core attributes: strength, dexterity,
! constitution, intelligence, wisdom, and charisma.
! 
! One way of generating values for these attributes is to roll four,
! 6-sided dice (d6) and sum the three highest rolls, discarding the lowest
! roll.
! 
! Some players like to assign values to their attributes in the order
! they're rolled.
! 
! To ensure generated characters don't put players at a disadvantage, the
! following requirements must be satisfied:
! 
! -   The total of all character attributes must be at least 75.
! -   At least two of the attributes must be at least 15.
! 
! However, this can require a lot of manual dice rolling. A programatic
! solution would be much faster.
! 
! Task:
! 
! Write a program that:
! 
! 1.  Generates 4 random, whole values between 1 and 6.
! 2.  Saves the sum of the 3 largest values.
! 3.  Generates a total of 6 values this way.
! 4.  Displays the total, and all 6 values once finished.
! 
! -   The order in which each value was generated must be preserved.
! -   The total of all 6 values must be at least 75.
! -   At least 2 of the values must be 15 or more.
! 
! Category:Simple

USING: combinators.short-circuit dice formatting io kernel math
math.statistics qw sequences ;
IN: rosetta-code.rpg-attributes-generator

CONSTANT: stat-names qw{ Str Dex Con Int Wis Cha }

: attribute ( -- n )
    4 [ ROLL: 1d6 ] replicate 3 <iota> kth-largests sum ;
    
: stats ( -- seq ) 6 [ attribute ] replicate ;

: valid-stats? ( seq -- ? )
    { [ [ 15 >= ] count 2 >= ] [ sum 75 >= ] } 1&& ;
    
: generate-valid-stats ( -- seq )
    stats [ dup valid-stats? ] [ drop stats ] until ;
    
: stats-info ( seq -- )
    [ sum ] [ [ 15 >= ] count ] bi
    "Total: %d\n# of attributes >= 15: %d\n" printf ;
    
: main ( -- )
    generate-valid-stats dup stat-names swap
    [ "%s: %d\n" printf ] 2each nl stats-info ;
    
MAIN: main
