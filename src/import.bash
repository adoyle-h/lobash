# shellcheck disable=SC1090
# Prevent multiple executions
[[ -n ${__LOBASH_IMPORT_BASH_LOADED:-} ]] && return

__SRC_DIR="$(dirname "${BASH_SOURCE[0]}")"
__PREFIX=${2:-}

source "$__SRC_DIR"/internals/consts.bash

if [[ -z $__PREFIX ]]; then
  for file in "${_LOBASH_IMPORT_ENTRIES[@]}"; do
    source "$__SRC_DIR"/modules/"$file".bash
  done
else
  if [[ ! ${__PREFIX: -1:1} =~ [-_.a-zA-Z0-9] ]]; then
    echo 'The import prefix must end with letter which matches [-._a-zA-Z0-9]' >&2
    return 3
  fi

  for file in "${_LOBASH_IMPORT_ENTRIES[@]}"; do
    if [[ $__LOBASH_OS == Linux ]]; then
      source <( sed -E "s/^([A-Za-z0-9]\\w*)\\(\\) ?\\{$/${__PREFIX}\\1\\(\\) \\{/" < "$__SRC_DIR"/modules/"$file".bash )
    else
      source <( sed -E "s/^([A-Za-z0-9][[:print:]]*)\\(\\) ?\\{$/${__PREFIX}\\1\\(\\) \\{/" < "$__SRC_DIR"/modules/"$file".bash )
    fi
  done
fi

unset __SRC_DIR __PREFIX file

readonly __LOBASH_IMPORT_BASH_LOADED=true
