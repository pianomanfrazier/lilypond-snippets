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

  s1 s4
}

\score {
      \new Staff = "upper" \upper
   \layout { }
}
