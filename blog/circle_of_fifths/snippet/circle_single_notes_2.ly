\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  \tweak color #magenta \tweak Stem.color #magenta c f, bes ees, aes des, ges b, e a, d g, \tweak color #magenta \tweak Stem.color #magenta c
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
