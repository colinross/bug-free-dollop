FROM ubuntu:latest

# System wide update
RUN apt-get update && \
  apt-get upgrade -y

# Install Basic Packages
RUN apt-get install -y build-essential software-properties-common wget curl git man unzip tmux colord zsh

# Install Ruby and Rails dependencies
RUN apt-get install -y \
  ruby \
  ruby-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  libsqlite3-dev \
  nodejs \
  && ruby --version && \
  echo "Gem version:" && gem --version
RUN gem install rake bundler sass && \
  bundle --version && rake --version && sass --version

# Install Rails
RUN gem install rails

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

VOLUME .:/app

EXPOSE 22
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
