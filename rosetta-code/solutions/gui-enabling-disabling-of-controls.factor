! In addition to fundamental GUI component interaction, an application
! should dynamically enable and disable GUI components, to give some
! guidance to the user, and prohibit (inter)actions which are
! inappropriate in the current state of the application.
! 
! Task:
! 
! Similar to the task GUI component interaction, write a program that
! presents a form with three components to the user:
! 
! ::# a numeric input field ("Value")
! 
! ::# a button ("increment")
! 
! ::# a button ("decrement")
! 
! The field is initialized to zero. The user may manually enter a new
! value into the field, increment its value with the "increment" button,
! or decrement the value with the "decrement" button.
! 
! The input field should be enabled only when its value is zero. The
! "increment" button only as long as the field's value is less then 10:
! When the value 10 is reached, the button should go into a disabled
! state. Analogously, the "decrement" button should be enabled only as
! long as the value is greater than zero.
! 
! Effectively, the user can now either increment up to 10, or down to
! zero. Manually entering values outside that range is still legal, but
! the buttons should reflect that and enable/disable accordingly.


