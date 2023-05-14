#!/bin/bash

increment() {
  local delimiter=.
  local array=($(echo "$1" | tr $delimiter '\n'))
  array[$2]=$((array[$2]+1))
  if [ "$2" -lt 2 ]; then array[2]=0; fi
  if [ "$2" -lt 1 ]; then array[1]=0; fi
  echo "$(local IFS=$delimiter ; echo "${array[*]}")"
}

while test $# -gt 0; do
  case "$1" in
    --increment*)
      INCREMENT_OPERATION=$(echo "$1" | sed -e 's/^[^=]*=//g')
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [[ $INCREMENT_OPERATION == "major" ]]; then
     increment "$CURRENT_VERSION" 0
elif [[ $INCREMENT_OPERATION == "minor" ]]; then
     increment "$CURRENT_VERSION" 1
else
  increment "$CURRENT_VERSION" 2
fi



