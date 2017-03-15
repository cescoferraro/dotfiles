#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r GVM_DIRECTORY="$HOME/.gvm"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_gvm_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Golang Version Manager

[[ -s \"$HOME/.gvm/scripts/gvm\" ]] && source \"$HOME/.gvm/scripts/gvm\"

"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "gvm (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_latest_stable_go() {

    # Install the latest stable version of Go
    # (this will also set it as the default).
    execute \
        ". $LOCAL_SHELL_CONFIG_FILE \
            && . $HOME/.gvm/scripts/gvm \
            && gvm install go1.4 -B \
            && gvm use go1.4 \
            && export GOROOT_BOOTSTRAP=$GOROOT \
            && gvm install go1.8" \
        "gvm (install latest Go)"
}

install_gvm() {

    # Install `gvm` and add the necessary
    # configs in the local shell config file.

    execute \
        "bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)" \
        "gvm (install)" \
    && add_gvm_configs

}

update_gvm() {

    execute \
        "cd $GVM_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags) \
            && . $GVM_DIRECTORY/gvm.sh" \
        "gvm (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   gvm\n\n"

    if [ ! -d "$GVM_DIRECTORY" ]; then
        install_gvm
    else
        execute "ls" "gvm up to date"
    fi

    install_latest_stable_go

}

main
