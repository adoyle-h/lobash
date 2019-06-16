# Prevent multiple executions
[[ -n ${__LOBASH_CONST_LOADED:-} ]] && return

readonly _LOBASH_INTERNAL_FUNC_PREFIX=_lobash_
readonly _LOBASH_PRIVATE_FUNC_PREFIX=_l.
readonly _LOBASH_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_DEFAULT_PREFIX=l.

readonly _LOBASH_IMPORT_ENTRIES=(
  import
  import_category
  import_all
)

if [[ ! -v _lobash_dirname ]]; then
  _lobash_dirname() {
    printf '%s\n' "${1%/*}"
  }
fi

source "$(_lobash_dirname "${BASH_SOURCE[0]}")/../modules/detect_os.bash"

readonly __LOBASH_OS=$(l.detect_os)
unset -f l.detect_os

# Put this line at last
readonly __LOBASH_CONST_LOADED=true
