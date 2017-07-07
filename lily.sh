#!/usr/bin/env bash

# produce lilypond snippet of first line as an SVG 

## Make svg for the web
lilypond -dpreview -dbackend=svg --output=temp src/$1.ly
cp temp/$1.preview.svg ../pianoblog/static/img/$1.svg
