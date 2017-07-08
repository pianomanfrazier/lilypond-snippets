\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <ees, bes'> <ees! aes> <des aes'!> <des! ges>
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  c f bes, ees
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
}
