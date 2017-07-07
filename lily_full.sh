#!/usr/bin/env bash

## Make svg for the web
lilypond -dbackend=svg --output=temp src/$1.ly
mv temp/$1.svg ../pianoblog/static/img/
