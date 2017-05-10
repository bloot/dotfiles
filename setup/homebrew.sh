if [ "$RUN_ALL" == '1' ]; then
  if ! command -v brew >/dev/null; then
    pretty_print "Installing Homebrew"
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    pretty_print "Updating PATH"
  fi
fi

if [ "$CONFIGURE_HOMEBREW" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  pretty_print "Updating Homebrew formulas"

  brew tap Homebrew/bundle
  cp preferences/brew/Brewfile ~ && cd ~
  brew bundle
fi
