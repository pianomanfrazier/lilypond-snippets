#!/usr/bin/env bash

# produce lilypond snippet of first line as an SVG 

## Make svg for the web
lilypond -dpreview -dbackend=svg --output=temp $1.ly

## Make pdf for latex
lilypond -dpreview --output=temp $1.ly
