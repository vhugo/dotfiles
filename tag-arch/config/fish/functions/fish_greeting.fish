function fish_greeting
  hostname | figlet -f small | boxes -d simple -p h2v0
  echo ""
  cal -w1
  fortune -c 50% wisdom 30% science 20% definitions | \
    boxes -d vim-cmt -p h3v1
  echo ""
end

