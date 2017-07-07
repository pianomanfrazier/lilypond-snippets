%this will fit about 2 lines/ 4 measurs per line
#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 3 in))) paper-alist))

\paper {
    #(set-paper-size "my size")
}
%a5 is a half sheet
%\paper {
%   #(set-paper-size "a6landscape") 
%}
\header {
  tagline = ##f %remove default Lilypond footer
}
