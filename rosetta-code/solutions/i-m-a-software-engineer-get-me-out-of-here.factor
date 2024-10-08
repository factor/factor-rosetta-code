! Your latest contract has hit a snag. You came to update the army payroll
! system, but awoke this morning to the sound of mortars landing not far
! away and panicked generals banging on you door. The President has loaded
! his gold on trucks and needs to find the shortest route to safety. You
! are given the following map. The top left hand corner is (0,0). You and
! The President are located at HQ in the centre of the country (11,11).
! Cells marked 0 indicate safety. Numbers other than 0 indicate the number
! of cells that his party will travel in a day in any direction up, down,
! left, right, or diagonally.
! 
!              00000         
!           00003130000      
!         000321322221000    
!        00231222432132200   
!       0041433223233211100  
!       0232231612142618530  
!      003152122326114121200 
!      031252235216111132210 
!      022211246332311115210 
!     00113232262121317213200
!     03152118212313211411110
!     03231234121132221411410
!     03513213411311414112320
!     00427534125412213211400
!      013322444412122123210 
!      015132331312411123120 
!      003333612214233913300 
!       0219126511415312570  
!       0021321524341325100  
!        00211415413523200   
!         000122111322000    
!           00001120000      
!              00000         
! 
! Part 1 Use Dijkstra's algorithm to find a list of the shortest routes
! from HQ to safety.
! 
! Part 2
! 
! Six days later and you are called to another briefing. The good news is
! The President and his gold are safe, so your invoice may be paid if you
! can get out of here. To do this a number of troop repositions will be
! required. It is concluded that you need to know the shortest route from
! each cell to every other cell. You decide to use Floyd's algorithm.
! Print the shortest route from (21,11) to (1,11) and from (1,11) to
! (21,11), and the longest shortest route between any two points.
! 
! Extra Credit
! 
! 1.  Is there any cell in the country that can not be reached from HQ?
! 2.  Which cells will it take longest to send reinforcements to from HQ?
! 
! Related tasks:
! 
! 1.  Dijkstra's algorithm
! 2.  Floyd-Warshall algorithm
! 
! See also:
! 
! -   Back from the Klondike.


