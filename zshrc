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
  kubectl
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

# kubernetes
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

alias ha='fortune -s -n 100 -a -e $(shuf -e science education wisdom definitions computers) | \
  cowsay -f $(/bin/ls $HOME/.cowsay-want/*.cow | shuf -n1) | \
  lolcat'
#ha

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
