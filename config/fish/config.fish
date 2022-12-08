
if status is-interactive
  # export GPG_TTY=$(tty)
  set -gx GPG_TTY $(tty)
end

# if status is-interactive
# and not set -q TMUX
#     exec tmux new-session -As work
# end

set -gx EDITOR nvim
set -gx SHELL /bin/fish
set -gx TERMINAL alacritty
set -g fish_key_bindings fish_vi_key_bindings

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/vhugo/installation/google-cloud-sdk/path.fish.inc' ]; . '/home/vhugo/installation/google-cloud-sdk/path.fish.inc'; end

# pnpm
set -gx PNPM_HOME "/home/vhugo/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
