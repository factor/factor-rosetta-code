! Task:
! 
! Display the current CPU utilization, as a percentage, calculated from
! /proc/stat.
! 
! Background:
! 
! Most Linux kernels provide a virtual /proc filesystem, providing an
! interface to various internal data structures.
! 
! One of these internal structures (/proc/stat) includes information on
! the amount of time (in USER_HZ) spent in various states. From this
! information, we can, with a little effort, determine the current level
! of CPU utilization, as a percent of time spent in any states other than
! idle.
! 
! To do this:
! 
! :::# read the first line of /proc/stat
! 
! :::# discard the first word of that first line (it's always cpu)
! 
! :::# sum all of the times found on that first line to get the total time
! 
! :::# divide the fourth column ("idle") by the total time, to get the
! fraction of time spent being idle
! 
! :::# subtract the previous fraction from 1.0 to get the time spent being
! not idle
! 
! :::# multiple by 100 to get a percentage
! 
! The times in /proc/stat are monotonically increasing, and begin at some
! point during the kernel's initialization (ie during boot up). So the
! steps above will give the total CPU utilization since boot, which may or
! may not be useful to some. To get a more real-time utilization, we
! simply repeat the steps above with some small sleep interval in between,
! and instead of using the absolute total and idle times, we use use the
! total time delta and the idle time delta to compute the utilization.
! 
! This project is based on this blog post by Paul Colby, and the Bash
! version comes from there.


