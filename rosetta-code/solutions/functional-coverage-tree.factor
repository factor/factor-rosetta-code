! Functional coverage is a measure of how much a particular function of a
! system has been verified as correct. It is used heavily in tracking the
! completeness of the verification of complex System on Chip (SoC)
! integrated circuits, where it can also be used to track how well the
! functional requirements of the system have been verified.
! 
! This task uses a sub-set of the calculations sometimes used in tracking
! functional coverage but uses a more familiar(?) scenario.
! 
! Task Description:
! 
! The head of the clean-up crews for "The Men in a very dark shade of grey
! when viewed at night" has been tasked with managing the cleansing of two
! properties after an incident involving aliens.
! 
! She arranges the task hierarchically with a manager for the crews
! working on each house who return with a breakdown of how they will
! report on progress in each house.
! 
! The overall hierarchy of (sub)tasks is as follows,
! 
!     cleaning
!         house1
!             bedrooms
!             bathrooms
!                 bathroom1
!                 bathroom2
!                 outside lavatory
!             attic
!             kitchen
!             living rooms
!                 lounge
!                 dining room
!                 conservatory
!                 playroom
!             basement
!             garage
!             garden
!         house2
!             upstairs
!                 bedrooms
!                     suite 1
!                     suite 2
!                     bedroom 3
!                     bedroom 4
!                 bathroom
!                 toilet
!                 attics
!             groundfloor
!                 kitchen
!                 living rooms
!                     lounge
!                     dining room
!                     conservatory
!                     playroom
!                 wet room & toilet
!                 garage
!                 garden
!                 hot tub suite
!             basement
!                 cellars
!                 wine cellar
!                 cinema
! 
! The head of cleanup knows that her managers will report fractional
! completion of leaf tasks (tasks with no child tasks of their own), and
! she knows that she will want to modify the weight of values of
! completion as she sees fit.
! 
! Some time into the cleaning, and some coverage reports have come in and
! she thinks see needs to weight the big house2 60-40 with respect to
! coverage from house1 She prefers a tabular view of her data where
! missing weights are assumed to be 1.0 and missing coverage 0.0.
! 
!     NAME_HIERARCHY                  |WEIGHT  |COVERAGE  |
!     cleaning                        |        |          |
!         house1                      |40      |          |
!             bedrooms                |        |0.25      |
!             bathrooms               |        |          |
!                 bathroom1           |        |0.5       |
!                 bathroom2           |        |          |
!                 outside_lavatory    |        |1         |
!             attic                   |        |0.75      |
!             kitchen                 |        |0.1       |
!             living_rooms            |        |          |
!                 lounge              |        |          |
!                 dining_room         |        |          |
!                 conservatory        |        |          |
!                 playroom            |        |1         |
!             basement                |        |          |
!             garage                  |        |          |
!             garden                  |        |0.8       |
!         house2                      |60      |          |
!             upstairs                |        |          |
!                 bedrooms            |        |          |
!                     suite_1         |        |          |
!                     suite_2         |        |          |
!                     bedroom_3       |        |          |
!                     bedroom_4       |        |          |
!                 bathroom            |        |          |
!                 toilet              |        |          |
!                 attics              |        |0.6       |
!             groundfloor             |        |          |
!                 kitchen             |        |          |
!                 living_rooms        |        |          |
!                     lounge          |        |          |
!                     dining_room     |        |          |
!                     conservatory    |        |          |
!                     playroom        |        |          |
!                 wet_room_&_toilet   |        |          |
!                 garage              |        |          |
!                 garden              |        |0.9       |
!                 hot_tub_suite       |        |1         |
!             basement                |        |          |
!                 cellars             |        |1         |
!                 wine_cellar         |        |1         |
!                 cinema              |        |0.75      |
! 
! Calculation:
! 
! The coverage of a node in the tree is calculated as the weighted average
! of the coverage of its children evaluated bottom-upwards in the tree.
! 
! The task is to calculate the overall coverage of the cleaning task and
! display the coverage at all levels of the hierarchy on this page, in a
! manner that visually shows the hierarchy, weights and coverage of all
! nodes.
! 
! Extra Credit:
! 
! After calculating the coverage for all nodes, one can also calculate the
! additional/delta top level coverage that would occur if any (sub)task
! were to be fully covered from its current fractional coverage. This is
! done by multiplying the extra coverage that could be gained 1 − coverage
! for any node, by the product of the `powers` of its parent nodes from
! the top down to the node.
! 
! The power of a direct child of any parent is given by the power of the
! parent multiplied by the weight of the child divided by the sum of the
! weights of all the direct children.
! 
! The pseudo code would be:
! 
!    method delta_calculation(this, power):
!        sum_of_weights = sum(node.weight for node in children)
!        this.delta  = (1 - this.coverage) * power
!        for node in self.children:
!            node.delta_calculation(power * node.weight / sum_of_weights)
!        return this.delta
! 
! Followed by a call to:
! 
!    top.delta_calculation(power=1)
! 
! Note: to aid in getting the data into your program you might want to use
! an alternative, more functional description of the starting data given
! on the discussion page.


