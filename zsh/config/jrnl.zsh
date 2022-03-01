export JRNL_DIR=$HOME/private/jrnl
alias jrnle='jrnl --edit -1'
alias jrnlist='jrnl --short'
alias jrnlconfig='vim $HOME/.config/jrnl/jrnl.yaml'
alias jrnls='jrnl --list'
alias jrnlgit='git --git-dir ${JRNL_DIR}/.git/ --work-tree ${JRNL_DIR}'
alias jrnlopen='jrnl --config-override editor ""'

jrnlast(){
  jrnl --format text -n1 $1 | fold -sw 65
}

jrnlsays(){
  jrnl --format json -not @purpose quotes | \
    jq '.entries[].title' | \
    nl -w2 -s'. ' | shuf -n1 | fold -sw 65 | \
    boxes -p v1h3 -a c -d ada-cmt | lolcat
}

jrnlquote(){
  local choosen_entry=$1
  local entry=$((choosen_entry-1))

  jrnl --format json -not @purpose quotes | \
    jq -r --argjson entry "$entry" --arg num "$1" \
    '$num + ". " + .entries[$entry].title + "\n\n" + .entries[$entry].body + "\n\n[" + .entries[$entry].date + " " + .entries[$entry].time + "]"' | \
    fold -sw 80 | boxes -p v1h3 -a l -d ada-cmt | lolcat
}
