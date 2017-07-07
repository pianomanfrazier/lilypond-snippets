\version "2.18.2"

melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  f4 e8[ c] d4 g
  a2 ~ a <f a c>1
}

harmonies = \chordmode {
  \set majorSevenSymbol = \markup {maj7} 
  c4:m f:min7 g:maj7.5-.9+.13
  c:aug
  d2:dim7 b:sus4 f1/g
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff \melody
  >>
  \layout{ }
}
