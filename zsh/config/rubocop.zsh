_process_rcop() {
  FILE="$1"
  OKMSG="OK"
  PAD=$(printf '%0.1s' "."{1..100})
  REMOTEDIR=${FILE%/*}
  EXTENSION=${FILE##*.}
  if [ "$EXTENSION" =~ "(rb|ruby)" ]; then
    RUBOCOP_ERROR=$($HOME/.rvm/bin/rvm-auto-ruby -S rubocop -S -f c --color \
      -c $HOME/.rubocop.yml $FILE)

    if [ $? -eq 0 ]; then
      printf '- %s%*.*s%s\n' "$FILE" 0 $(( 80 - ${#FILE} - ${#OKMSG} )) "$PAD" "$OKMSG"
    else
      echo -e $RUBOCOP_ERROR
      return 1
    fi
  fi
}

rcopch() {
  for file in $(git diff --name-only); do
    _process_rcop $file
    if [ $? -ne 0 ]; then
      return 1
    fi
  done
  for file in $(git ls-files --others --exclude-standard); do
    _process_rcop $file
    if [ $? -ne 0 ]; then
      return 1
    fi
  done
}

rcopst() {
  for file in $(git diff --staged --name-only); do
    _process_rcop $file
    if [ $? -ne 0 ]; then
      return 1
    fi
  done
}
