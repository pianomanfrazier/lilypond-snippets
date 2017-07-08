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

  <e bes' d>4 <ees a d> <d aes' c> <des g c> <c ges' bes> <ces f bes!>
}

harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7}
  c4:7 f:7 bes:7 ees:7 aes:7 des:7
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
