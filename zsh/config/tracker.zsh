export TKR_HOME=~/local/doc/tracker

install-tkr(){
  mkdir -p $TKR_HOME/devlog $TKR_HOME/planning
}

tkr-list(){
  tree $TKR_HOME
}

tkr-search(){
  grep -i $@ $TKR_HOME/*/*.md 
}

tkr-devlog-template(){
  $EDITOR $TKR_HOME/devlog/devlog-template.md
}

tkr-devlog(){
  local devlog_file=$TKR_HOME/devlog/devlog-$(date '+%Y%m%d').md
  local devlog_template=$TKR_HOME/devlog/devlog-template.md

  if [ ! -f  $devlog_file ]; then
    local template="$devlog_template | :%s/_DATE_HERE_/$(date +'%Y.%m.%d %a')/g" 
    echo $template | xargs -I @ $EDITOR +':r @' $devlog_file
    return
  fi

  echo $TKR_HOME | xargs -I @ $EDITOR +':lcd @' $devlog_file
}

tkr-okr(){
  $EDITOR $TKR_HOME/planning/okr.md
}
  
# todo: creates a daily file for todos. it copies the latest todo as a bootstrap
# for the new one.
tkr-todo(){
  local todo_file=todo-$(date '+%Y%m%d').md

  if [ ! -f $todo_file ]; then
    previous=$(env ls $TKR_HOME/planning/todo* | xargs -I @ date -r @ "+%Y%m%d @" | sort -r | head -1 | awk '{print $2}')
    cp $previous $TKR_HOME/planning/$todo_file
  fi

  echo $TKR_HOME | xargs -I @ $EDITOR +':lcd @' $TKR_HOME/planning/$todo_file
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
  git --git-dir $TKR_HOME/.git/ --work-tree $TKR_HOME $@
}

# gamedev: major gamedev under development.
tkr-gamedev(){
  $EDITOR $TKR_HOME/planning/gamedev-untitled-space-theme-cozy-game.md
}

# microgamedev: microgame under development.
tkr-microgamedev(){
  $EDITOR $TKR_HOME/planning/microgamedev-dot-detective.md
}

tkr-microgamedev-template(){
  $EDITOR $TKR_HOME/planning/microgamedev-template.md
}

tkr-microgamedev-new(){
  local project_name=$(_sanitize_filename $@)
  local template="$TKR_HOME/planning/microgamedev-template.md | :%s/_DATE_HERE_/$(date +'%Y.%m.%d %a')/g | :%s/_PROJECT_TITLE_/$@/"

  echo $template | xargs -I @ $EDITOR +':r @' $TKR_HOME/planning/microgamedev-$project_name.md
}

_sanitize_filename(){
  echo $@ | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z
}

_gitcmdshare(){
  git --git-dir $gamedev_share/.git/ --work-tree $gamedev_share $@
}

# gamedev-share: publish my major gamedev documents for sharing outside my tracker files.
tkr-gamedev-share(){
  local gamedev_share=~/local/project/gamedev-docs/

  cp $TKR_HOME/planning/gamedev-* $gamedev_share  
  mv -f $gamedev_share/gamedev-untitled-space-theme-cozy-game.md $gamedev_share/README.md
  # _gitcmdshare status
  _gitcmdshare add .
  _gitcmdshare commit -m "auto-update gamedev docs on $(date '+%Y%m%d %H:%M')"
  _gitcmdshare push
}

tkr-test(){
  echo "auto-update gamedev docs on $(date '+%Y%m%d %H:%M')"
}

