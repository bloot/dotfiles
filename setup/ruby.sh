if [ "$RUN_ALL" == '1' ]; then
  pretty_print "Configuring ruby install"

  echo "gem: --no-document" >> ~/.gemrc

  if [ ! -d "$HOME/.rvm/" ]; then
    curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  fi

  if ! grep -Rq "source \"\$HOME\/.rvm\/scripts\/rvm\"" ~/.bash_profile; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi
