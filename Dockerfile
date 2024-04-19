FROM aggipp/texlive:2019-full-1

COPY .latexmkrc /.latexmkrc

# RUN cp /.latexmkrc $HOME/.latexmkrc

# COPY base.zip /base.zip

COPY make_diff.sh /make_diff.sh

RUN apt update && apt install -y unzip

ENTRYPOINT ["/make_diff.sh"]
