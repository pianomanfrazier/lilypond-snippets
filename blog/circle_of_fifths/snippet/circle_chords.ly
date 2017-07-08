\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <c e g> <f, a c> <bes d f> <ees, g bes> <aes c ees> <des, f aes>
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  s1
}

\score {
    \new Staff = "upper" \upper
    \layout { }
}
