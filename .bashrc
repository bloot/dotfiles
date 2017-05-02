export EDITOR='vim'

# Ruby aliases
alias be='bundle exec'
alias sdeploy='be cap staging deploy'
alias sr='spring rspec'

# The intention of this is to verify that a rails migration runs both ways
alias db_migrate="rake db:migrate db:rollback && rake db:migrate"

# C aliases
alias val='valgrind'
alias clean='make clean'

# C++
alias cclean='rm -rf CMakeFiles/ cmake_install.cmake CMakeCache.txt'
alias cmaked='cmake -DCMAKE_BUILD_TYPE=Debug'

# Environment specific aliases
alias dev='cd ~/Development'
alias notify="terminal-notifier -message 'Command Finished' -title 'Command Finished'"
alias cdb='cp ~/Development/shared/database.yml ./config/database.yml'

# Git related aliases
alias gsearch='git branch -a | grep'
alias gfo='git fetch origin'
alias gco='git checkout'
alias grm='git reset --hard origin/master'
alias grs='git reset --hard origin/staging'
alias gb='git branch'
alias gs='git status'
alias gd='git branch -D'
alias grh='git reset --hard'

# Tmux aliases
alias tl='tmux list-sessions'

# Bash aliases
alias l='ls -la'
alias lock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

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
