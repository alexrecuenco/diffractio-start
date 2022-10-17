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
check_python_version() {
    # Remember that in bash 0 === passed, 1===error
    if "$1" -c 'import sys; exit(not (sys.version_info >= (3,7,0)))';
    then
        return 0
    fi
    return 1
}

initalize() {
    cd "$SCRIPT_DIR" &&
        "$1" -m venv env &&
        source ./env/bin/activate &&
        pip install --upgrade pip &&
        pip install -r requirements.txt
}

check_init() {
    if check_command "$1" && check_python_version "$1" && initalize "$1"
    then
        return 0
    fi
    return 1
}

check_init python3  ||
    check_init python ||
    echo "You need to install a version of python that is 3.7 or above. If you have already done that, make sure it is in your PATH "