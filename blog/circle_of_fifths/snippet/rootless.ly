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
  \stemUp

  < e b'>4
  < e a>
  < d a'>
  < d g>
  < c g'>
  < c f>
}

bassline = \relative c {
  \hide Stem
  \tweak Accidental.color #grey \tweak color #grey c4
  \tweak Accidental.color #grey \tweak color #grey f,
  \tweak Accidental.color #grey \tweak color #grey bes 
  \tweak Accidental.color #grey \tweak color #grey ees,
  \tweak Accidental.color #grey \tweak color #grey aes 
  \tweak Accidental.color #grey \tweak color #grey des, 
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
    \new Staff = "lower" {
      <<
        \new Voice \lower
        \new Voice \bassline
      >> \oneVoice
    }
  >>
  \layout { }
}
