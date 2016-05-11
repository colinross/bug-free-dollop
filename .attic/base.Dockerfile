FROM alpine:latest
MAINTAINER <Colin Ross colinross.github.io>

ENV PACKAGES="ca-certificates curl ctags libxml2-dev libxslt-dev nodejs openssl zlib readline ncurses-terminfo git zsh the_silver_searcher tmux vim build-base bash"
RUN apk --update add $PACKAGES

# Clean APK cache
RUN rm -rf /var/cache/apk/*

ENV SHELL=/bin/zsh

ENTRYPOINT ["zsh"]
