#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
declare -r CASK_DIRECTORY="$HOME/.cask"



main() {

    print_in_purple "\n   Emacs\n\n"

    printf "\n"

    if [ ! -d "$CASK_DIRECTORY" ]; then
        printf "Installing cask itself \n"
        curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    fi
    printf "Installing dependencies \n"
    cask install --path ~/.emacs.d/
}

main
