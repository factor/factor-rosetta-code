! Create a simple implementation of the classic textual game Hunt the
! Wumpus.
! 
! The rules are:
! 
! The game is set in a cave that consists of a 20 room labyrinth. Each
! room is connected to 3 other rooms (the cave is modeled after the
! vertices of a dodecahedron). The objective of the player is to find and
! kill the horrendous beast Wumpus that lurks in the cave.
! 
! The player has 5 arrows. If they run out of arrows before killing the
! Wumpus, the player loses the game.
! 
! In the cave there are:
! 
! -   One Wumpus
! -   Two giant bats
! -   Two bottomless pits
! 
! If the player enters a room with the Wumpus, he is eaten by it and the
! game is lost.
! 
! If the player enters a room with a bottomless pit, he falls into it and
! the game is lost.
! 
! If the player enters a room with a giant bat, the bat takes him and
! transports him into a random empty room.
! 
! Each turn the player can either walk into an adjacent room or shoot into
! an adjacent room.
! 
! Whenever the player enters a room, he "senses" what happens in adjacent
! rooms. The messages are:
! 
! -   Nearby Wumpus: "You smell something terrible nearby."
! -   Nearby bat: "You hear a rustling."
! -   Nearby pit: "You feel a cold wind blowing from a nearby cavern."
! 
! When the player shoots, he wins the game if he is shooting in the room
! with the Wumpus. If he shoots into another room, the Wumpus has a 75% of
! chance of waking up and moving into an adjacent room: if this is the
! room with the player, he eats him up and the game is lost.


