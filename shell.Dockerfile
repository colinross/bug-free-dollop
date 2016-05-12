FROM buildpack-deps
MAINTAINER <Colin Ross colinross.github.io>

RUN apk --no-cache add curl ctags the_silver_searcher tmux

ENV PGDATA /var/lib/postgresql/data

COPY mix-ins/* /.docker/mix-ins/
RUN chmod +x -R /.docker/mix-ins && \
    find /.docker/ -name "*.sh" | xargs dos2unix && \
    /.docker/mix-ins/runner.sh oh-my-zsh rbenv postgres

VOLUME /var/lib/postgresql/data
VOLUME /usr/src/app

WORKDIR /usr/src/app
ENTRYPOINT ["zsh"]
