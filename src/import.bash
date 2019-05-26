# Prevent multiple executions
[[ -v __LOBASH_IMPORT_BASH_LOADED ]] && return

__SRC_DIR="$(dirname "${BASH_SOURCE[0]}")"
__PREFIX=${2:-}

source "$__SRC_DIR"/internals/consts.bash

if [[ -z $__PREFIX ]]; then
  for file in "${_LOBASH_IMPORT_ENTRIES[@]}"; do
    source "$__SRC_DIR"/modules/"$file".bash
  done
else
  echo "====${__PREFIX: -1:1}">>/tmp/ok
  if [[ ! ${__PREFIX: -1:1} =~ [a-zA-Z0-9] ]] && [[ ! ${__PREFIX: -1:1} =~ [._-] ]]; then
    echo 'The import prefix must end with letter which matches [._-a-zA-Z0-9]' >&2
    return 3
  fi

  for file in "${_LOBASH_IMPORT_ENTRIES[@]}"; do
    source <( sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${__PREFIX}\\1\\(\\) \\{/" < "$__SRC_DIR"/modules/"$file".bash )
  done
fi

unset __SRC_DIR __PREFIX file

readonly __LOBASH_IMPORT_BASH_LOADED=true
