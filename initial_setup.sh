#!/bin/sh

pretty_print() {
  local indication="$1"; shift
  printf "\n$indication\n" "$@"
}

# BEGIN Dotfile Setup

if [ "$COPY_DOTFILES" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  pretty_print "Copying dotfiles"
  # Copy dotfiles, since I won't have awk and I cannot use lookaheads with grep this is the easiest way
  ruby -e 'puts Dir.entries(".").select{|d| d[/^\.(?!git)[a-z]+$/]}' | xargs -I {} cp {} ~

  # Initial directory setup

  pretty_print "Creating directories"

  DIRS_TO_BUILD=("$HOME/Development/" "$HOME/.config/")


  for dir in $DIRS_TO_BUILD
  do
    if [ ! -d $dir ]; then
      pretty_print "Making $dir"
      mkdir $dir
    fi
  done
fi

# END Dotfile Setup

#######################

# BEGIN Homebrew setup

if [ "$INSTALL_HOMEBREW" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  if ! command -v brew >/dev/null; then
    pretty_print "Installing Homebrew"
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    pretty_print "Updating PATH"

pretty_print "Updating Homebrew formulas"

  brew update
  brew bundle --file=- <<EOF
brew "git"
brew "openssl"
brew "the_silver_searcher"
brew "tmux"
brew "vim"
brew "imagemagick"
brew "bash-completion"
brew "libyaml"
brew "node"
brew "tmate"
brew "valgrind"
brew "htop-osx"
brew "npm"
brew "postgresql", restart_service: true
brew "redis", restart_service: true
brew macvim --override-system-vim
EOF
fi

fi

# END Homebrew setup

#####################

## BEGIN Bash setup

if [ "$CONFIGURE_BASH" == '1' ] || [ "$RUN_ALL" == '1' ]; then

  # Bash profile related setup

  pretty_print "Building .bash_profile"

  if ! grep -q "export GITAWAREPROMPT" "$HOME/.bash_profile"; then
    mkdir -p "$HOME/.bash"
    git clone git://github.com/jimeh/git-aware-prompt.git "$HOME/.bash/"
    sed -i '1 i\export GITAWAREPROMPT=~/.bash/git-aware-prompt\nsource "${GITAWAREPROMPT}/main.sh"' "$HOME/.bash_profile"
  fi
fi

# End Bash setup

###################

# BEGIN Ruby setup

if [ "$CONFIGURE_RUBY" == '1' ] || [ "$RUN_ALL" == '1' ]; then

  # Ruby related setup

  pretty_print "Configuring ruby install"

  echo "gem: --no-document" >> ~/.gemrc

  if [ ! -d "$HOME/.rvm/" ]; then
    curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  fi

  if ! grep -Rq "source \"\$HOME\/.rvm\/scripts\/rvm\"" ~/.bash_profile; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi

# End Ruby setup

#################

# BEGIN Python setup

if [ "$CONFIGURE_PYTHON" == '1' ] || [ "$RUN_ALL" == '1' ]; then

  # Python related setup

  curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
  sudo easy_install pip

  # Media management (handled by python libraries)

  pip install beets
  pip install beets-copyartifacts
fi

# End Python setup

####################

# BEGIN Vim setup

if [ "$CONFIGURE_VIM" == '1' ] || [ "$RUN_ALL" == '1' ]; then

  # Vim related setup

  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  cd ~/.vim/bundle/
  git clone git://github.com/tpope/vim-rails.git
  git clone git://github.com/tpope/vim-bundler.git
  git clone git://github.com/tpope/vim-vinegar.git
  git clone https://github.com/kchmck/vim-coffee-script.git
  git clone https://github.com/kien/ctrlp.vim.git
  git clone https://github.com/vim-ruby/vim-ruby.git

  mkdir -p ~/.vim/colors && \
    curl -LSso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim

fi

# End Vim setup

#######

