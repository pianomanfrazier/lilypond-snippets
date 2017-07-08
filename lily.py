#!/usr/bin/env python3
"""
This script takes an input file or directory or lilypond files and compiles them.abs

example:

    $ lily.py --preview --in some/music.ly --outdir my/blog/static/img/

This will take the lilypond file and compile it with preview mode as an SVG and place it in the specified directory.
"""

import os
import sys
import argparse
from subprocess import call
import shutil

ap = argparse.ArgumentParser()
ap.add_argument('-i', '--in', type=str, required=True, help="an input file")
ap.add_argument('-o', '--outputdir', type=str,required=True, help="an output directory")
ap.add_argument('-p', '--preview', action='store_true', help="compile the first line preview")
args = vars(ap.parse_args())

def compile(filename, preview):
    if preview:
        print("Compiling preview for {} ...\n".format(filename))
        call("lilypond -dpreview -dbackend=svg --output=temp {}".format(args['in']), shell=True)
        print("\nCopying to {}".format(args['outputdir']))
        shutil.copy("./temp/{}.preview.svg".format(filename),"{}/{}.svg".format(args['outputdir'], filename) )
    else:
        print("Full compile of {} ...\n".format(filename))
        call("lilypond -dbackend=svg --output=temp {}".format(args['in']), shell=True)
        print("\nCopying to {}".format(args['outputdir']))
        shutil.copy("./temp/{}.svg".format(filename),"{}/{}.svg".format(args['outputdir'], filename) )

if __name__ == "__main__":
    #check if temp dir available
    if not os.path.exists('./temp'):
        os.mkdir('./temp')
    if not os.path.exists(args['outputdir']):
        sys.exit("The output directory doesn't exist")
    filename = os.path.splitext(args['in'])[0].split("/")[-1]
    compile(filename, args['preview'])
