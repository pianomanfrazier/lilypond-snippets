\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <e, b'> <e a> <d a'> <d g> <c g'> <c f>
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
