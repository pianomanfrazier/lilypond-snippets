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

  <e b'>4 <e a> <d a'> <d g> <c g'> <c f>
}

harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4:maj7 f:maj7 bes:maj7 ees:maj7 aes:maj7 des:maj7
}

\score {
  <<
    \new ChordNames {
      \harmonies
    }
    \new Staff = "lower" \lower
  >>
  \layout { }
}
