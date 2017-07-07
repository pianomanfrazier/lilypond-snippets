\include "gonville.ily"
\version "2.18.2"
\header {
  title="7th Chord Figured Bass worksheet"
}

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4
  s1
  s
  \bar "||"
  \key d \major
  s
  s
  \bar "||"
  \key f \major
  s
  s
  \bar "||"
  \key f \major
  s
  s
  \bar "|."

}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
  e2
  f
  g,
  d'
  \key d \major
  a
  b
  cis
  d
  \key f \major
  bes
  b
  cis
  d
  \key ees \major
  c
  d
  ees
  g
}

fb = \figuremode {
  <6>2 <4 2> <6 5> <7 _!>
  s    <4 3> <7>   <6 5>
  <7>2 <4 2> <6 5> <6>
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
    \new FiguredBass = "figures" \fb
  >>
  \layout{ indent=0.0 }
}
