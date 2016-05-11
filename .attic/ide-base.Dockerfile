FROM base

MAINTAINER <Colin Ross colinross.github.io>

ENV USER "ide-user"
ENV HOME /home/$USER

RUN adduser -s /bin/zsh -h $HOME -D -G wheel $USER

ENV WORKSPACE /workspace
RUN mkdir -p $WORKSPACE && chown -R $USER $WORKSPACE
WORKDIR $WORKSPACE

USER $USER

ENV RUBY_VERSION 2.2.3
ENV CONFIGURE_OPTS --disable-install-doc


ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH
RUN git clone --depth 1 git://github.com/sstephenson/rbenv.git $HOME/.rbenv && git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
RUN rbenv install -v $RUBY_VERSION && rbenv global $RUBY_VERSION

RUN echo "gem: --no-document" > $HOME/.gemrc && gem install bundler rake && gem install rails -v $RAILS_VERSION

# This must come after rbenv/ruby
RUN git clone --depth 1 git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh && echo 'eval "$(rbenv init -)"' >> ~/.oh-my-zsh/oh-my-zsh.sh

ENTRYPOINT ["zsh"]
