#!/bin/bash

increment_operation="patch"

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
      increment_operation=$(echo "$1" | sed -e 's/^[^=]*=//g')
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [[ $increment_operation == "major" ]]; then
     increment "$1" 0
elif [[ $increment_operation == "minor" ]]; then
     increment "$1" 1
else
  increment "$1" 2
fi



