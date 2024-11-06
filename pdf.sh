#!/bin/bash

# Check if a file argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 filename.tex"
    exit 1
fi

# Get the filename without the extension
filename="${1%.*}"

# Run texify on the provided .tex file
texify "$filename.tex"
if [ $? -ne 0 ]; then
    echo "texify failed."
    exit 1
fi

# Run dvipdfm on the .dvi output from texify
dvipdfm "$filename.dvi"
if [ $? -ne 0 ]; then
    echo "dvipdfm failed."
    exit 1
fi

echo "PDF created successfully as $filename.pdf"

