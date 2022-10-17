#!/usr/bin/env bash
set -ex

# https://gist.github.com/tvlooy/cbfbdb111a4ebad8b93e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


# https://stackoverflow.com/a/677212
check_command() {
    if ! command -v "$1" &> /dev/null
    then
        return 1
    fi
    return 0
}

cd "$SCRIPT_DIR"

source ./env/bin/activate

check_command jupyter && jupyter notebook || echo "Jupiter lab not installed properly" 1>&2