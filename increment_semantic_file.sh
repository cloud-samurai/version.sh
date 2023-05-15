#!/bin/bash

set -e

# ensure we have wget
if ! which "wget" > /dev/null; then
    echo "wget is required to use increment_semantic_file.sh"
    exit 1
fi

increment_operation="patch"
while test $# -gt 0; do
  case "$1" in
    --increment*)
      increment_operation=$(echo "$1" | sed -e 's/^[^=]*=//g')
      shift
      ;;
    *)
      break
      ;;
  esac
done


# ensure the file exists
if [ ! -f "$1" ]; then
    echo "Semantic version file: $1 does not exist."
    exit 1
fi

current_version="$(cat "$1" | tr -d " \t\n\r" )"

wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- --increment="$increment_operation" "$current_version" | tr -d " \t\n\r" > "$1"


