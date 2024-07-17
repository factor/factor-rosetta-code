! The transportation problem in linear programming is to find the optimal
! transportation plan for certain volumes of resources from suppliers to
! consumers, taking into account the cost of transportation. The plan is a
! table (matrix), whose rows and columns correspond to the suppliers and
! consumers, the cells are placed in cargo volume.
! 
! Example of the transportation problem:
! 
!     
! 
!         {| border="1" style="border-collapse: collapse; border: 1px
!         solid black; text-align: center;"
! 
! |- !style="width:100pt"| !style="width:100pt"|Consumer 1,
! need 20 kg !style="width:100pt"|Consumer 2,
! need 30 kg !style="width:100pt"|Consumer 3,
! need 10 kg |- !Supplier 1,
! supply 25 kg |$3 per kg |$5 per kg |$7 per kg |- !Supplier 2,
! supply 35 kg |$3 per kg |$2 per kg |$5 per kg |}
! 
! The object is to solve the classical transport problem using the method
! of potentials (with redistributive cycle) with the preparation of the
! initial transportation plan by the north-west corner of the features to
! be implemented in this task. The input is the number of suppliers and
! customers, inventory levels, needs and cost matrix transport cargo. The
! output of the program is the optimal plan. If necessary, enter a
! fictitious vendor or customer.
! 
! The solution for the above example would be the plan:
! 
!     
! 
!         {| border="1" style="border-collapse: collapse; border: 1px
!         solid black; text-align: center;"
! 
! |- !style="width:100pt"| !style="width:100pt"|Consumer 1
! !style="width:100pt"|Consumer 2 !style="width:100pt"|Consumer 3 |-
! !Supplier 1 | 20 kg | - | 5 kg |- !Supplier 2 | - | 30 kg | 5 kg |}
! 
! See also:
! 
! -   The Transportation Problem
! -   [https://www.youtube.com/watch?v=BI1SsbDg0vQ&list=PLlCWmLrQuBh1yHhpDfULpRGoTuLgeDB4X|
!     Transportation model - Concepts (youtube)]
! 
! Related tasks:
! 
! -   Vogel's approximation method


