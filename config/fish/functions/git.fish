function g --wraps git --description 'alias g=git'
  if not test -n "$argv"
    git status
    return
  end

  git $argv
end

function ga --wraps "git add" --description 'alias ga=git add'
  git add $argv
end
