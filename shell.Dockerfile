FROM buildpack-deps

RUN apk --no-cache add curl ctags the_silver_searcher tmux

COPY mix-ins/rbenv /.docker/mix-ins/rbenv
RUN /.docker/mix-ins/rbenv

ENV DATABASE_URL postgresql://postgres@localhost/
ENV PGDATA /var/lib/postgresql/data
COPY mix-ins/postgres /.docker/mix-ins/postgres
RUN /.docker/mix-ins/postgres

COPY mix-ins/oh-my-zsh /.docker/mix-ins/oh-my-zsh
RUN /.docker/mix-ins/oh-my-zsh

# RUN sed -i '/plugins/ s/git/=git rbenv bundle rake ruby tmux vi-mode common-aliases/' .zshrc

WORKDIR /usr/src/app
VOLUME /usr/src/app

ENTRYPOINT ["zsh"]
