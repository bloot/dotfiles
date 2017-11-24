if [ "$CONFIGURE_VIM" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  mkdir -p ~/.vim/plugged
  mkdir -p ~/.vim/colors && \
    curl -LSso ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


