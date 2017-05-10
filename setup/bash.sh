if [ "$RUN_ALL" == '1' ]; then
  pretty_print "Building .bash_profile"

  if ! grep -q "export GITAWAREPROMPT" "$HOME/.bash_profile"; then
    mkdir -p "$HOME/.bash"
    git clone git://github.com/jimeh/git-aware-prompt.git "$HOME/.bash/"
    sed -i '1 i\export GITAWAREPROMPT=~/.bash/git-aware-prompt\nsource "${GITAWAREPROMPT}/main.sh"' "$HOME/.bash_profile"
  fi

  if [ "$COPY_DOTFILES" == '1' ] || [ "$RUN_ALL" == '1' ]; then
    pretty_print "Copying dotfiles"
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


fi
