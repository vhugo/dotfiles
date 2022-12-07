
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

