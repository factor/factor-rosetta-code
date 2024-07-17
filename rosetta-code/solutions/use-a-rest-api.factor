! To:
! 
! 1.  Create a 'get' function for the API, that can be used to get a list
!     of events for example.
! 2.  Create a 'post' function for the API, that can be used to create a
!     new venue or event for example.
! 
! Using the Meetup.com API.
! 
! Both functions take two parameters, 'details' and 'url'. Details is an
! object containing required and optional arguments specified by the API's
! requirement (Example, open events requires at least one detail). The
! 'url' supplied informs the get/post method what part of the API to ping
! (Example, valid URLs for 'get' could be ['/2/open_events'
! http://www.meetup.com/meetup_api/docs/2/open_events/] or ['/comments'
! http://www.meetup.com/meetup_api/docs/comments/]).
! 
! Some posting features are paid, such as creating an event. [Editing
! member details http://www.meetup.com/meetup_api/docs/2/member/#edit] for
! example, is an example of a free 'post' API.
! 
! An API key is assumed to be supplied through an api_key.txt file.
! 
! Solutions should be implemented without any meetup.com helper libraries,
! to make it easier to translate to languages which don't have such helper
! libraries. However, examples that do use helper libraries may be
! provided as an addition.
! 
! This task was created through Google Code-in.


