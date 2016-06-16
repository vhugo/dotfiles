# Dotfiles

Here is the collection of my dotfiles. Most of what you see here came from
[christoomey/dotfiles](https://github.com/christoomey/dotfiles/),
[thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles/) and some is
inspired by other repositories on Github.

## How I use it

First, install everything I'm going to use, which usually are zsh, vim, git, 
tmux and docker. Also to help me manage my dotfiles, I use
[RCM](https://github.com/thoughtbot/rcm) from Thoughtbot. After changing my
default shell to zsh with this `chsh -s /bin/zsh` Then I clone this
repo to my home directory as `.dotfiles`, and run `rcup`. After that I clone
[Vundle](https://github.com/VundleVim/Vundle.vim) to my vim bundle directory, like this:

```
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundles/vundle
```

