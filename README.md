# Action create-latexdiff

A Github action that compares your LaTeX project against an older archived version and creates a "diff" file that highlights the differences. The `latexdiff` utility is in the core of this action. LaTeX projects are compiled using `pdflatex` with `latexmk`. Overleaf's `latexmk` global configuration is used. The archived project needs to be in a `base.zip` archive in the root of the project.

## Inputs

### main-file

- Type: optional
- Default value: main.tex
- Description: the LaTeX source file in the project that needs to be compiled

## Example

```yaml
on: [push]

jobs:
  test_action:
    runs-on: ubuntu-latest
    name: Test the action
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Generate a diff file
        uses: egor-demidov/create-latexdiff@v1
        with:
          main-file: 'main.tex'
      - name: Upload diff file artifact
        uses: actions/upload-artifact@v4
        with:
          name: workspace_artifacts
          path: diff.pdf
```
