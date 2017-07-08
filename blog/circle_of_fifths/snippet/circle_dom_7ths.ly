\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <e, bes'> <ees a> <d aes'> <des g> <c ges'> <ces f>
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  c f bes, ees aes, des
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
}
