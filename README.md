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
./compile_all.sh ./blog/circle_of_fifths/snippet --outputdir ../website/static/img/ --preview
```
