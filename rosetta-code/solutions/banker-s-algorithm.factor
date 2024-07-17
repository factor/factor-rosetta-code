! The Banker's algorithm is a resource allocation and deadlock avoidance
! algorithm developed by Edsger Dijkstra that tests for safety by
! simulating the allocation of predetermined maximum possible amounts of
! all resources, and then makes a "s-state" check to test for possible
! deadlock conditions for all other pending activities, before deciding
! whether allocation should be allowed to continue.
! 
! Example input:
! 
! Assuming that the system distinguishes between four types of resources,
! (A, B, C and D), the following is an example of how those resources
! could be distributed.
! 
! Note that this example shows the system at an instant before a new
! request for resources arrives. Also, the types and number of resources
! are abstracted. Real systems, for example, would deal with much larger
! quantities of each resource.
! 
! Total resources in system:
! A B C D
! 6 5 7 6
! 
! Available system resources are:
! A B C D
! 3 1 1 2
! 
! Processes (currently allocated resources):
!    A B C D
! P1 1 2 2 1
! P2 1 0 3 3
! P3 1 2 1 0
! 
! Processes (maximum resources):
!    A B C D
! P1 3 3 2 2
! P2 1 2 3 4
! P3 1 3 5 0
! 
! Need= maximum resources - currently allocated resources
! Processes (need resources):
!    A B C D
! P1 2 1 0 1
! P2 0 2 0 1
! P3 0 1 4 0


