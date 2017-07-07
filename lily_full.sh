#!/usr/bin/env bash

## Make svg for the web
lilypond -dbackend=svg --output=temp $1.ly
mv temp/$1.svg ../source/images/

## Make pdf for latex
lilypond --output=temp $1.ly
#mv temp/$1.png ../source/images/$1.png
cp temp/$1.pdf ../source/images/
