\version "2.18.2"

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  <c, e g> <c f a> <bes d f> <bes ees g> <aes c ees>4 <aes des f>
}
harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4 f bes ees aes des
}

\score {
    
    <<
    \new ChordNames {
      \harmonies
    }
    \new Staff = "upper" \upper
  >>
    \layout { }
}
