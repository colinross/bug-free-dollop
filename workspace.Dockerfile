FROM ubuntu:latest

#ARG $USER
ENV HOME /home/$USER

RUN useradd -m $USER
RUN adduser $USER sudo

# System wide update
RUN apt-get update && \
  apt-get upgrade -y

# Zsh
RUN apt-get install -y zsh && \
  git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh && \
  chsh --shell $(which zsh) && \
  zsh --version

# Basic Language Support
## Python
RUN apt-get install -y python python3 python-pil pylint && \
python --version && \
python3 --version

# Install Ruby and Rails dependencies
RUN apt-get install -y \
  ruby \ 
  ruby-dev ri \
  build-essential \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  libsqlite3-dev \
  nodejs
  && ruby --version && \
  echo "Gem version:" && gem --version
RUN gem install rake bundler sass && \
  bundle --version && rake --version && sass --version && \

# Install Rails
RUN gem install rails

# Dotfiles
RUN git clone https://github.com/colinross/dotfiles.git $HOME/.dotfiles \
  && cd $HOME/.dotfiles && script/bootstrap

VOLUME .:/app
VOLUME .:$HOME

EXPOSE 22
EXPOSE 3000

#CMD ["supervisord"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
