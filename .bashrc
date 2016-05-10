export EDITOR='subl -w'

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

# Git related aliases
alias gsearch='git branch -a | grep'
alias gfo='git fetch origin'
alias gco='git checkout'
alias grm='git reset --hard origin/master'
alias grs='git reset --hard origin/staging'
alias gb='git branch'
alias gs='git status'
alias gd='git branch -D'

# Tmux aliases
alias tl='tmux list-sessions'

# Bash aliases
alias l='ls -la'
