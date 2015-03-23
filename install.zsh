#!/bin/zsh
SCRIPT_FILE="${PWD}/${0}"
if [ -L $SCRIPT_FILE ]; then
    SCRIPT_FILE=`readlink $SCRIPT_FILE`
fi
SCRIPT_PATH=`dirname $SCRIPT_FILE`
SCRIPT_FILE=`basename $SCRIPT_FILE`
# echo Path: $SCRIPT_PATH
# echo Filename: $SCRIPT_FILE

setopt EXTENDED_GLOB

function link() {
    for folder in ${@}; do
        echo
        echo "Link files in ./${folder}"
        for file in "${SCRIPT_PATH}/${folder}"/^README.md(.N); do
            echo ln -fs "$file" "${ZDOTDIR:-$HOME}/.${file:t}"
            ln -fs "$file" "${ZDOTDIR:-$HOME}/.${file:t}"
        done
        echo "----------------------------------------------------------------"
    done
}

link rcfiles git
