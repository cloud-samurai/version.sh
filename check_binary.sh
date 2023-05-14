#!/bin/bash

check_binary() {
  if ! which "$1" > /dev/null; then
    ( >&2 echo "$2" )
    exit 1
  fi
}
