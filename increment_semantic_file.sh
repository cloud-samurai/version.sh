#!/bin/bash

set -e

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

# ensure we have curl
check_binary "curl" "$(cat <<EOF
curl is required to use increment_semantic_file.sh
EOF
)"

current_version="$(cat "$1")"

wget -qO- https://raw.githubusercontent.com/davemaple/version.sh/main/increment_semantic_version.sh | bash -s -- "$increment_operation" "$current_version" > "$1"


