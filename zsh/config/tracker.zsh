export TKR_HOME=~/local/doc/tracker

install-tkr(){
  mkdir -p $TKR_HOME/devlog $TKR_HOME/planning
}

tkr-devlog(){
  $EDITOR $TKR_HOME/devlog/devlog-$(date '+%Y%m%d').md
}

tkr-okr(){
  $EDITOR $TKR_HOME/planning/okr.md
}
  
tkr-todo(){
  local todo_file=todo-$(date '+%Y%m%d').md

  if [ ! -f $todo_file ]; then
    previous=$(env ls $TKR_HOME/planning/todo* | xargs -I @ date -r @ "+%Y%m%d @" | sort -r | head -1 | awk '{print $2}')
    cp $previous $TKR_HOME/planning/$todo_file
  fi

  $EDITOR $TKR_HOME/planning/$todo_file
}

tkr-backlog(){
  $EDITOR $TKR_HOME/planning/backlog.md
}

tkr-ideas(){
  $EDITOR $TKR_HOME/devlog/ideas-$(date '+%Y%m%d').md
}

tkr-meeting(){
  $EDITOR $TKR_HOME/devlog/meeting-$(date '+%Y%m%d-%H%M').md
}

tkr-git(){
  git --git-dir $TKR_HOME/.git/ --work-tree $TKR_HOME $argv
}

tkr-list(){
  tree $TKR_HOME
}

tkr-search(){
  grep -i $argv $TKR_HOME/*/*.md 
}

