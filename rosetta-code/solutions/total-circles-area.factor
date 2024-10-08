! [Example circles] [Example circles filtered]
! 
! Given some partially overlapping circles on the plane, compute and show
! the total area covered by them, with four or six (or a little more)
! decimal digits of precision. The area covered by two or more disks needs
! to be counted only once.
! 
! One point of this Task is also to compare and discuss the relative
! merits of various solution strategies, their performance, precision and
! simplicity. This means keeping both slower and faster solutions for a
! language (like C) is welcome.
! 
! To allow a better comparison of the different implementations, solve the
! problem with this standard dataset, each line contains the x and y
! coordinates of the centers of the disks and their radii (11 disks are
! fully contained inside other disks):
! 
!              xc              yc          radius
!          1.6417233788   1.6121789534   0.0848270516
!         -1.4944608174   1.2077959613   1.1039549836
!          0.6110294452  -0.6907087527   0.9089162485
!          0.3844862411   0.2923344616   0.2375743054
!         -0.2495892950  -0.3832854473   1.0845181219
!          1.7813504266   1.6178237031   0.8162655711
!         -0.1985249206  -0.8343333301   0.0538864941
!         -1.7011985145  -0.1263820964   0.4776976918
!         -0.4319462812   1.4104420482   0.7886291537
!          0.2178372997  -0.9499557344   0.0357871187
!         -0.6294854565  -1.3078893852   0.7653357688
!          1.7952608455   0.6281269104   0.2727652452
!          1.4168575317   1.0683357171   1.1016025378
!          1.4637371396   0.9463877418   1.1846214562
!         -0.5263668798   1.7315156631   1.4428514068
!         -1.2197352481   0.9144146579   1.0727263474
!         -0.1389358881   0.1092805780   0.7350208828
!          1.5293954595   0.0030278255   1.2472867347
!         -0.5258728625   1.3782633069   1.3495508831
!         -0.1403562064   0.2437382535   1.3804956588
!          0.8055826339  -0.0482092025   0.3327165165
!         -0.6311979224   0.7184578971   0.2491045282
!          1.4685857879  -0.8347049536   1.3670667538
!         -0.6855727502   1.6465021616   1.0593087096
!          0.0152957411   0.0638919221   0.9771215985
! 
! The result is 21.56503660... .
! 
! Related task:
! 
! -   Circles of given radius through two points.
! 
! See also:
! 
! -   http://www.reddit.com/r/dailyprogrammer/comments/zff9o/9062012_challenge_96_difficult_water_droplets/
! -   http://stackoverflow.com/a/1667789/10562
! 
! Category:Geometry


