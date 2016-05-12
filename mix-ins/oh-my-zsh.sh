#!/usr/bin/env sh

git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh && \
cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc && \
echo 'source /etc/zsh/zshrc' >> .zshrc && \
sed -i '/plugins/ s/git/=git rbenv bundle vi-mode common-aliases/' .zshrc
