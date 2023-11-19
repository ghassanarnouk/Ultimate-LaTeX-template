#!/bin/bash

texFile="*\.tex"
dirPat=".*minted.*"

# Compile the tex file into PDF
arara -l $texFile

# Output formatting
echo ""
echo ""

# Find the minted dir
dir=($(find . -maxdepth 1 -type d -regex "$dirPat"))    # test the find command

# TODO: update the printing of .... SUCCESS to be dynamic so that the left side changes with
# Check if the dir exists
if [[ -d "$dir" ]]; then
    # If it exists, delete it
    rm -r "$dir"
    echo "(Clean) Cleaning $dir ........................ SUCCESS"
    echo ""
else
    echo "No $dir to delete"
fi
