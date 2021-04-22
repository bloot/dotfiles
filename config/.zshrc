export EDITOR='vim'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

alias tmux="TERM=screen-256color-bce tmux"

# Ruby aliases
alias be='bundle exec'
alias sdeploy='be cap staging deploy'
alias sr='spring rspec'

# Stores
alias rs='redis-server --daemonize yes'

# The intention of this is to verify that a rails migration runs both ways
alias db_migrate="rake db:migrate db:rollback && rake db:migrate"

# C aliases
alias val='valgrind'
alias clean='make clean'

# C++
alias cclean='rm -rf CMakeFiles/ cmake_install.cmake CMakeCache.txt'
alias cmaked='cmake -DCMAKE_BUILD_TYPE=Debug'

# Environment specific aliases
alias cdev='cd ~/Development'
alias dotfiles='~/Development/dotfiles'
alias notify="terminal-notifier -message 'Command Finished' -title 'Command Finished'"
alias cdb='cp ~/Development/shared/database.yml ./config/database.yml'

# Git related aliases
alias gsearch='git branch -a | grep'
alias gap='git add --all -p'
alias gc='git commit'
alias gfo='git fetch origin'
alias gco='git checkout'
alias grm='git reset --hard origin/master'
alias grs='git reset --hard origin/staging'
alias gb='git branch'
alias gs='git status'
alias gd='git branch -D'
alias grh='git reset --hard'

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath(~/.zsh $fpath)

autoload -Uz compinit && compinit

function git-group() {
  git diff master | grep "diff --git" | cut -d ' ' -f4- | awk 'match($0, /[controllers|views|models]\/.*\.(html|rb)/){ print substr($0, RSTART+1, RLENGTH-1) }' | sort
}
alias gg='git-group'

# Tmux aliases
alias tl='tmux list-sessions'

# Bash aliases
alias px='ps ax | xargs grep'
alias l='ls -laG'
alias lock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# Vim Aliases
alias gtags='ctags --exclude=.git --exclude='*.log' -R * `bundle show --paths`'

function dev-session() {
  tmux -2 attach-session -t $1 || tmux new-session -s $1
}

function add_notes() {
  if [ ! -f notes.txt ]; then
    touch notes.txt
    echo "notes.txt" >> .gitignore
  fi
}

function find_filetype() {
  find $1 -name "*.$2" -type f | grep -o "\(.*\)/" | sort -u
}

function build_pr_template() {
  echo "This work connects to: ($(ruby -e "puts %x{git rev-parse --abbrev-ref HEAD}.match(/([a-zA-Z]+\-\d+)/)"))[]" > temp_checklist.mdown
  cat ~/checklist.mdown >> temp_checklist.mdown
}

export PATH="$PATH:$HOME/.rvm/bin"
