! The task is to create a new file called "TAPE.FILE" of any size on
! Magnetic Tape.

USING: io.encodings.ascii io.files kernel system ;

"Hello from Rosetta Code!"
os windows? "tape.file" "/dev/tape" ?
ascii set-file-contents
