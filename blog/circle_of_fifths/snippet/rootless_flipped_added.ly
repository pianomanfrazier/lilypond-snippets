\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4
  
  c f, bes ees, aes des,
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  <b' e g>4 <a e' g> <a d f> <g d' f> <c g e'> <c f, e'>
}

harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4:maj7 f:maj7 bes:maj7 ees:maj7 aes:maj7 des:maj7
}

\score {
  <<
    \new ChordNames {
      \harmonies
    }
    \new Staff = "lower" \lower
  >>
  \layout { }
}
