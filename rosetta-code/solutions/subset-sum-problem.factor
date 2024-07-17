! Task:
! 
! Implement a function/procedure/method/subroutine that takes a
! set/array/list/stream/table/collection of words with integer weights,
! and identifies a non-empty subset of them whose weights sum to zero (cf.
! the Dropbox Diet candidate screening exercise and the Subset sum problem
! Wikipedia article).
! 
! For example:
! 
! This set of weighted words, one solution would be the set of words:
! 
! -   -   {elysee, efferent, deploy, departure, centipede, bonnet, balm,
!         archbishop}
! 
! because their respective weights of:
! 
! -   -   -326, 54, 44, 952, -658, 452, 397, and -915
! 
! sum to zero.
! 
!     
! 
!         {| style="text-align: left; width: 40%;" border="5"
!         cellpadding="2" cellspacing="2"
! 
! |+ Table of weighted words |- style="background-color: rgb(255, 204,
! 255);" ! word !! weight |- | alliance || -624 |- | archbishop || -915 |-
! | balm || 397 |- | bonnet || 452 |- | brute || 870 |- | centipede ||
! -658 |- | cobol || 362 |- | covariate || 590 |- | departure || 952 |- |
! deploy || 44 |- | diophantine || 645 |- | efferent || 54 |- | elysee ||
! -326 |- | eradicate || 376 |- | escritoire || 856 |- | exorcism || -983
! |- | fiat || 170 |- | filmy || -874 |- | flatworm || 503 |- | gestapo ||
! 915 |- | infra || -847 |- | isis || -982 |- | lindholm || 999 |- |
! markham || 475 |- | mincemeat || -880 |- | moresby || 756 |- | mycenae
! || 183 |- | plugging || -266 |- | smokescreen || 423 |- | speakeasy ||
! -745 |- | vein || 813 |}
! 
! Another solution would be the set of words {flatworm, gestapo, infra,
! isis, lindholm, plugging, smokescreen, speakeasy}, because their
! respective weights of 503, 915, -847, -982, 999, -266, 423, and -745
! also sum to zero.
! 
! You may assume the weights range from -1000 to 1000.
! 
! If there are multiple solutions, only one needs to be found.
! 
! Use any algorithm you want and demonstrate it on a set of at least 30
! weighted words with the results shown in a human readable form.
! 
! Note that an implementation that depends on enumerating all possible
! subsets is likely to be infeasible.


