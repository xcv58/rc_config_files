#!/bin/zsh
SCRIPT_FILE=${0}
if [ -L $SCRIPT_FILE ]; then
    SCRIPT_FILE=`readlink $SCRIPT_FILE`
fi
SCRIPT_PATH=`dirname $SCRIPT_FILE`
SCRIPT_FILE=`basename $SCRIPT_FILE`
cd ${SCRIPT_PATH}

setopt EXTENDED_GLOB

function link() {
    for folder in ${@}; do
        echo
        echo "Link files in ${PWD}/${folder}"
        for file in "${PWD}/${folder}"/^README.md(.N); do
            echo ln -fs "$file" "${ZDOTDIR:-$HOME}/.${file:t}"
            ln -fs "$file" "${ZDOTDIR:-$HOME}/.${file:t}"
        done
        echo "----------------------------------------------------------------"
    done
}

link rcfiles git
