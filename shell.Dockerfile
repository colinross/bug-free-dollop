FROM ruby-base

RUN apk --no-cache add curl ctags the_silver_searcher tmux

WORKDIR /root

# Oh My Zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh && \
    cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc

RUN sed -i '/plugins/ s/git/=git rbenv bundle rake ruby tmux vi-mode common-aliases/' .zshrc && \
    echo 'source /etc/zsh/zshrc' >> .zshrc

WORKDIR /usr/src/app
VOLUME /usr/src/app

ENTRYPOINT ["zsh"]
