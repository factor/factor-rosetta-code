! Context: In December 2013 a patch was proposed to the coreutils list to
! add a --color option to the commands md5sum and shaXsum to display the
! checksums in color to make it easier to visually identify similarities
! in a list of printed checksums. The patch was not accepted for inclusion
! and instead it was suggested to create a command line utility which can
! be used to pipe the output of the md5sum and shaXsum commands similar to
! the utility colordiff.
! 
! Task: The task is to create this command line utility that we can use to
! pipe the output of the md5sum and shaXsum commands and that colors the
! checksum part of the output. Take each group of 3 or 6 hexadecimal
! characters and interpret it as if it was a color code and print it with
! the closest console color. Print with colors if the output is the
! terminal or print the input unchanged if the output of the utility is a
! pipe.
! 
! Example:
! 
! $ md5sum coreutils-* | checksumcolor
! ab20d840e13adfebf2b6936a2dab071b  coreutils-8.29.tar.gz
! b259b2936bb46009be3f5cc06a12c32d  coreutils-8.30.tar.gz
! 03cf26420de566c306d340df52f6ccd7  coreutils-8.31.tar.gz


