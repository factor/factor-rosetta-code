! The task is to crop a given audio waveform file, removing any leading or
! trailing silence from the wave file, leaving just the audible sound.
! 
! The task should utilize a configurable audio squelch level calibration
! parameter that enables the user to set the silence level threshold
! (enabling low level background hiss or hum to be removed from the
! leading and trailing edges of the audio file.)
! 
! Moments of silence (below the squelch threshold), should be removed from
! the leading and trailing edges of the input wave file, to produce a new
! cleanly cropped audio file.
! 
! Note that the output file format should be the same as the initial input
! format. This should not be changed by the implemented procedure.


