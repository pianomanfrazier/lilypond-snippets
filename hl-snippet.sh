if [ "$#" -ne 2 ]; then
    echo "Must supply input file and output file"
else
  # clean out old file
  rm $2
  echo "<pre>" >> $2
  ly highlight -d full_html=false -d inline_style=true -d wrapper_tag=code -d document_id=language_lilypond $1 >> $2 
  echo "</pre>" >> $2
fi

