# Action create-latexdiff

A Github action that compares your LaTeX project against an older archived version and creates a "diff" file that highlights the differences. The `latexdiff` utility is in the core of this action. LaTeX projects are compiled using `pdflatex` with `latexmk`. [Overleaf's](https://www.overleaf.com/learn/how-to/How_does_Overleaf_compile_my_project%3F) `latexmk` global configuration is used. The archived project needs to be in a `base.zip` archive in the root of the project.

## Inputs

### main-file

- Type: optional
- Default value: main.tex
- Description: the LaTeX source file in the project that needs to be compiled

## Example

The code below needs to be palced in a file `.github/workflows/make-diff.yml`. You need to have a LaTeX source named `main.tex` and an arcive named `base.zip` in the root directory of your project. The `base.zip` archive contains one directory named `base`, inside of which is an older version of your project to build the diff against. A file named `diff.pdf` will be created and uploaded as an artifact. The artifact can be downloaded by going to the "Actions" tab on the repository page, selecting the most recent run, and clicking on the "diff-file" link in the Artifacts section.

```yaml
on: [push]

jobs:
  test_action:
    runs-on: ubuntu-latest
    name: Make diff
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Generate a diff file
        uses: egor-demidov/create-latexdiff@v1.1
        with:
          main-file: 'main.tex'
      - name: Upload diff file artifact
        uses: actions/upload-artifact@v4
        with:
          name: diff-file
          path: diff.pdf
```
