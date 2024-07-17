! When neglecting the influence of other objects, two celestial bodies
! orbit one another along a conic trajectory. In the orbital plane, the
! polar equation is thus:
! 
! r = L/(1 + e cos(angle))
! 
! L , e and angle are respectively called semi-latus rectum, eccentricity
! and true anomaly. The eccentricity and the true anomaly are two of the
! six so-called orbital elements often used to specify an orbit and the
! position of a point on this orbit.
! 
! The four other parameters are the semi-major axis, the longitude of the
! ascending node, the inclination and the argument of periapsis. An other
! parameter, called the gravitational parameter, along with dynamical
! considerations described further, also allows for the determination of
! the speed of the orbiting object.
! 
! The semi-major axis is half the distance between perihelion and
! aphelion. It is often noted a, and it's not too hard to see how it's
! related to the semi-latus-rectum:
! 
! a = L/(1 - e²)
! 
! The longitude of the ascending node, the inclination and the argument of
! the periapsis specify the orientation of the orbiting plane with respect
! to a reference plane defined with three arbitrarily chosen reference
! distant stars.
! 
! The gravitational parameter is the coefficent GM in Newton's
! gravitational force. It is sometimes noted µ and will be chosen as one
! here for the sake of simplicity:
! 
! µ = GM = 1
! 
! As mentioned, dynamical considerations allow for the determination of
! the speed. They result in the so-called vis-viva equation:
! 
! v² = GM(2/r - 1/a)
! 
! This only gives the magnitude of the speed. The direction is easily
! determined since it's tangent to the conic.
! 
! Those parameters allow for the determination of both the position and
! the speed of the orbiting object in cartesian coordinates, those two
! vectors constituting the so-called orbital state vectors.
! 
! Task:
! 
! Show how to perform this conversion from orbital elements to orbital
! state vectors in your programming language.
! 
! TODO: pick an example from a reputable source, and bring the algorithm
! description onto this site. (Restating those pages in concise a fashion
! comprehensible to the coders and readers of this site will be a good
! exercise.)


