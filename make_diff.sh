#!/bin/bash

set -e

cp /.latexmkrc ~/.latexmkrc

# Compile the current document
latexmk -pdf -interaction=nonstopmode $1

# Compile the base version of the document
unzip base.zip
cd base
latexmk -pdf -interaction=nonstopmode $1

# Generate and compile the diff
cd ..
latexdiff --flatten base/$1 $1 > diff.tex
latexmk -pdf -interaction=nonstopmode diff.tex

# Move the diff file to a shared directory
mv diff.pdf /github/workspace/diff.pdf
