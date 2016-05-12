#!/usr/bin/env sh
set -u
unset CDPATH

MIXIN_ROOT='/.docker/mix-ins'
for mixin in $@; do
  if [[ -f $MIXIN_ROOT/$mixin.sh ]]; then
     `$MIXIN_ROOT/$mixin.sh`
  else
    error "$MIXIN_ROOT/$mixin.sh NOT FOUND!"
  fi
done
