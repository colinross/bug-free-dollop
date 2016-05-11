FROM base:latest

ENV RUBY_VERSION 2.3.1
ENV BUNDLER_VERSION 1.12

ENV CONFIGURE_OPTS --disable-install-doc
ENV RBENV_ROOT /usr/local/rbenv

RUN git clone --depth=1 https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    git clone --depth=1 https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
RUN PREFIX=$RBENV_ROOT $RBENV_ROOT/plugins/ruby-build/install.sh

ENV PATH $RBENV_ROOT/bin:$PATH

RUN echo 'eval "$(rbenv init - zsh)"' >> /etc/zsh/zshrc
RUN eval "$(rbenv init -)"; rbenv install $RUBY_VERSION && \
    eval "$(rbenv init -)"; rbenv global $RUBY_VERSION
RUN eval "$(rbenv init -)"; gem install bundler --version "$BUNDLER_VERSION"
RUN eval "$(rbenv init -)"; bundle config install --no-rdoc --no-ri && \
    eval "$(rbenv init -)"; bundle config update --no-rdoc --no-ri && \
    eval "$(rbenv init -)"; bundle config build.nokogiri -- --use-system-libraries && \
    eval "$(rbenv init -)"; bundle config --global silence_root_warning 1
