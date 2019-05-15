# Lilypond Snippets

This repository contains a bunch of useful references for lilypond. This is mostly as a reference for myself as I write my [own music blog](http://www.frazierpianostudio.com)

There are also some helper scripts to compile the snippets in various formats.

## How to use lily.py

This compiles the lilyfile with lilypond

Here is an example run of the script:

```bash
./lily.py --in ./blog/circle_of_fifths/snippet/rootless.ly --outputdir ../website/static/img/ --preview
```

And if you want to compile all in a directory:

```bash
./compile_all.sh ./blog/circle_of_fifths/snippet ../website/static/img/ --preview
```

It follows the form of `./compile.sh <input/dir> <output/dir> <optional preview flag>`

## Optimize SVG for the web

Install svgo from npm and use the provided svgo.yml. The output is aggressive and will only work for embedded SVG images in HTML.

```bash
npm i -g svgo
svgo --config=svgo.yml piano_score.svg -o piano_score.min.svg
```
