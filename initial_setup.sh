#!/bin/sh

pretty_print() {
  local indication="$1"; shift
  printf "\n$indication\n" "$@"
}

if (ENV["COPY_DOTFILES"] || ENV["RUN_ALL"])
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

#######

if (ENV["UPDATE_HOMEBREW"] || ENV["RUN_ALL"])
  # Homebrew setup

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

#######

if (ENV["UPDATE_BASH"] || ENV["RUN_ALL"])

  # Bash profile related setup

  pretty_print "Building .bash_profile"

  if ! grep -q "export GITAWAREPROMPT" "$HOME/.bash_profile"; then
    mkdir -p "$HOME/.bash"
    git clone git://github.com/jimeh/git-aware-prompt.git "$HOME/.bash/"
    sed -i '1 i\export GITAWAREPROMPT=~/.bash/git-aware-prompt\nsource "${GITAWAREPROMPT}/main.sh"' "$HOME/.bash_profile"
  fi
fi

#######

if (ENV["UPDATE_RUBY"] || ENV["RUN_ALL"])

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

#######

if (ENV["UPDATE_PYTHON"] || ENV["RUN_ALL"])

  # Python related setup

  curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
  sudo easy_install pip

  # Media management (handled by python libraries)

  pip install beets
  pip install beets-copyartifacts
fi

#######

if (ENV["UPDATE_VIM"] || ENV["RUN_ALL"])

  # Vim related setup

  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  git clone git://github.com/tpope/vim-rails.git ~/.vim/bundle
  git clone git://github.com/tpope/vim-bundler.git ~/.vim/bundle
  git clone git://github.com/tpope/vim-vinegar.git ~/.vim/bundle
  
  mkdir -p ~/.vim/colors && \
    curl -LSso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim 

fi
#######

