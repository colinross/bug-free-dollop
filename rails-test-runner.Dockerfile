FROM ruby:alpine

# Local PG database
ENV DATABASE_URL postgresql://postgres@localhost/
ENV PGDATA /var/lib/postgresql/data
COPY mix-ins/postgres /.docker/mix-ins/postgres
RUN /.docker/mix-ins/postgres

RUN apk add --no-cache zsh nodejs

WORKDIR /usr/src/app
VOLUME /usr/src/app

CMD ["zsh"]
