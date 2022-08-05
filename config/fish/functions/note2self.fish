function note2self
  set -l tmpfile /tmp/note2self.txt

  $EDITOR $tmpfile

  if test -f $tmpfile
    cat $tmpfile | mail -s "Note to self" victor+review@sub.pro.br
	  rm $tmpfile
  end
end

function n2s
    echo $argv | mail -s "Note to self" victor+review@sub.pro.br
end

