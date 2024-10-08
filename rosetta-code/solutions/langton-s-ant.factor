! Langton's ant is a cellular automaton that models an ant sitting on a
! plane of cells, all of which are white initially, the ant facing in one
! of four directions.
! 
! Each cell can either be black or white.
! 
! The ant moves according to the color of the cell it is currently sitting
! in, with the following rules:
! 
! ::# If the cell is black, it changes to white and the ant turns left;
! 
! ::# If the cell is white, it changes to black and the ant turns right;
! 
! ::# The ant then moves forward to the next cell, and repeat from step 1.
! 
! This rather simple ruleset leads to an initially chaotic movement
! pattern, and after about 10000 steps, a cycle appears where the ant
! moves steadily away from the starting location in a diagonal corridor
! about 10 cells wide. Conceptually the ant can then walk infinitely far
! away.
! 
! Task:
! 
! Start the ant near the center of a 100x100 field of cells, which is
! about big enough to contain the initial chaotic part of the movement.
! 
! Follow the movement rules for the ant, terminate when it moves out of
! the region, and show the cell colors it leaves behind.
! 
! The problem has received some analysis; for more details, please take a
! look at the Wikipedia article (a link is below)..
! 
! See also:
! 
! -   Wikipedia: Langton's ant.
! 
! Related task:
! 
! -   Conway's Game of Life.
! -   Elementary cellular automaton


