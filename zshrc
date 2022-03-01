# set oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="vat"
export ZSH_CUSTOM=$HOME/.zsh/
export DISABLE_AUTO_UPDATE="true"
export LC_ALL=en_US.UTF-8
export GO111MODULE=on

plugins=(
  zsh-completions
  zsh-syntax-highlighting
  git
  docker
  docker-compose
  golang
)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load all my configs
for this_config in ~/.zsh/config/*.zsh; do
  source $this_config
done

# load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# start tmux by default
# using [tat](https://github.com/thoughtbot/dotfiles/blob/master/bin/tat)
ensure_tmux_is_running

# load [fzf](https://github.com/junegunn/fzf)
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit && compinit

alias ha='fortune -s -n 100 -a -e $(shuf -e science education wisdom definitions computers) | \
  cowsay -f $(/bin/ls $HOME/.cowsay-want/*.cow | shuf -n1) | \
  lolcat'

alias cmx='cmatrix -s'
alias saybr='say -v Luciana'
alias saynl='say -v Xander'
alias saybe='say -v Ellen'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/victor-alves/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/victor-alves/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/victor-alves/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/victor-alves/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

load_dot_env(){
  if [[ -f .env && -r .env ]]; then
    source .env
  fi
}

gitremovemergedbranches(){
  git checkout master && \
    git fetch --tags --prune origin && \
    git pull && \
    git branch --merged | \
    grep -vi master | \
    xargs git branch -d
}

precmd_functions=(pyvenv_auto_switch)
