FROM Ubantu:latest

# ENV USER
# ENV WORKING_PATH

# Update
RUN apt-get update && \
  apt-get upgrade -y


# Supervisor

RUN apt-get install -y supervisor && \
  mkdir -p /var/log/supervisor && \
  supervisord --version

ADD configs/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# Zsh

RUN apt-get install -y zsh && \
  git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh && \
  chsh --shell $(which zsh) && \
  zsh --version

ADD configs/oh-my-zsh/zshrc /root/.zshrc

# Basic Language Support

# Python
RUN apt-get install -y python python3 python-pil pylint && \
python --version && \
python3 --version

# Ruby
RUN apt-get install -y ruby ruby-dev ri && \
  ruby --version && \
  echo "Gem version:" && gem --version
RUN gem install rake bundler sass && \
  bundle --version && rake --version && sass --version && \
  gem install compass && \
  compass --version

VOLUME /workspace
EXPOSE 22
CMD ["supervisord"]
