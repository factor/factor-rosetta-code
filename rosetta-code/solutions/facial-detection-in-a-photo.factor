! Description
! 
! Facial detection has become a ubiquitous technology in today's world,
! integrated seamlessly into smartphone cameras, social media tagging
! features, retail analytics, and digital security systems.
! 
! It is important to distinguish between facial detection and facial
! recognition:
! 
! - Facial Detection (the scope of this task) is the process of
!   identifying and locating the presence of human faces within an
!   arbitrary digital image. It simply answers the question: "Is there a
!   face here, and where is it?"
! - Facial Recognition goes a step further by comparing the detected face
!   against a database of known faces to verify or establish an
!   individual's specific identity. It answers the question: "Who does
!   this face belong to?" Facial recognition is not part of this task.
! 
! Goal
! 
! The objective of this task is to programmatically detect individual
! human faces within a specific family portrait photograph and output
! basic localization metadata for each face found.
! 
! Requirements
! 
! 1. **Source Image:** Download and process the following public domain
! photograph from Wikimedia Commons and provide information about each
! face detected:
! 
!   File:AOBABA176.jpg
! 
!  Or use this copy:
!  [AOBABA176.jpg]
! 
! 2. **Detection:** Detect the human faces present in the image using any
! native features, computer vision libraries (such as OpenCV, dlib), or
! external APIs available in your programming language.
! 
! 3. **Output:** Provide basic tracking information for each detected
! face. At a minimum, your code must display or print the total count of
! detected faces and the bounding box coordinates (e.g., `[X, Y, Width,
! Height]` or `[Top, Right, Bottom, Left]`) for each face.
! 
! 4. **(Optional):** Displaying the image with visual bounding boxes drawn
! over the faces, and/or showing additional information about each face,
! is highly encouraged but not strictly required.


