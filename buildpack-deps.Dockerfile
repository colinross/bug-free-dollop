FROM alpine
MAINTAINER <Colin Ross colinross.github.io>

RUN apk update && apk add --no-cache \
  autoconf \
  automake \
  bzip2 \
  bzip2-dev \
  ca-certificates \
  curl \
  curl-dev \
  file \
  g++ \
  gcc \
  geoip-dev \
  git \
  glib-dev \
  imagemagick \
  jpeg-dev \
  libc-dev \
  libevent-dev \
  libffi-dev \
  libpng-dev \
  libpq \
  libtool \
  libwebp-dev \
  libxml2-dev \
  libxslt-dev \
  linux-headers \
  make \
  mysql-client \
  nodejs \
  ncurses-dev \
  openssl-dev \
  patch \
  postgresql-dev \
  readline-dev \
  sqlite-dev \
  sudo \
  vim \
  wget \
  xz-dev \
  yaml-dev \
  zlib-dev \
  zsh

ENTRYPOINT ["zsh"]
