
if status is-interactive
  export GPG_TTY=$(tty)
end

set -gx EDITOR nvim
set -g fish_key_bindings fish_vi_key_bindings
