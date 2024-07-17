! In order to represent evolutions of contents over time, the SMIL
! standard provides a solution to record the animation of data. Smil
! animations can be added to any kind of contents formated in XML.
! 
! -   SMIL on Wikipedia and at W3
! 
! The task is to create an utility that given the first Smiled XML file,
! would return the following ones:
! 
!     <?xml version="1.0" ?>
!     <smil>
!     <X3D>
!       <Scene>
!         <Viewpoint position="0 0 8" orientation="0 0 1 0"/>
!         <PointLight color='1 1 1' location='0 2 0'/>
!         <Shape>
!           <Box size='2 1 2'>
!             <animate attributeName="size" from="2 1 2"
!                                             to="1 2 1" begin="0s" dur="10s"/>
!           </Box>
!           <Appearance>
!             <Material diffuseColor='0.0 0.6 1.0'>
!               <animate attributeName="diffuseColor" from="0.0 0.6 1.0"
!                                                       to="1.0 0.4 0.0" begin="0s" dur="10s"/>
!             </Material>
!           </Appearance>
!         </Shape>
!       </Scene>
!     </X3D>
!     </smil>
! 
! At t = 0 second here is the expected output:
! 
!     <?xml version="1.0" ?>
!     <X3D>
!       <Scene>
!         <Viewpoint position="0 0 8" orientation="0 0 1 0"/>
!         <PointLight color='1 1 1' location='0 2 0'/>
!         <Shape>
!           <Box size='2 1 2'/>
!           <Appearance>
!             <Material diffuseColor='0.0 0.6 1.0'/>
!           </Appearance>
!         </Shape>
!       </Scene>
!     </X3D>
! 
! At t = 2 second here is the expected output:
! 
!     <?xml version="1.0" ?>
!     <X3D>
!       <Scene>
!         <Viewpoint position="0 0 8" orientation="0 0 1 0"/>
!         <PointLight color='1 1 1' location='0 2 0'/>
!         <Shape>
!           <Box size='1.8 1.2 1.8'/>
!           <Appearance>
!             <Material diffuseColor='0.2 0.56 0.8'/>
!           </Appearance>
!         </Shape>
!       </Scene>
!     </X3D>


