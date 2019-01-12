% \include "gonville.ily"
\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4
  \partial 8 f8

  a4 b c d |
  \time 2/4
  e8 f g a
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  \partial 8 r8
  a2 c |
  \time 2/4
  e
}

fb = \figuremode {
  r8 <6>4 <4+ 2/> <6 5- >2 <7 _!>
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
    \new FiguredBass = "figures" \fb
  >>
  \layout { }
}
