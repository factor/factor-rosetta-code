! The following is supposedly a question given to mathematics graduates
! seeking jobs on Wall Street:
! 
!    A revolver handgun has a revolving cylinder with six chambers for bullets.
!      
!    It is loaded with the following procedure:
! 
!        1. Check the first chamber to the right of the trigger for a bullet.  If a bullet
!           is seen, the cylinder is rotated one chamber clockwise and the next chamber
!           checked until an empty chamber is found.
! 
!        2. A cartridge containing a bullet is placed in the empty chamber.
! 
!        3. The cylinder is then rotated one chamber clockwise.
!      
!    To randomize the cylinder's position, the cylinder is spun, which causes the cylinder to take
!    a random position from 1 to 6 chamber rotations clockwise from its starting position.
!      
!    When the trigger is pulled the gun will fire if there is a bullet in position 0, which is just
!    counterclockwise from the loading position.
!      
!    The gun is unloaded by removing all cartridges from the cylinder.
!      
!    According to the legend, a suicidal Russian imperial military officer plays a game of Russian
!    roulette by putting two bullets in a six-chamber cylinder and pulls the trigger twice.
!    If the gun fires with a trigger pull, this is considered a successful suicide.
!      
!    The cylinder is always spun before the first shot, but it may or may not be spun after putting
!    in the first bullet and may or may not be spun after taking the first shot.
!      
!    Which of the following situations produces the highest probability of suicide?
!      
!      A. Spinning the cylinder after loading the first bullet, and spinning again after the first shot.
! 
!      B. Spinning the cylinder after loading the first bullet only.
! 
!      C. Spinning the cylinder after firing the first shot only.
! 
!      D. Not spinning the cylinder either after loading the first bullet or after the first shot.
! 
!      E. The probability is the same for all cases.
! 
! Task:
! 
! 1.  Run a repeated simulation of each of the above scenario, calculating
!     the percentage of suicide with a randomization of the four spinning,
!     loading and firing order scenarios.
! 2.  Show the results as a percentage of deaths for each type of
!     scenario.
! 3.  The hand calculated probabilities are 5/9, 7/12, 5/9, and 1/2. A
!     correct program should produce results close enough to those to
!     allow a correct response to the interview question.
! 
! Reference:
! 
! Youtube video on the Russian 1895 Nagant revolver
! https://www.youtube.com/watch?v=Dh1mojMaEtM

USING: accessors assocs circular formatting fry kernel literals
math random sequences ;
IN: rosetta-code.roulette

CONSTANT: cyl $[ { f f f f f f } <circular> ]

: cylinder ( -- seq ) cyl [ drop f ] map! ;

: load ( seq -- seq' )
    0 over nth [ dup rotate-circular ] when
    t 0 rot [ set-nth ] [ rotate-circular ] [ ] tri ;

: spin ( seq -- seq' ) [ 6 random 1 + + ] change-start ;

: fire ( seq -- ? seq' )
    [ 0 swap nth ] [ rotate-circular ] [ ] tri ;

: LSLSFSF ( -- ? ) cylinder load spin load spin fire spin fire drop or ;
: LSLSFF  ( -- ? ) cylinder load spin load spin fire fire drop or ;
: LLSFSF  ( -- ? ) cylinder load load spin fire spin fire drop or ;
: LLSFF   ( -- ? ) cylinder load load spin fire fire drop or ;

: percent ( ... n quot: ( ... -- ... ? ) -- ... x )
    0 -rot '[ _ call( -- ? ) 1 0 ? + ] [ times ] keepd /f 100 * ; inline

: run-test ( description quot -- )
    100,000 swap percent
    "Method <%s> produces %.3f%% deaths.\n" printf ;

: main ( -- )
    {
        { "load, spin, load, spin, fire, spin, fire" [ LSLSFSF ] }
        { "load, spin, load, spin, fire, fire" [ LSLSFF ] }
        { "load, load, spin, fire, spin, fire" [ LLSFSF ] }
        { "load, load, spin, fire, fire" [ LLSFF ] }
    } [ run-test ] assoc-each ;

MAIN: main
