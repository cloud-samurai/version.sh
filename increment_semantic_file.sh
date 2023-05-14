#!/bin/bash

set -e

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

curl -s https://raw.githubusercontent.com/davemaple/version.sh/main/increment_sementic_version.sh | bash -s "$current_version" "${@:1}" > "$1"



