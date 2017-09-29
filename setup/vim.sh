if [ "$CONFIGURE_VIM" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  cd ~/.vim/bundle/
  git clone git://github.com/tpope/vim-rails.git
  git clone git://github.com/tpope/vim-bundler.git
  git clone git://github.com/tpope/vim-vinegar.git
  git clone https://github.com/kchmck/vim-coffee-script.git
  git clone https://github.com/kien/ctrlp.vim.git
  git clone https://github.com/vim-ruby/vim-ruby.git
  git clone https://github.com/google/vim-maktaba.git
  git clone git://github.com/airblade/vim-gitgutter.git
  git clone https://github.com/mileszs/ack.vim.git
  git clone https://github.com/vim-airline/vim-airline.git
  git clone https://github.com/vim-airline/vim-airline-themes
  git clone https://github.com/szw/vim-tags.git
  git clone https://github.com/thoughtbot/vim-rspec.git
  git clone git://github.com/chase/focuspoint-vim.git
  git clone git://github.com/christoomey/vim-tmux-navigator.git
  git clone https://github.com/ajmwagar/vim-deus.git


  mkdir -p ~/.vim/colors && \
    curl -LSso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim

fi


