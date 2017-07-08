\version "2.18.2"

upper = \relative c''' {
  \clef treble
  \key c \major
  \time 4/4

  <c g c,> <c, f a> <bes' f bes,> <bes,! ees g> |
  <aes' ees aes,> <aes, des f> <fis' cis fis,> <fis, b dis> \bar "|."
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
  e4 f d ees c des ais b
}
harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4 f bes ees aes des fis b
}
fb = \figuremode {
  <6>4 s <6> s <6> s <6> s
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
