#!/bin/sh

pretty_print() {
  local indication="$1"; shift
  printf "\n$indication\n" "$@"
}

source setup/bash.sh
source setup/ruby.sh
source setup/homebrew.sh
source setup/python.sh
source setup/vim.sh
