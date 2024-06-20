#!/bin/bash

#set -e

cp /.latexmkrc ~/.latexmkrc

# Compile the current document
latexmk -pdf -f -interaction=nonstopmode -shell-escape $1

# Compile the base version of the document
unzip base.zip
cd base
latexmk -pdf -f -interaction=nonstopmode -shell-escape $1

# Generate and compile the diff
cd ..
latexdiff --flatten base/$1 $1 > diff.tex
latexmk -pdf -f -interaction=nonstopmode -shell-escape diff.tex

rm -rf base
rm *.bbl || true
rm *.aux || true
