#!/bin/bash

set -e

tries_remaining="${MAX_TRIES:-10}"

until [[ "$tries_remaining" -le 0 ]]; do
  now=$(date +%Y-%m-%dT%H:%M:%S%z)
  printf "Trying to run '%s' at time '%s'...\n" "$*" "$now" >&2
  if "$@"; then
    exit 0
  else
    sleep 0.5
  fi
  tries_remaining=$((tries_remaining-1))
done

echo 'failed!' >&2
exit 1
