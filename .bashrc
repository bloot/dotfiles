export EDITOR='subl'

# Ruby aliases
alias be='bundle exec'
alias sdeploy='be cap staging deploy'
alias sr='spring rspec'

# C aliases
alias val='valgrind'
alias clean='make clean'

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
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

function add_notes()
{
  if [ ! -f notes.txt ]; then
    touch notes.txt
    echo "notes.txt" >> .gitignore
  fi
}

function find_filetype()
{
  find $1 -name "*.$2" -type f | grep -o "\(.*\)/" | sort -u
}
