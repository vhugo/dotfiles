# Usage: envsource <path/to/env>

function envsource
  if test ! -e ".env"
    echo "Cannot find .env in the current directory"
    return
  end


  for line in (cat ".env" | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set -xg $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end
