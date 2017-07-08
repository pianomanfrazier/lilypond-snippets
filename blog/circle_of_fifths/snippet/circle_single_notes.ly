\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  c f, bes, s s
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  s2. ees4 aes,
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
}
