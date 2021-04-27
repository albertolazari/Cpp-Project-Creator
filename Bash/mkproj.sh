#!/bin/bash

##########################
# Made by Alberto Lazari #
##########################

# This is a simple script to create a new C++ Project
# It creates a new folder containing the folders you will need and a Makefile that
# works out-of-the-box

checkFlags() {
    
}

createDir() {
    if [[ -e "$1" ]]; then
        return 1
    fi
    mkdir "$1" "$1"/{src,include}  
    cp Makefile "$1"/Makefile
    cp -r ../.vscode/ "$1"/.vscode/
    return 0
}

if ! createDir $1; then
    echo "cannot create project '$1': File already exists"
fi
