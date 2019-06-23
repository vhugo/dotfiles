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
source /Users/victor-alves/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit && compinit
