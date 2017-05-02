#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_go_package() {

    execute \
        ". $HOME/.bash.local \
            && go get -u $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   go\n"

    install_go_package "go (update)" "go"
    printf "\n"
    install_go_package "Go-mode" "jshint"
    install_go_package "GoImports" "svgo"
    install_go_package "Go-" "svgo"

}

main
