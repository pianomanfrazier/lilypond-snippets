\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <\tweak color #red bes c \tweak color #red e> <\tweak color #red a c \tweak color #red f> <aes bes d> <g bes ees> |
  <ges aes c> <f aes des> <e fis ais> <dis fis b> \bar "|."
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
  c4 f bes, ees aes, des fis, b
}
harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4 f bes ees aes des fis b
}
fb = \figuremode {
  <7>4 s <7> s <7> s <7> s
}

\score {
  
  \new PianoStaff <<
    \new ChordNames {
      \harmonies
    }
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
    \new FiguredBass = "figures" \fb
  >>
  \layout { }
}
