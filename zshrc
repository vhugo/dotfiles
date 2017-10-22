# set oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="vat"
export ZSH_CUSTOM=$HOME/.zsh/
export DISABLE_AUTO_UPDATE="true"
plugins=(zsh-syntax-highlighting git docker td)

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
