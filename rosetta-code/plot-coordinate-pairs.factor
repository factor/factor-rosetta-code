! Task:
! 
! Plot a function represented as   x,y  numerical arrays.
! 
! Post the resulting image for the following input arrays (taken from
! Python's Example section on Time a function):
! 
!       x = {0,   1,    2,    3,    4,    5,     6,     7,     8,     9};
!       y = {2.7, 2.8, 31.4, 38.1, 58.0, 76.2, 100.5, 130.0, 149.3, 180.0};
! 
! This task is intended as a subtask for Measure relative performance of
! sorting algorithms implementations.

USING: accessors assocs colors.constants kernel sequences ui
ui.gadgets ui.gadgets.charts ui.gadgets.charts.lines ;

chart new { { 0 9 } { 0 180 } } >>axes
line new COLOR: blue >>color
9 <iota> { 2.7 2.8 31.4 38.1 58 76.2 100.5 130 149.3 180 } zip
>>data add-gadget "Coordinate pairs" open-window
