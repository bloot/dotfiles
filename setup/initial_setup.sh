#!/bin/sh

pretty_print() {
  local indication="$1"; shift
  printf "\n$indication\n" "$@"
}

source ./bash.sh
source ./ruby.sh
source ./homebrew.sh
source ./python.sh
source ./vim.sh
