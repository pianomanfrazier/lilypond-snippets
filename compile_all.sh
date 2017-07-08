#!/bin/bash

## This script is a light wrapper around lily.py to
## compile all lilypond files in a directory
##
## example:
##   ./compile_all.sh input/dir output/dir -p
##   
##   the "-p" is optional as it is the preview flag for python script

for i in $1/*.ly;
do
  echo "processing $i"
  ./lily.py -i $i -o $2 $3
done
