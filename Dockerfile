FROM ubuntu:jammy

RUN apt update \
    && apt -y install texlive-full

# COPY home/.latexmkrc /.latexmkrc

# RUN cp /.latexmkrc $HOME/.latexmkrc

# COPY base.zip /base.zip

COPY make_diff.sh /make_diff.sh

ENTRYPOINT ["make_diff.sh"]
